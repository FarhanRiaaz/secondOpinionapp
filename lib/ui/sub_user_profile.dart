import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' as color;

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:second_opinion_app/di/components/service_locator.dart';
import 'package:second_opinion_app/models/profile/sub_profile_request.dart';
import 'package:second_opinion_app/ui/profile/profile_store.dart';
import 'package:second_opinion_app/widgets/rounded_button_widget.dart';
import 'package:flex_color_picker/flex_color_picker.dart' as flex;
import '../../widgets/textfield_widget.dart';
import '../models/profile/sub_profile_response.dart';
import '../widgets/progress_indicator_widget.dart';

//Todo Profile Image

class SubUserProfile extends StatefulWidget {
  const SubUserProfile({Key? key, required this.subProfileResponse}) : super(key: key);
  final SubProfileResponse subProfileResponse;

  @override
  State<SubUserProfile> createState() => _SubUserProfileState();
}

class _SubUserProfileState extends State<SubUserProfile> {
  List<String> items = ['Male', 'Female'];
  String? selectedGender;
  Color selectedColor = Color(0xFFFFFFFF);
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String? selectedRelationship;
  ProfileStore _profileStore = getIt<ProfileStore>();
  File? _image;

  void initializeScreen() {
    

    setState(() {





      nameController.text = widget.subProfileResponse.name ?? '';
      colorController.text = widget.subProfileResponse.color ?? '';
      if (widget.subProfileResponse.color != null || widget.subProfileResponse.color!.isNotEmpty) {
        selectedColor =
            Color(int.parse('0xFF${widget.subProfileResponse.color!.contains('#') ? '000000' : widget.subProfileResponse.color!}'));
        currentColor =
            Color(int.parse('0xFF${widget.subProfileResponse.color!.contains('#') ? '000000' : widget.subProfileResponse.color!}'));
      }
      final gender = widget.subProfileResponse.gender?.toLowerCase();


      if (gender == "male") {
        selectedGender = "Male";
      } else if (gender == "female") {
        selectedGender = "Female";
      }

      // if (widget.subProfileResponse.gender!.isNotEmpty) {
      //   selectedGender = widget.subProfileResponse.gender?.toUpperCase() ?? 'MALE';
      // } else {
      //   selectedGender = 'MALE';
      // }
      dobController.text = widget.subProfileResponse.age ?? '';
      weightController.text = widget.subProfileResponse.weight ?? '';
      heightController.text = widget.subProfileResponse.height ?? '';
      selectedRelationship = widget.subProfileResponse.relationShip ?? '';
      if (widget.subProfileResponse.relationShip == null || widget.subProfileResponse.relationShip!.isEmpty) {
        selectedRelationship = null; // or you can assign a default value
      }
    });
  }

// create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {

    _profileStore.subProfileRequest = SubProfileRequest(heightUnit:widget.subProfileResponse.heightUnit,weightUnit: widget.subProfileResponse.weightUnit );
    initializeScreen();

    super.initState();
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
      'Sub User',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildBody() {
    return Observer(builder: (context) {
      return _profileStore.isUpdateSubProfileAddInProcess ? CustomProgressIndicatorWidget() : _buildMainContent();
    });
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
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPictureWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      _buildNameField(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildColorField(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildGenderField(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildRelationshipField(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDOBField(),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: _buildWeightField()),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: _buildHeightField()),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: RoundedButtonWidget(
                          buttonText: 'Save',
                          buttonColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            _profileStore.updateSubUserProfile(widget.subProfileResponse.id.toString());
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _profileStore.subProfileRequest?.profileImg = _image;
      });
    }
  }

  Widget _buildPictureWidget() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Choose from gallery'),
                    onTap: () {
                      _getImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Take a photo'),
                    onTap: () {
                      _getImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            if (_image == null && widget.subProfileResponse.profileImg == null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 110,
                  height: 110,
                  color: Colors.lightBlue.shade100,
                  child: Center(
                    child: Text(
                      extractFirstTwoLetters(widget.subProfileResponse.name ?? 'User').toUpperCase(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              )
            else if (widget.subProfileResponse.profileImg != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: widget.subProfileResponse.profileImg!,
                  width: 90,
                  fit: BoxFit.fitWidth,
                ),
              ),
            if (_image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  _image!,
                  width: 90,
                  fit: BoxFit.fitWidth,
                ),
              ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 24,
              ),
            ),
          ],
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

  Widget _buildNameField() {
    return Container(
      child: TextFieldWidget(
        isReadOnly: true,
        hint: 'Enter Your Name',
        inputType: TextInputType.name,
        icon: Icons.person_outline_rounded,
        inputAction: TextInputAction.next,
        autoFocus: false,
        onChanged: (value) {
          _profileStore.subProfileRequest!.name = value;
        },
        onFieldSubmitted: (value) {},
        textController: nameController,
      ),
    );
  }

  Widget _buildColorField() {
    return TextFieldWidget(
      onTap: () async {
        // final pickedColor = await flex.showColorPickerDialog(context, selectedColor);
        // if (pickedColor != null) {
        //   setState(() {
        //     selectedColor = pickedColor;
        //     colorController.text = pickedColor.hex.toString();
        //     _profileStore.subProfileRequest!.color = colorController.text;
        //   });
        // }

        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Choose User Text Color'),
              content: SingleChildScrollView(
                child: color.BlockPicker(
                  pickerColor: currentColor,
                  onColorChanged: changeColor,
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Got it'),
                  onPressed: () {
                    setState(() => currentColor = pickerColor);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

        setState(() {
          selectedColor = currentColor;
          colorController.text = currentColor.hex.toString();
          _profileStore.subProfileRequest!.color = colorController.text;
        });
      },
      hint: 'Choose User Text Color',
      inputType: TextInputType.emailAddress,
      isReadOnly: true,
      icon: Icons.color_lens_outlined,
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {
        _profileStore.subProfileRequest!.color = value;
      },
      onFieldSubmitted: (value) {},
      textController: colorController,
      textStyle: TextStyle(color: selectedColor),
    );
  }

  Widget _buildGenderField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Gender',
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey),
        prefixIcon: Image.asset('assets/icons/Gender.png'),
      ),
      value: selectedGender,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedGender = value!;
          _profileStore.subProfileRequest!.gender = value;
        });
      },
    );
  }

  Widget _buildRelationshipField() {
    List<String> items = ['Parent', 'Child', 'Spouse', 'Sibling'];

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Relationship',
        hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey),
        prefixIcon: Icon(Icons.person_outline_rounded),
      ),
      value: selectedRelationship,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedRelationship = value!;
          _profileStore.subProfileRequest!.relationship = value;
        });
      },
    );
  }

  Widget _buildWeightField() {
    return TextFieldWidget(
      maxLength: 3,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            if (_profileStore.subProfileRequest!.weightUnit == 'pound') {
              _profileStore.subProfileRequest!.weightUnit = 'kg';

              weightController.text = convertPoundsToKg(weightController.text);
              _profileStore.subProfileRequest!.weight = weightController.text;
            } else {
              _profileStore.subProfileRequest!.weightUnit = 'pound';
              weightController.text = convertKgToPounds(weightController.text);
              _profileStore.subProfileRequest!.weight = weightController.text;
            }
          });
        },
        icon: Text(
          _profileStore.subProfileRequest!.weightUnit != 'pound' ? 'kg' : 'lbs',
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      ),
      hint: 'Weight',
      inputType: TextInputType.number,
      imageIcon: 'assets/icons/Weight.png',
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {
        _profileStore.subProfileRequest!.weight = value;
      },
      onFieldSubmitted: (value) {},
      textController: weightController,
    );
  }


  String convertPoundsToKg(String pounds) {
    try {
      double lbs = double.parse(pounds);
      double kg = lbs * 0.45359237;
      return kg.toStringAsFixed(2);
    } catch (e) {
      return "";
    }
  }

  String convertKgToPounds(String kg) {
    try {
      double kilograms = double.parse(kg);
      double pounds = kilograms * 2.20462;
      return pounds.toStringAsFixed(2);
    } catch (e) {
      return "";
    }
  }

  Widget _buildHeightField() {

    print(_profileStore.subProfileRequest!.heightUnit);

    final MaskTextInputFormatter maskFormatterFt =
    MaskTextInputFormatter(mask: '#\'##\"', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);
    final MaskTextInputFormatter maskFormatterCm =
    MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);


    return TextFieldWidget(

      inputFormat: [_profileStore.subProfileRequest!.heightUnit == 'feet' ? maskFormatterFt : maskFormatterCm],
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            if (_profileStore.subProfileRequest!.heightUnit == 'feet') {
              _profileStore.subProfileRequest!.heightUnit = 'cm';

              heightController.text = convertFeetInchToCm(heightController.text);
              _profileStore.subProfileRequest!.height = heightController.text;
            } else {
              _profileStore.subProfileRequest!.heightUnit = 'feet';

              heightController.text = convertCmToFeetInch(heightController.text);
              _profileStore.subProfileRequest!.height = heightController.text;
            }
          });
        },
        icon: Text(
          _profileStore.subProfileRequest!.heightUnit != 'feet' ? 'cm' : 'ft',
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      ),
      hint: 'Height',
      inputType: TextInputType.number,
      imageIcon: 'assets/icons/Scale.png',
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {
        _profileStore.subProfileRequest!.height = value;
      },
      onFieldSubmitted: (value) {},
      textController: heightController,
    );
  }

  String convertCmToFeetInch(String cmString) {
    try {
      int cm = int.parse(cmString);
      int totalInches = (cm / 2.54).round();
      int feet = totalInches ~/ 12;
      int inches = totalInches % 12;
      return "$feet'${inches.toString().padLeft(2, '0')}\"";
    } catch (e) {
      return "";
    }
  }

  String convertFeetInchToCm(String feetInch) {
    try {
      List<String> parts = feetInch.split("'");
      int feet = int.parse(parts[0]);
      int inches = int.parse(parts[1].replaceAll('"', ''));
      int totalInches = (feet * 12 + inches);
      double cm = totalInches * 2.54;
      return cm.toStringAsFixed(0);
    } catch (e) {
      return "";
    }
  }

  Widget _buildDOBField() {
    return TextFieldWidget(
      imageIcon: 'assets/icons/Calender2.png',
      isReadOnly: true,
      onTap: () async {
        final DateTime? selectedDate = await showDatePicker(
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (selectedDate != null) {
          dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
          _profileStore.subProfileRequest!.age = dobController.text;
        }
      },
      hint: 'Enter Your Date of Birth',
      inputType: TextInputType.number,
      icon: Icons.calendar_month_rounded,
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      textController: dobController,
    );
  }
}
