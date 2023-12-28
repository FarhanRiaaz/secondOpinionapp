import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:second_opinion_app/di/components/service_locator.dart';
import 'package:second_opinion_app/models/categories/submitted_opinion_detail_response.dart';
import 'package:second_opinion_app/stores/category/category_store.dart';
import 'package:second_opinion_app/ui/profile/profile_store.dart';
import 'package:second_opinion_app/widgets/progress_indicator_widget.dart';

import '../../models/categories/submitted_opinion_response.dart';
import '../pdf_view.dart';
import '../reports/view_report_image_screen.dart';

class SecondOpinionDetailScreen extends StatefulWidget {
  const SecondOpinionDetailScreen({Key? key, this.submittedOpinion}) : super(key: key);

  final Result? submittedOpinion;

  @override
  State<SecondOpinionDetailScreen> createState() => _SecondOpinionDetailScreenState();
}

class _SecondOpinionDetailScreenState extends State<SecondOpinionDetailScreen> {
  CategoryStore _categoryStore = getIt<CategoryStore>();
  ProfileStore _profileStore = getIt<ProfileStore>();

  int userIndex = -1;

  @override
  void initState() {
    _categoryStore.getSecondOpinionSubmittedDetail(widget.submittedOpinion!.id.toString()).then(
      (value) {
        if (_categoryStore.opinionSubmittedDetailResponse?.request?.request?.user != null) {
          userIndex = _profileStore.currentSubUserProfile!.subProfile!
              .indexWhere((element) => element.id == _categoryStore.opinionSubmittedDetailResponse!.request!.request!.user);
        } else {
          userIndex = -2;
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
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
          Observer(builder: (context) {
            return !_categoryStore.isSubmittedDetailInstanceInProcess
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: _buildUserDetails(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: _buildBookingDetail(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: _buildBody(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        //   child: _buildPaymentDetail(),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // )
                      ],
                    ),
                  )
                : CustomProgressIndicatorWidget(
                    color: Colors.transparent,
                  );
          }),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: _buildLeadingButton(),
      title: _buildTitle(),
      centerTitle: true,
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
      'H3LTH',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildBody() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Attributes',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black),
            ),
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _categoryStore.opinionSubmittedDetailResponse!.requestSubmittedUserData!.length,
            itemBuilder: (BuildContext context, int index) {
              if (_categoryStore.opinionSubmittedDetailResponse!.requestSubmittedUserData![index].typeQ!.contains('MCQ')) {
                return _buildCard(
                  _categoryStore.opinionSubmittedDetailResponse!.requestSubmittedUserData![index],
                );
              } else if (_categoryStore.opinionSubmittedDetailResponse!.requestSubmittedUserData![index].typeQ!.contains('Document')) {
                return _buildDocumentWidget(
                    _categoryStore.opinionSubmittedDetailResponse!.requestSubmittedUserData![index].question?.question ?? '',
                    _categoryStore.opinionSubmittedDetailResponse!.requestSubmittedUserData![index].answer ?? '');
              }
              return _buildTextEditQuestion(
                  _categoryStore.opinionSubmittedDetailResponse!.requestSubmittedUserData![index].question?.question ?? '',
                  _categoryStore.opinionSubmittedDetailResponse!.requestSubmittedUserData![index].answer ?? '');
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    RequestSubmittedUserDatum question,
  ) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question!.question!,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          ...List<Widget>.generate(
            question.question!.options!.length,
            (int i) {
              final option = question.question!.options![i];
              return OptionRadioTile(
                option: option.option!,
                selectedOption: question.answer ?? '',
                value: option.option!,
                onChanged: (String? value) {},
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextEditQuestion(String question, String text) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentWidget(String question, String fileUrl) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                fileUrl.endsWith('.jpg') || fileUrl.endsWith('.png') || fileUrl.endsWith('.jpeg')
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewReportImage(fileName: fileUrl.split('/').last, imageUrl: fileUrl)))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewPDF(
                                  fileName: fileUrl.split('/').last,
                                  pdfURL: fileUrl,
                                )));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 90,
                width: 90,
                child: Center(
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        fileUrl.contains('http') && (fileUrl.endsWith('.jpg') || fileUrl.endsWith('.png') || fileUrl.endsWith('.jpeg'))
                            ? fileUrl
                            : 'https://cdn-icons-png.flaticon.com/512/4208/4208479.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserDetails() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'User Details',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            _categoryStore.opinionSubmittedDetailResponse?.request?.request?.user != null
                ? Column(
                    children: [
                      _buildCardRow(
                          'Name', _categoryStore.opinionSubmittedDetailResponse?.request?.request?.user?.name ?? 'No Name Specified'),
                      Divider(),
                      _buildCardRow(
                          'Gender', _categoryStore.opinionSubmittedDetailResponse?.request?.request?.user?.gender ?? 'No Gender Specified'),
                      Divider(),
                      _buildCardRow('Date of Birth',
                          _categoryStore.opinionSubmittedDetailResponse?.request?.request?.user?.age ?? 'No Age Specified'),
                      Divider(),
                      _buildCardRow('Weight',
                          '${_categoryStore.opinionSubmittedDetailResponse?.request?.request?.user?.weight ?? 'No Weight Specified'} ${_categoryStore.opinionSubmittedDetailResponse?.request?.request?.user?.weightUnit ?? ''}'),
                      Divider(),
                      _buildCardRow('Height',
                          '${_categoryStore.opinionSubmittedDetailResponse?.request?.request?.user?.height ?? 'No Height Specified'} ${_categoryStore.opinionSubmittedDetailResponse?.request?.request?.user?.heightUnit ?? ''}')
                    ],
                  )
                : Column(
                    children: [
                      _buildCardRow('Name',
                          _categoryStore.opinionSubmittedDetailResponse?.request?.request?.mainuser?.user?.name ?? 'No Name Specified'),
                      Divider(),
                      _buildCardRow('Gender',
                          _categoryStore.opinionSubmittedDetailResponse?.request?.request?.mainuser?.gender ?? 'No Gender Specified'),
                      Divider(),
                      _buildCardRow('Date of Birth',
                          _categoryStore.opinionSubmittedDetailResponse?.request?.request?.mainuser?.age ?? 'No Age Specified'),
                      Divider(),
                      _buildCardRow('Weight',
                          '${_categoryStore.opinionSubmittedDetailResponse?.request?.request?.mainuser?.weight ?? 'No Weight Specified'} ${_categoryStore.opinionSubmittedDetailResponse?.request?.request?.mainuser?.weightUnit ?? ''}'),
                      Divider(),
                      _buildCardRow('Height',
                          '${_categoryStore.opinionSubmittedDetailResponse?.request?.request?.mainuser?.height ?? 'No Height Specified'} ${_categoryStore.opinionSubmittedDetailResponse?.request?.request?.mainuser?.heightUnit ?? ''}')
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingDetail() {
    return Observer(
      builder: (context) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Booking Details',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    _buildCardRow(
                        'Field', _categoryStore.opinionSubmittedDetailResponse?.request?.request?.form?.category?.title ?? 'No Field'),
                    Divider(),
                    _buildCardRow(
                        'Created On', DateFormat('MMMM d, yyyy').format(_categoryStore.opinionSubmittedDetailResponse!.request!.createdDate!)),
                    Divider(),
                    _buildCardRowStatus('Status', _categoryStore.opinionSubmittedDetailResponse?.request?.status ?? 'No Status')
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildPaymentDetail() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Payment Details',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                _buildCardRow('Payment Method', 'Card'),
                Divider(),
                _buildCardRow('Voucher', 'DS#675S'),
                Divider(),
                _buildCardRow('Discount', ''),
                Divider(),
                _buildCardRowStatus('Total Amount', '\$98.4')
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCardRow(field, value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(field, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey)),
        Text(value, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildCardRowStatus(field, status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(field, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey)),
        Container(
          decoration: BoxDecoration(
            color: status == 'Pending'
                ? Color(0xfffce7da)
                : status == 'Complete'
                    ? Color(0xffd4fae7)
                    : Color(0xfffadada),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            status,
            style: TextStyle(
              color: status == 'Pending'
                  ? Color(0xfffdae54)
                  : status == 'Complete'
                      ? Color(0xff1ce0a3)
                      : Color(0xFFe35959),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class OptionRadioTile extends StatelessWidget {
  final String option;
  final String selectedOption;
  final String value;
  final void Function(String?) onChanged;

  const OptionRadioTile({
    Key? key,
    required this.option,
    required this.selectedOption,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          activeColor: Theme.of(context).primaryColor,
          value: value,
          groupValue: selectedOption,
          onChanged: onChanged,
        ),
        Text(
          option,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
