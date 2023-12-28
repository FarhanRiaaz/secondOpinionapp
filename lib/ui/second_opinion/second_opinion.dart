import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:second_opinion_app/di/components/service_locator.dart';
import 'package:second_opinion_app/models/categories/opinion_request.dart';
import 'package:second_opinion_app/stores/category/category_store.dart';
import 'package:second_opinion_app/utils/device/device_utils.dart';
import 'package:second_opinion_app/utils/routes/routes.dart';
import 'package:second_opinion_app/widgets/progress_indicator_widget.dart';
import 'package:second_opinion_app/widgets/roundedRectangle_widget.dart';
import 'package:second_opinion_app/widgets/upload_document_widget.dart';

import '../../widgets/second_opinion_upload_widget.dart';
import '../../widgets/textfield_widget.dart';

class SecondOpinionScreen extends StatefulWidget {
  const SecondOpinionScreen({
    Key? key,
    required this.opinionSubmitRequest,
  }) : super(key: key);

  final OpinionSubmitRequest opinionSubmitRequest;

  @override
  State<SecondOpinionScreen> createState() => _SecondOpinionScreenState();
}

class _SecondOpinionScreenState extends State<SecondOpinionScreen> {
  TextEditingController diseaseController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  CategoryStore _categoryStore = getIt<CategoryStore>();

  FilePickerResult? result;

  @override
  void dispose() {
    diseaseController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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

  Widget _buildTitle() {
    return Text(
      'H3LTH',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (context) {
        return !_categoryStore.isOpinionSubmittingInProcess
            ? _buildMainContent()
            : CustomProgressIndicatorWidget(
                color: Colors.transparent,
              );
      }
    );
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
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Please Answer Following Questions',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      _buildDiseaseField(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDescriptionField(),
                      _buildUploadWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: ElevatedButton(
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style
                        ?.copyWith(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade400)),
                    onPressed: () {},
                    child: Text('Previous'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: ElevatedButton(
                    onPressed: () async {
                     await _categoryStore.submitSecondOpinion(widget.opinionSubmitRequest.copyWith(files: combineFilePaths(result)));
                      await showCongradulationsDialog(context);
                      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
                    },
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showCongradulationsDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: 311,
            width: 290,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage("assets/images/background/backgroundPopUp.png"),
                fit: BoxFit.contain,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      child: Image.asset(
                        'assets/images/background/tick-icon.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Center(
                      child: Text(
                        "Thank You!",
                        style: TextStyle(fontSize: 18.0, color: Color(0xFF222B2C)),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "You have successfully made second opinion with us",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, color: Color(0xFFBEBEBE)),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String combineFilePaths(FilePickerResult? result) {
    if (result != null && result.files.isNotEmpty) {
      List<String> filePaths = result.files.map((file) => file.path!).toList();
      return filePaths.join(',');
    }
    return '';
  }

  Widget _buildDiseaseField() {
    return TextFieldWidget(
      hint: 'Enter Disease',
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {
        widget.opinionSubmitRequest.description = '${diseaseController.text}\n${descriptionController.text}';
      },
      onFieldSubmitted: (value) {},
      textController: diseaseController,
    );
  }

  Widget _buildDescriptionField() {
    return TextFieldWidget(
      hint: 'Description',
      inputType: TextInputType.text,
      maxLines: 6,
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {
        widget.opinionSubmitRequest.description = '${diseaseController.text}\n${descriptionController.text}';
      },
      onFieldSubmitted: (value) {},
      errorText: '',
      textController: descriptionController,
    );
  }

  Widget _buildUploadWidget() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      child: InkWell(
        onTap: () async {
          DeviceUtils.hideKeyboard(context);
          result = await FilePicker.platform.pickFiles(
            allowMultiple: true,
          );
          setState(() {});
        },
        child: RoundedRectangularWidget(
            dashPattern: [5, 3],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (result?.files == null || result!.files.isEmpty)
                  Image.asset(
                    'assets/icons/uploadIcon.png',
                    width: 60,
                  ),
                if (result?.files == null || result!.files.isEmpty) SizedBox(height: 16.0),
                if (result?.files == null || result!.files.isEmpty)
                  Text(
                    'Upload Documents',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).primaryColor),
                  ),
                if (result?.files != null && result!.files.isNotEmpty)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
                        itemCount: result?.files.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.file_present_rounded,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          result?.files[index].path?.split('/').last ?? '',
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          result?.files!.removeAt(index);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      )),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            )),
      ),
    );
  }

  Widget _buildProceedButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Proceed'),
      ),
    );
  }

  Widget _buildPickedFileWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.15,
      child: RoundedRectangularWidget(
        dashPattern: [5, 3],
        child: InkWell(
          onTap: () async {
            result = await FilePicker.platform.pickFiles();
            setState(() {});
            if (result != null) {
            } else {}
          },
          child: Center(
              child: result!.files[0].name.endsWith('.jpg') ||
                      result!.files[0].name.endsWith('.png') ||
                      result!.files[0].name.endsWith('.jpeg')
                  ? Image.file(File(result!.files[0].path!))
                  : CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: 'https://cdn-icons-png.flaticon.com/512/4208/4208479.png', // Replace with your placeholder image URL
                    )),
        ),
      ),
    );
  }
}
