import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:second_opinion_app/di/components/service_locator.dart';
import 'package:second_opinion_app/models/profile/sub_profile_response.dart';
import 'package:second_opinion_app/stores/report/report_store.dart';
import 'package:second_opinion_app/ui/reports/report_filter.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/prescription_widget.dart';
import '../../widgets/progress_indicator_widget.dart';
import '../../widgets/upload_document_widget.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key, required this.onBackPressed}) : super(key: key);
  final VoidCallback onBackPressed;

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> with SingleTickerProviderStateMixin {
  ReportFilterOption? filterOption;
  String arrangeBy = 'Ascending';
  String? type;
  SubProfileResponse? user;

  ReportStore _reportStore = getIt<ReportStore>();

  late AnimationController _animationController;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _reportStore.getAllDocumentTypes();
    _reportStore.getFilteredDocumentList(
        filterOption?.getArrangeBy ?? '', filterOption?.user?.name ?? '', filterOption?.type!.title ?? '', _searchController.text);
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildListView() {
    return Observer(builder: (context) {
      return !_reportStore.isFetchDocumentInProcess && !_reportStore.isDeletedInProcess && !_reportStore.isUploadInProcess
          ? ListView.separated(
              padding: EdgeInsets.only(bottom: 80),
              itemCount: _reportStore.getAllDocumentResponseList?.results?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return PrescriptionWidget(
                  reportStore: _reportStore,
                  id: _reportStore.getAllDocumentResponseList!.results![index].id!,
                  result: _reportStore.getAllDocumentResponseList!.results![index],
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
      // leading: _buildLeadingButton(),
      title: _buildTitle(),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      //actions: _buildActions(),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Reports',
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
                controller: _searchController,
                onChanged: (value) {},
                onEditingComplete: () {
                  _reportStore.getFilteredDocumentList(filterOption?.getArrangeBy ?? '', filterOption?.user?.name ?? '',
                      filterOption?.type?.title ?? '', _searchController.text);
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
                        builder: (context) => ReportFilterScreen(
                              selectedArrangeBy: filterOption?.arrangeBy,
                              type: filterOption?.type,
                              user: filterOption?.user,
                            )));

                if (filterOption != null)
                  _reportStore.getFilteredDocumentList(filterOption?.getArrangeBy ?? '', filterOption?.user?.name ?? '',
                      filterOption?.type?.title ?? '', _searchController.text);

                //Todo Change to named Parameter
              },
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Color(0xFF1ce0a3),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
                    child: const UploadDocumentWidget(),
                  ),
                ));
      },
      child: Icon(Icons.add),
    );
  }
}
