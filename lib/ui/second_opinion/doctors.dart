import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:second_opinion_app/di/components/service_locator.dart';
import 'package:second_opinion_app/stores/category/category_store.dart';
import 'package:second_opinion_app/ui/second_opinion/second_opinion_filter.dart';

import 'package:second_opinion_app/widgets/doctors_widget.dart';

import '../../models/profile/sub_profile_response.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/progress_indicator_widget.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  CategoryStore _categoryStore = getIt<CategoryStore>();

  List<Map<String, dynamic>> prescriptionList = List.generate(15, (index) {
    final random = Random();
    final date = DateTime.now().subtract(Duration(days: random.nextInt(30)));
    final doctorName =
        'Dr. ${String.fromCharCode(random.nextInt(26) + 65)}. ${String.fromCharCode(random.nextInt(26) + 97)}. ${String.fromCharCode(random.nextInt(26) + 97)}';
    final specializations = ['Cardiology', 'Neurology', 'Oncology', 'Dermatology', 'Endocrinology'][random.nextInt(5)];
    final statusOptions = ['Pending', 'Complete', 'No Read Message'];
    final status = statusOptions[random.nextInt(3)];
    return {'date': date, 'doctorName': doctorName, 'symptoms': specializations, 'status': status};
  });

  SecondOpinionFilterOption? filterOption;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _categoryStore.getSecondOpinionSubmittedList(
      _searchController.text,
      filterOption?.getArrangeBy ?? '',
      filterOption?.user?.name ?? '',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      // appBar: _buildAppBar(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildListView() {
    return Observer(builder: (context) {
      return _categoryStore.opinionSubmittedResponseFuture.status != FutureStatus.pending
          ? ListView.separated(
              padding: EdgeInsets.only(bottom: 80),
              itemCount: _categoryStore.opinionSubmittedResponse?.results?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, dynamic> prescription = prescriptionList[index];

                final String doctorName = prescription['doctorName'] ?? '';

                return DoctorsWidget(
                  status: _categoryStore.opinionSubmittedResponse?.results?[index].status ?? '',
                  specialization: _categoryStore.opinionSubmittedResponse?.results?[index].request?.form?.category?.title ?? '',
                  dateTime: DateTime.parse(_categoryStore.opinionSubmittedResponse?.results?[index].createdDate ?? ''),
                  doctorName: doctorName, secondOpinionResult:_categoryStore.opinionSubmittedResponse!.results![index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 8,
                );
              },
            )
          : CustomProgressIndicatorWidget(
              color: Colors.white,
            );
    });
  }

  Widget _buildBody() {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: _buildSearchBarWithButton(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: _buildListView(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      // leading: _buildLeadingButton(),
      title: _buildTitle(),
      // actions: _buildAction(),
      centerTitle: true,
    );
  }

  Widget _buildLeadingButton() {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {},
    );
  }

  Widget _buildTitle() {
    return Text(
      'H3LTH',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildSearchBarWithButton() {
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
                onEditingComplete: () {
                  _categoryStore.getSecondOpinionSubmittedList(
                    _searchController.text,
                    filterOption?.getArrangeBy ?? '',
                    filterOption?.user?.name ?? '',
                  );
                },
                controller: _searchController,
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
            ),
            child: IconButton(
              icon: ImageIcon(
                AssetImage('assets/icons/SettingSlider.png'),
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                filterOption = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondOpinionFilterScreen(
                              selectedArrangeBy: filterOption?.arrangeBy,
                              user: filterOption?.user,
                            )));

                if (filterOption != null)
                  _categoryStore.getSecondOpinionSubmittedList(
                    _searchController.text,
                    filterOption?.getArrangeBy ?? '',
                    filterOption?.user?.name ?? '',
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, Routes.categories);
          },
          icon: Icon(Icons.add),
          label: Text('Add'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFec652a)),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAction() {
    return [_buildAddButton()];
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.categories);
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: Color(0xFFec652a),
    );
  }
}

class SecondOpinionFilterOption {
  String? arrangeBy;

  SubProfileResponse? user;

  SecondOpinionFilterOption({
    required this.arrangeBy,
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
