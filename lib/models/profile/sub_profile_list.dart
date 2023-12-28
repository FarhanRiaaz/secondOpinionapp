import 'package:second_opinion_app/models/profile/sub_profile_response.dart';

class SubProfileList {
  final List<SubProfileResponse>? subProfile;

  SubProfileList({
    this.subProfile,
  });

  factory SubProfileList.fromJson(List<dynamic> json) {
    List<SubProfileResponse> subProfiles = <SubProfileResponse>[];
    subProfiles = json
        .map((subProfile) => SubProfileResponse.fromMap(subProfile))
        .toList();

    return SubProfileList(
      subProfile: subProfiles,
    );
  }
}
