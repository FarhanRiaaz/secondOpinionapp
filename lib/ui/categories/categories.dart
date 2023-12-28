import 'package:cached_network_image/cached_network_image.dart';
import 'package:second_opinion_app/stores/category/category_store.dart';
import 'package:second_opinion_app/stores/post/post_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:second_opinion_app/ui/profile/profile_store.dart';
import '../../di/components/service_locator.dart';
import '../home/categories_widget.dart';

class CategoriesScreen extends StatefulWidget {
  final bool? autoFocus;

  const CategoriesScreen({super.key, this.autoFocus = false});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  //stores:---------------------------------------------------------------------
  late PostStore _postStore;
  CategoryStore _categoryStore = getIt<CategoryStore>();
  ProfileStore _profileStore = getIt<ProfileStore>();

  static const placeholderImage =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png';

  final focusNode = FocusNode();

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    print(widget.autoFocus);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores

    _postStore = Provider.of<PostStore>(context);

    // check to see if already called api
    if (!_postStore.loading) {
      _postStore.getPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async {
          _categoryStore.getAllCategories();
          return true;
        },
        child: _buildBody(),
      ),
    );
  }

  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: _buildLeadingButton(),
      centerTitle: true,
      title: _buildTitle(),
      actions: _buildActions(context),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Categories',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildLeadingButton() {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        _categoryStore.getAllCategories();
        Navigator.pop(context);
      },
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      //_buildNotificationButton(),
      //_buildAvatarButton(),
      // _buildThemeButton(),
      //_buildLogoutButton(),
    ];
  }

  Widget _buildAvatarButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          // Do something when the button is tapped
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

  Widget _buildSearchBarWithButton() { WidgetsBinding.instance!.addPostFrameCallback((_) {
    FocusScope.of(context).autofocus(focusNode);
  });
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: TextField(
                focusNode: widget.autoFocus! ? focusNode : null,
                controller: _searchController,
                onChanged: (value) {},
                onEditingComplete: () {
                  _categoryStore.getFilteredCategories(_searchController.text);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFFCCD2D8),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      FocusScope.of(context).autofocus(focusNode);
    });

    return TextField(
      autofocus: widget.autoFocus!,
      focusNode: widget.autoFocus! ? focusNode : null,
      onChanged: (value) {
        _categoryStore.getFilteredCategories(value);
      },
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
      onPressed: () {},
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return _buildMainContent();
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return Stack(
          children: [
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
            Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSearchBarWithButton(),
                        _buildGridView(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildGridView() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _categoryStore.allCategoryList == null ? 0 : _categoryStore.allCategoryList?.allCategoryList?.length,
        itemBuilder: (context, index) => MedicalFieldGridTile(
          category: _categoryStore.allCategoryList!.allCategoryList![index] ,

        ),
      ),
    );
  }
}
