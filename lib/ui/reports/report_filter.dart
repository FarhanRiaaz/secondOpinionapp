import 'package:flutter/material.dart';
import 'package:second_opinion_app/di/components/service_locator.dart';
import 'package:second_opinion_app/models/profile/sub_profile_response.dart';
import 'package:second_opinion_app/models/report/get_report_type_response.dart';
import 'package:second_opinion_app/stores/report/report_store.dart';
import 'package:second_opinion_app/stores/user/user_store.dart';
import 'package:second_opinion_app/ui/profile/profile_store.dart';

class ReportFilterScreen extends StatefulWidget {
  const ReportFilterScreen({Key? key, required this.selectedArrangeBy, required this.type, required this.user}) : super(key: key);

  final String? selectedArrangeBy;
  final ReportTypeResponse? type;
  final SubProfileResponse? user;

  @override
  State<ReportFilterScreen> createState() => _ReportFilterScreenState();
}

class _ReportFilterScreenState extends State<ReportFilterScreen> {
  ProfileStore _profileStore = getIt<ProfileStore>();
  ReportStore _reportStore = getIt<ReportStore>();

  List<String> status = ['All', 'Pending', 'Complete', 'Incomplete'];

  List<String> arrangedBy = [
    'Ascending',
    'Descending',
  ];
  List<String> selectedArrangedByCategories = [];

  List<String> categories = ['Cardiology', 'Neurology', 'Nephrology', 'Ontology'];
  List<SubProfileResponse> selectedCategories = [];

  List<ReportTypeResponse> selectedType = [];

  @override
  void initState() {
    if (widget.type != null) {
      selectedType.add(widget.type!);
    }
    if (widget.selectedArrangeBy != null) {
      selectedArrangedByCategories.add(widget.selectedArrangeBy!);
      print(selectedArrangedByCategories[0]);
    }
    if (widget.user != null) {
      selectedCategories.add(widget.user!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: _buildLeadingButton(),
      centerTitle: true,
      title: _buildTitle(),
    );
  }

  Widget _buildLeadingButton() {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildBody() {
    return _buildMainContent();
  }

  Widget _buildMainContent() {
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
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildArrangeByFilter(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildTypeFilter(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildCategoryFilter(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          ReportFilterOption(
                              arrangeBy: selectedArrangedByCategories.isNotEmpty ? selectedArrangedByCategories[0] : null,
                              type: selectedType.isNotEmpty ? selectedType[0] : null,
                              user: selectedCategories.isNotEmpty ? selectedCategories[0] : null));
                    },
                    child: Text('Apply'),
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFccd2d8),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF6e6e6e),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedArrangedByCategories = [];
                        selectedType = [];
                        selectedCategories = [];
                      });
                    },
                    child: Text('Reset'),
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }

  Widget _buildArrangeByFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Arranged By',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8.0,
          children: arrangedBy.map((category) {
            return FilterChip(
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              elevation: 1,
              backgroundColor: Colors.white,
              showCheckmark: false,
              selectedColor: Color(0xFFcff4fa),
              label: !selectedArrangedByCategories.contains(category)
                  ? Text(category)
                  : Text(
                      category,
                      style: TextStyle(color: Color(0xFF16caea)),
                    ),
              selected: selectedArrangedByCategories.contains(category),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedArrangedByCategories = [];
                    selectedArrangedByCategories.add(category);
                  } else {
                    selectedArrangedByCategories.remove(category);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Users',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8.0,
          children: _profileStore.currentSubUserProfile!.subProfile!.map((user) {
            return FilterChip(
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              elevation: 1,
              backgroundColor: Colors.white,
              showCheckmark: false,
              selectedColor: Color(0xFFcff4fa),
              label: !selectedCategories.contains(user)
                  ? Text(
                      user.name!,
                    )
                  : Text(
                      user.name!,
                      style: TextStyle(color: Color(int.parse('0xFF${user.color}'))),
                    ),
              selected: selectedCategories.contains(user),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedCategories = [];
                    selectedCategories.add(user);
                  } else {
                    selectedCategories.remove(user);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTypeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8.0,
          children: _reportStore.getAllDocumentTypeResponseList!.allReportTypeResponse!.map((category) {
            return FilterChip(
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              elevation: 1,
              backgroundColor: Colors.white,
              showCheckmark: false,
              selectedColor: Color(0xFFcff4fa),
              label: !selectedType.contains(category)
                  ? Text(category.title!)
                  : Text(
                      category.title!,
                      style: TextStyle(color: Color(0xFF16caea)),
                    ),
              selected: selectedType.contains(category),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedType = [];
                    selectedType.add(category);
                  } else {
                    selectedType.remove(category);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      'Filter',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class ReportFilterOption {
  String? arrangeBy;
  ReportTypeResponse? type;
  SubProfileResponse? user;

  ReportFilterOption({
    required this.arrangeBy,
    required this.type,
    required this.user,
  });

  String get getArrangeBy {
    if (arrangeBy == 'Ascending') {
      return 'asc';
    } else {
      return 'dsc';
    }
  }
}
