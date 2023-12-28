import 'package:flutter/material.dart';

import '../../widgets/textfield_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  bool currentObscure = true;
  bool newObscure = true;
  bool confirmObscure = true;

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(backgroundColor: Colors.transparent,
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
      'Change Password',
      style: Theme.of(context).textTheme.headlineMedium,
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
            SizedBox(height: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildCurrentPassword(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildNewPassword(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildConfirmPassword(),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: MediaQuery.of(context).viewInsets.bottom + 8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: _buildProceedButton(),
            ),
          ),
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }

  Widget _buildCurrentPassword() {
    return TextFieldPasswordWidget(
      isObscure: currentObscure,
      hint: 'Enter Current Password',
      inputType: TextInputType.number,
      icon: Icons.credit_card,
      imageIcon: 'assets/icons/CreditCard.png',
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      textController: confirmNewPassword,
      onPasswordToggle: () {
        setState(() {
          currentObscure = !currentObscure;
        });
      },
    );
  }

  Widget _buildNewPassword() {
    return TextFieldPasswordWidget(
      isObscure: newObscure,
      hint: 'Enter New Password',
      inputType: TextInputType.visiblePassword,
      imageIcon: 'assets/icons/Key.png',
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      textController: confirmNewPassword,
      onPasswordToggle: () {
        setState(() {
          newObscure = !newObscure;
        });
      },
    );
  }

  Widget _buildConfirmPassword() {
    return TextFieldPasswordWidget(
      isObscure: confirmObscure,
      hint: 'Confirm New Password',
      inputType: TextInputType.visiblePassword,
      imageIcon: 'assets/icons/Key.png',
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      textController: confirmNewPassword,
      onPasswordToggle: () {
        setState(() {
          confirmObscure = !confirmObscure;
        });
      },
    );
  }

  Widget _buildProceedButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        child: Text('Save and Continue'),
      ),
    );
  }
}
