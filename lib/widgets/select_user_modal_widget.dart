import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:second_opinion_app/constants/app_theme.dart';
import 'package:second_opinion_app/di/components/service_locator.dart';
import 'package:second_opinion_app/models/categories/submitted_opinion_response.dart';
import 'package:second_opinion_app/models/profile/sub_profile_response.dart';
import 'package:second_opinion_app/ui/profile/profile_store.dart';

import '../models/categories/all_category_response.dart';
import '../ui/categories/questions.dart';
import '../utils/routes/routes.dart';

class SelectUserModal extends StatefulWidget {
  const SelectUserModal({Key? key, required this.category}) : super(key: key);

  final GetAllCategoryResponse category;

  @override
  State<SelectUserModal> createState() => _SelectUserModalState();
}

class _SelectUserModalState extends State<SelectUserModal> {
  ProfileStore _profileStore = getIt<ProfileStore>();
  SubProfileResponse _selectedOption = SubProfileResponse();
  static const placeholderImage =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Select User',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: _profileStore.currentSubUserProfile?.subProfile?.length ?? 0,
              itemBuilder: (BuildContext context, int index) => Card(
                elevation: 1,
                child: RadioListTile<SubProfileResponse>(
                  activeColor: AppThemeData.themeData().primaryColor,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              _profileStore.currentSubUserProfile?.subProfile?[index].profileImg ?? placeholderImage),
                        ),
                        SizedBox(width: 8.0),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _profileStore.currentSubUserProfile?.subProfile?[index].name ?? '',
                              style: TextStyle(
                                color: Color(int.parse('0xFF${_profileStore.currentSubUserProfile!.subProfile![index].color}')),
                              ),
                            ),
                            Text(
                              _profileStore.currentSubUserProfile?.subProfile?[index].relationShip ?? '',
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Color(0xFF8b8b8b)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  value: _profileStore.currentSubUserProfile!.subProfile![index],
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  selected: _selectedOption == _profileStore.currentSubUserProfile?.subProfile?[index].id,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_selectedOption.name!=null) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionsScreen(user: _selectedOption,category: widget.category,)));
                }else{
                  FlushbarHelper.createError(message: 'Select a User')..show(context);

                }
              },
              child: Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
