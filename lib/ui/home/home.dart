import 'dart:async';

import 'package:animations/animations.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:second_opinion_app/constants/app_theme.dart';
import 'package:second_opinion_app/data/sharedpref/constants/preferences.dart';
import 'package:second_opinion_app/di/components/service_locator.dart';
import 'package:second_opinion_app/models/home/home_api_response.dart';
import 'package:second_opinion_app/stores/category/category_store.dart';
import 'package:second_opinion_app/ui/add_user.dart';
import 'package:second_opinion_app/ui/categories/categories.dart';
import 'package:second_opinion_app/ui/profile/profile_store.dart';
import 'package:second_opinion_app/utils/routes/routes.dart';
import 'package:second_opinion_app/stores/language/language_store.dart';
import 'package:second_opinion_app/stores/post/post_store.dart';
import 'package:second_opinion_app/stores/theme/theme_store.dart';
import 'package:second_opinion_app/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:provider/provider.dart';
import 'package:second_opinion_app/widgets/progress_indicator_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'categories_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String greetingMessage = '';

  //stores:---------------------------------------------------------------------
  late PostStore _postStore;

  CategoryStore _categoryStore = getIt<CategoryStore>();
  ProfileStore _profileStore = getIt<ProfileStore>();

  int currentPageIndex = 0;
  PageController _pageController = PageController();

  Timer? _timer;
  static const _duration = Duration(seconds: 8);

  @override
  void dispose() {
    _stopTimer();
    _pageController.dispose();
    super.dispose();
  }

  void initializeGreetingMessage() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;

    if (currentHour < 6) {
      greetingMessage = 'Good night';
    } else if (currentHour < 12) {
      greetingMessage = 'Good morning';
    } else if (currentHour < 18) {
      greetingMessage = 'Good afternoon';
    } else {
      greetingMessage = 'Good evening';
    }
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _startTimer() {
    _timer = Timer.periodic(_duration, (_) {
      if (currentPageIndex < (_categoryStore.sliderImageResponse?.allSliderImageResponse?.length ?? 0) - 1) {
        currentPageIndex++;
      } else {
        currentPageIndex = 0;
      }
      _pageController.animateToPage(
        currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    initializeGreetingMessage();
    _categoryStore.getAllCategories();
    _profileStore.getProfile().then((value) {
      _profileStore.getSubUserProfiles();
    });

    _categoryStore.getSliderImages().then((value) {
      _startTimer();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _postStore = Provider.of<PostStore>(context);
  }

  static const placeholderImage =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Observer(builder: (context) {
        return _buildBody();
      }),
    );
  }

  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Image.asset(
          'assets/icons/icon.png',
          scale: 3.1,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: _buildLeadingButton(),
      actions: _buildActions(context),
    );
  }

  Widget _buildLeadingButton() {
    return IconButton(
      icon: ImageIcon(AssetImage(
        'assets/icons/Headphones.png',
      )),
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.support);
      },
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildNotificationButton(),
      _buildAvatarButton(),
      // _buildThemeButton(),
      //_buildLogoutButton(),
    ];
  }

  Widget _buildAvatarButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.profile);
        },
        customBorder: CircleBorder(),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 18,
          backgroundImage: CachedNetworkImageProvider(
            _profileStore.currentUserProfile?.profileImg ?? placeholderImage,
          ),
        ),
      ),
    );
  }

  Widget _buildGoodMorningText() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '👋 $greetingMessage!',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          _profileStore.currentUserProfile?.name ?? '',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 300),
      middleColor: Colors.white,
      transitionType: ContainerTransitionType.fade,
      closedElevation: 0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      closedColor: Colors.white,
      openBuilder: (BuildContext context, VoidCallback _) {
        // Replace the return statement with the desired widget to be shown when opened (e.g., another page)
        return CategoriesScreen(
          autoFocus: true,
        );
      },
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return GestureDetector(
          onTap: openContainer,
          child: TextField(
            readOnly: true,
            onTap: openContainer,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFFCCD2D8),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.24,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            allowImplicitScrolling: true,
            itemCount: _categoryStore.sliderImageResponse?.allSliderImageResponse?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.transparent,
                elevation: 0,
                child: CachedNetworkImage(
                  imageUrl: _categoryStore.sliderImageResponse!.allSliderImageResponse![index].image!,
                  fit: BoxFit.fitWidth,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSmoothIndicator(
                activeIndex: currentPageIndex,
                count: _categoryStore.sliderImageResponse?.allSliderImageResponse?.length ?? 0,
                effect: ScrollingDotsEffect(
                  activeDotColor: AppThemeData.themeData().primaryColor,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationButton() {
    return IconButton(
      icon: Stack(
        children: const [
          ImageIcon(AssetImage(
            'assets/icons/BellIcon.png',
          )),
          Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.redAccent,
              child: Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
      onPressed: () {
        Navigator.pushNamed(context, Routes.notification);
      },
    );
  }

  Widget _buildCategories() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF222B2C)),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoriesScreen(
                                autoFocus: true,
                              )));
                },
                child: const Text(
                  'See all',
                  style: TextStyle(color: Color(0xFF16CAEA)),
                ))
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: (_categoryStore.allCategoryList?.allCategoryList?.length ?? 0).clamp(0, 6),
          itemBuilder: (context, index) => MedicalFieldGridTile(
            category: _categoryStore.allCategoryList!.allCategoryList![index],
          ),
        )
      ],
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Opacity(opacity: 0.25, child: Image.asset('assets/images/background/bottomRight.png')),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Opacity(opacity: 0.25, child: Image.asset('assets/images/background/topLeft.png')),
          ),
        ),
        _handleErrorMessage(),
        _profileStore.isSubProfileInProcess || _profileStore.isProfileInProcess
            ? CustomProgressIndicatorWidget(
                color: Colors.transparent,
              )
            : _buildMainContent(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return Column(
          children: [
            _buildAppBar(),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildGoodMorningText(),
                      SizedBox(
                        height: 20,
                      ),
                      _buildCard(),
                      _buildMyUser(),
                      SizedBox(
                        height: 20,
                      ),
                      _buildSearchBar(),
                      SizedBox(
                        height: 20,
                      ),
                      _buildCategories(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMyUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8),
        Text(
          'My Users',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        SizedBox(height: 8),
        Observer(builder: (context) {
          return SizedBox(
            width: double.infinity,
            height: 70,
            child: Stack(
              children: [
                if ((_profileStore.currentSubUserProfile!.subProfile!.length) >= 4)
                  Positioned(
                    left: 75,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.myUsers);
                      },
                      child: Container(
                        height: 70,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: _profileStore.currentSubUserProfile
                                          ?.subProfile?[_profileStore.currentSubUserProfile!.subProfile!.length - 4].profileImg !=
                                      null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 18,
                                      backgroundImage: CachedNetworkImageProvider(
                                        _profileStore.currentSubUserProfile
                                                ?.subProfile?[_profileStore.currentSubUserProfile!.subProfile!.length - 4].profileImg ??
                                            placeholderImage,
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.lightBlue.shade100,
                                      radius: 18,
                                      child: Text(extractFirstTwoLetters(_profileStore.currentSubUserProfile
                                                  ?.subProfile?[_profileStore.currentSubUserProfile!.subProfile!.length - 4].name ??
                                              '')
                                          .toUpperCase()),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if ((_profileStore.currentSubUserProfile!.subProfile!.length) >= 3)
                  Positioned(
                    left: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.myUsers);
                      },
                      child: Container(
                        height: 70,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: _profileStore.currentSubUserProfile
                                          ?.subProfile?[_profileStore.currentSubUserProfile!.subProfile!.length - 3].profileImg !=
                                      null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 18,
                                      backgroundImage: CachedNetworkImageProvider(
                                        _profileStore.currentSubUserProfile
                                                ?.subProfile?[_profileStore.currentSubUserProfile!.subProfile!.length - 3].profileImg ??
                                            placeholderImage,
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.lightBlue.shade100,
                                      radius: 18,
                                      child: Text(extractFirstTwoLetters(_profileStore.currentSubUserProfile
                                                  ?.subProfile?[_profileStore.currentSubUserProfile!.subProfile!.length - 3].name ??
                                              '')
                                          .toUpperCase()),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if ((_profileStore.currentSubUserProfile!.subProfile!.length) >= 2)
                  Positioned(
                    left: 25,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.myUsers);
                      },
                      child: Container(
                        height: 70,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: _profileStore.currentSubUserProfile
                                          ?.subProfile?[_profileStore.currentSubUserProfile!.subProfile!.length - 2].profileImg !=
                                      null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 18,
                                      backgroundImage: CachedNetworkImageProvider(
                                        _profileStore.currentSubUserProfile
                                                ?.subProfile?[_profileStore.currentSubUserProfile!.subProfile!.length - 2].profileImg ??
                                            placeholderImage,
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.lightBlue.shade100,
                                      radius: 18,
                                      child: Text(extractFirstTwoLetters(_profileStore.currentSubUserProfile
                                                  ?.subProfile?[_profileStore.currentSubUserProfile!.subProfile!.length - 2].name ??
                                              '')
                                          .toUpperCase()),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (_profileStore.currentSubUserProfile != null || _profileStore.currentUserProfile != null)
                  Positioned(
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.myUsers);
                      },
                      child: Container(
                        height: 70,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 18,
                                backgroundImage: CachedNetworkImageProvider(
                                  _profileStore.currentUserProfile?.profileImg ?? placeholderImage,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  left: ((_profileStore.currentSubUserProfile!.subProfile!.length - 1).clamp(0, 3) * 25) + 25,
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            print(_profileStore.currentSubUserProfile!.subProfile!.length);
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserScreen()));
                            _profileStore.getSubUserProfiles();
                            print(_profileStore.currentSubUserProfile!.subProfile![2].name);
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              radius: 18,
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  String extractFirstTwoLetters(String text) {
    if (text.length >= 2) {
      return text.substring(0, 2);
    }
    return text; // Return the full string if it has less than 2 characters
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_postStore.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_postStore.errorStore.errorMessage);
        }

        return SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: AppLocalizations.of(context).translate('home_tv_error'),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }
}

class RoundIconWidget extends StatelessWidget {
  final IconData icon;
  final double elevation;

  RoundIconWidget({required this.icon, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shape: CircleBorder(),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
