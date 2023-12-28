import 'dart:io';

import 'package:age_calculator/age_calculator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:second_opinion_app/ui/profile/profile_store.dart';
import 'package:second_opinion_app/widgets/rounded_button_widget.dart';
import 'package:image_picker/image_picker.dart';
import '../../di/components/service_locator.dart';
import '../../widgets/progress_indicator_widget.dart';
import '../../widgets/textfield_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  ProfileStore _profileStore = getIt<ProfileStore>();

  String? dialCode = '+1';

  File? _image;

  List<String> items = ['Male', 'Female'];
  String? selectedGender;

  bool isLbs = true;

  bool isCm = true;

  @override
  void initState() {
    _profileStore.getProfile().then((value) {
      popUpTheData().then((value) {});
    });
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    popUpTheData();
    super.didChangeDependencies();
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
      backgroundColor: Colors.white10.withOpacity(0.1),
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
      'Profile',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildBody() {
    return Observer(builder: (context) {
      return _profileStore.isProfileInProcess ? CustomProgressIndicatorWidget() : _buildMainContent();
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
                      _buildEmailField(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildPhoneField(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildGenderField(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildAgeField(),
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
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: RoundedButtonWidget(
                          buttonText: 'Save',
                          buttonColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            final String age;
                            if (ageController.text.isEmpty) {
                              if (_profileStore.currentUserProfile?.age == null || _profileStore.currentUserProfile!.age!.isEmpty) {
                                age = '0';
                              } else {
                                age = _profileStore.currentUserProfile!.age!;
                              }
                            } else {
                              age = ageController.text;
                            }
                            _profileStore.currentUserProfile!.phone = '${dialCode!} ${mobileController.text}';
                            _profileStore.updateProfile(
                                selectedGender ?? _profileStore.currentUserProfile!.gender!, int.parse(age), _image ?? null);
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
            if (_image == null && _profileStore.currentUserProfile?.profileImg == null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/profilePicture.png',
                  width: 90,
                  fit: BoxFit.fitWidth,
                ),
              )
            else if (_profileStore.currentUserProfile?.profileImg != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: _profileStore.currentUserProfile!.profileImg!,
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

  Widget _buildNameField() {
    return Container(
      child: TextFieldWidget(
        isReadOnly: true,
        hint: 'Enter Your Name',
        inputType: TextInputType.name,
        icon: Icons.person_outline_rounded,
        inputAction: TextInputAction.next,
        autoFocus: false,
        onChanged: (value) {},
        onFieldSubmitted: (value) {},
        onTap: () {},
        textController: nameController,
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFieldWidget(
      isReadOnly: true,
      hint: 'Enter Your Email',
      inputType: TextInputType.emailAddress,
      icon: Icons.email_outlined,
      inputAction: TextInputAction.next,
      autoFocus: false,
      imageIcon: 'assets/icons/Mail.png',
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      textController: emailController,
    );
  }

  Widget _buildPhoneField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CountryCodePicker(
            initialSelection: dialCode,
            onChanged: (CountryCode? countryCode) {
              dialCode = countryCode?.dialCode;
              _profileStore.currentUserProfile!.phone = '${countryCode!.dialCode} ${mobileController.text}';
              print(_profileStore.currentUserProfile!.phone);
            },
          ),
          Expanded(
            child: TextFieldWidget(
              hint: 'Enter Your Mobile Number',
              inputType: TextInputType.phone,
              inputFormat: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              inputAction: TextInputAction.next,
              onChanged: (value) {
                _profileStore.currentUserProfile!.phone = '${dialCode!} ${mobileController.text}';
                print(_profileStore.currentUserProfile!.phone);
              },
              onFieldSubmitted: (value) {},
              textController: mobileController,
            ),
          ),
        ],
      ),
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
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedGender = value!;
          _profileStore.currentUserProfile!.gender = value;
          print(value);
        });
      },
    );
  }

  Widget _buildWeightField() {
    return TextFieldWidget(
      hint: 'Weight',
      inputType: TextInputType.number,
      imageIcon: 'assets/icons/Weight.png',
      inputAction: TextInputAction.next,
      autoFocus: false,
      maxLength: 3,
      onChanged: (value) {
        _profileStore.currentUserProfile!.weight = value;
      },
      onFieldSubmitted: (value) {},
      textController: weightController,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            if (_profileStore.currentUserProfile!.weightUnit == 'pound') {
              _profileStore.currentUserProfile!.weightUnit = 'kg';
              weightController.text = convertPoundsToKg(weightController.text);
              _profileStore.currentUserProfile!.weight = weightController.text;
            } else {
              _profileStore.currentUserProfile!.weightUnit = 'pound';
              weightController.text = convertKgToPounds(weightController.text);
              _profileStore.currentUserProfile!.weight = weightController.text;
            }
          });
        },
        icon: Text(
          _profileStore.currentUserProfile!.weightUnit != 'pound' ? 'kg' : 'lbs',
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildHeightField() {
    final MaskTextInputFormatter maskFormatterFt =
        MaskTextInputFormatter(mask: '#\'##\"', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);
    final MaskTextInputFormatter maskFormatterCm =
        MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);

    return TextFieldWidget(
      hint: 'Height',
      inputType: TextInputType.numberWithOptions(decimal: true),
      inputFormat: [_profileStore.currentUserProfile!.heightUnit == 'feet' ? maskFormatterFt : maskFormatterCm],
      icon: Icons.height_rounded,
      imageIcon: 'assets/icons/Scale.png',
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {
        _profileStore.currentUserProfile!.height = value;
      },
      onFieldSubmitted: (value) {},
      textController: heightController,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            if (_profileStore.currentUserProfile!.heightUnit == 'feet') {
              _profileStore.currentUserProfile!.heightUnit = 'cm';
              heightController.text = convertFeetInchToCm(heightController.text);
              _profileStore.currentUserProfile!.height = heightController.text;
            } else {
              _profileStore.currentUserProfile!.heightUnit = 'feet';
              heightController.text = convertCmToFeetInch(heightController.text);
              _profileStore.currentUserProfile!.height = heightController.text;
            }
          });
        },
        icon: Text(
          _profileStore.currentUserProfile!.heightUnit != 'feet' ? 'cm' : 'ft',
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      ),
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

  Widget _buildAgeField() {
    return Observer(builder: (context) {
      return TextFieldWidget(
        hint: 'Age',
        isReadOnly: true,
        inputType: TextInputType.number,
        icon: Icons.person_outline_rounded,
        textController: ageController,
        inputAction: TextInputAction.next,
        onTap: () {
          _selectDate(context);
        },
        onChanged: (value) {
          _profileStore.currentUserProfile!.age = value;
        },
        onFieldSubmitted: (value) {},
      );
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        ageController.text = calculateAge(pickedDate);
        _profileStore.currentUserProfile!.age = ageController.text;
      });
    }
  }

  String calculateAge(DateTime date) {
    DateDuration duration = AgeCalculator.age(date, today: DateTime.now());
    int years = duration.years;
    int months = duration.months;
    int days = duration.days;

    if (years < 18) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Age'),
          content: Text('Age must be at least 18 years.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      return '';
    }

    return '$years';
  }

  Future<void> popUpTheData() async {
    print('object');
    if (_profileStore.isProfileInProcess) nameController = TextEditingController(text: _profileStore.currentUserProfile?.name ?? "");
    ;
    emailController = TextEditingController(text: _profileStore.currentUserProfile?.email ?? "");
    ;
    if (_profileStore.isProfileInProcess) {
      final gender = _profileStore.currentUserProfile?.gender?.toLowerCase();

      if (gender == "male") {
        selectedGender = "Male";
      } else if (gender == "female") {
        selectedGender = "Female";
      }
    }

    if (_profileStore.isProfileInProcess) ageController = TextEditingController(text: _profileStore.currentUserProfile?.age ?? "");
    ;
    if (_profileStore.isProfileInProcess) heightController = TextEditingController(text: _profileStore.currentUserProfile?.height ?? "");
    if (_profileStore.isProfileInProcess) {
      dialCode = (_profileStore.currentUserProfile?.phone ?? "").split(' ').first;
      mobileController.text = (_profileStore.currentUserProfile?.phone ?? "").replaceAll(' ', '').substring(dialCode!.length);
      // mobileController = TextEditingController(text: _profileStore.currentUserProfile?.phone ?? "");
    }
    ;
    if (_profileStore.isProfileInProcess) weightController = TextEditingController(text: _profileStore.currentUserProfile?.weight ?? "");
    setState(() {});
  }
}
