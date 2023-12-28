import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:second_opinion_app/models/home/home_api_response.dart';
import 'package:second_opinion_app/models/profile/sub_profile_response.dart';
import 'package:second_opinion_app/ui/profile/profile_store.dart';
import 'package:second_opinion_app/ui/sub_user_profile.dart';
import 'package:second_opinion_app/utils/routes/routes.dart';
import 'package:second_opinion_app/widgets/helper/DialogHelper.dart';

import '../di/components/service_locator.dart';
import 'add_user.dart';

class MyUsers extends StatefulWidget {
  const MyUsers({Key? key}) : super(key: key);

  @override
  State<MyUsers> createState() => _MyUsersState();
}

class _MyUsersState extends State<MyUsers> {
  ProfileStore _profileStore = getIt<ProfileStore>();

  static const placeholderImage =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png';

  @override
  void initState() {
    _profileStore.getSubUserProfiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: _buildTitle(),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: _buildLeadingButton(),
    );
  }

  _buildBody() {
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSearchBarWithButton(),
                    Expanded(child: Observer(builder: (context) {
                      return _buildCardList();
                    })),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLeadingButton() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildTitle() {
    return Text(
      'Sub User',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildSearchBarWithButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
          SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
            ),
            child: IconButton(
              icon: Icon(Icons.add_circle_outline_rounded),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount:
          _profileStore.currentSubUserProfile?.subProfile?.length == null ? 0 : _profileStore.currentSubUserProfile!.subProfile!.length - 1,
      itemBuilder: (BuildContext context, int index) {
        return _buildUserWidget(
            _profileStore.currentSubUserProfile!.subProfile![index].name!,
            _profileStore.currentSubUserProfile!.subProfile![index].gender!,
            _profileStore.currentSubUserProfile?.subProfile?[index].profileImg  ,
            _profileStore.currentSubUserProfile!.subProfile![index]);
      },
    );
  }

  Widget _buildUserWidget(String name, String relation, String? imageUrl, SubProfileResponse subProfileResponse) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubUserProfile(
                      subProfileResponse: subProfileResponse,
                    )));
        //Todo change to SubUser Profile
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:imageUrl!=null? CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ):Container(color: Colors.lightBlue.shade100,child: Center(child: Text(extractFirstTwoLetters(name).toUpperCase())),height: 50,width: 50,),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(int.parse('0xFF${subProfileResponse.color}'))),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      relation,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildActionWidget(
                      icon: Icons.delete_outline,
                      onPressed: () async {
                        DialogHelper.showUserDeleteConfirmationDialog(context, subProfileResponse.name!, () async {
                          await _profileStore.deleteSubUserProfile(subProfileResponse.id!);
                          _profileStore.getSubUserProfiles();
                          Navigator.pop(context);
                        });
                      },
                      context: context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String extractFirstTwoLetters(String text) {
    if (text.length >= 2) {
      return text.substring(0, 2);
    }
    return text; // Return the full string if it has less than 2 characters
  }
  Widget _buildActionWidget({
    required IconData icon,
    required VoidCallback onPressed,
    required BuildContext context,
  }) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        child: IconButton(
          splashRadius: 10,
          color: Theme.of(context).primaryColor,
          onPressed: onPressed,
          icon: Icon(icon, size: 15),
        ),
      ),
    );
  }
}
