import 'package:another_flushbar/flushbar_helper.dart';
import 'package:second_opinion_app/constants/assets.dart';
import 'package:second_opinion_app/data/sharedpref/constants/preferences.dart';
import 'package:second_opinion_app/stores/user/user_store.dart';
import 'package:second_opinion_app/utils/routes/routes.dart';
import 'package:second_opinion_app/stores/form/form_store.dart';
import 'package:second_opinion_app/stores/theme/theme_store.dart';
import 'package:second_opinion_app/utils/device/device_utils.dart';
import 'package:second_opinion_app/utils/locale/app_localization.dart';
import 'package:second_opinion_app/widgets/app_icon_widget.dart';
import 'package:second_opinion_app/widgets/empty_app_bar_widget.dart';
import 'package:second_opinion_app/widgets/helper/DialogHelper.dart';
import 'package:second_opinion_app/widgets/progress_indicator_widget.dart';
import 'package:second_opinion_app/widgets/rounded_button_widget.dart';
import 'package:second_opinion_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/components/service_locator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  UserStore _userStore = getIt<UserStore>();

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  final _store = FormStore();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
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
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _buildLeftSide(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildRightSide(),
                    ),
                  ],
                )
              : Center(child: _buildRightSide()),
          Observer(
            builder: (context) {
              return _store.success ? navigate(context) : _showErrorMessage(_store.errorStore.errorMessage);
            },
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isLoginInProcess,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppIconWidget(image: 'assets/icons/ic_appicon.png'),
            _buildWelcomeText(),
            _buildUserIdField(),
            _buildPasswordField(),
            _buildForgotPasswordButton(),
            _buildSignInButton(),
            _buildSignUpTextButton()
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20, top: 20),
          child: const Text(
            'Login!',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: const Text(
            'Please Login to get medical assistance',
            style: TextStyle(
              color: Color(0xFF6E6E6E),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: AppLocalizations.of(context).translate('login_et_user_email'),
          inputType: TextInputType.emailAddress,
          icon: Icons.email_outlined,
          imageIcon: 'assets/icons/Mail.png',
          iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.userEmail,
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldPasswordWidget(
          onPasswordToggle: () {
            _store.toggleShowPassword();
          },
          hint: AppLocalizations.of(context).translate('login_et_user_password'),
          isObscure: _store.showPassword,
          imageIcon: 'assets/icons/Key.png',
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.key,
          iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _store.formErrorStore.password,
          onChanged: (value) {
            _store.setPassword(_passwordController.text);
          },
        );
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: FractionalOffset.center,
      child: TextButton(
        // padding: EdgeInsets.all(0.0),
        child: Text(
          AppLocalizations.of(context).translate('login_btn_forgot_password'),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Color(0xFF16CAEA)),
        ),
        onPressed: () {
          DialogHelper.showRegistrationDialog(
              context, 'Email Sent', 'OK', 'Please check your email for password reset instructions. Thank you!', () {
            Navigator.pop(context);
          });
        },
      ),
    );
  }

  Widget _buildSignUpTextButton() {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: TextButton(
        // padding: EdgeInsets.all(0.0),
        child: Text(
          AppLocalizations.of(context).translate('login_btn_dont_have_an_account'),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Color(0xFF16CAEA)),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.registration);
        },
      ),
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(height: 50,
      child: RoundedButtonWidget(
        buttonText: AppLocalizations.of(context).translate('login_btn_sign_in'),
        buttonColor: Colors.orangeAccent,
        textColor: Colors.white,
        onPressed: () async {
          //Todo Temporarily changing to true
          if (true) {
            DeviceUtils.hideKeyboard(context);
            await _userStore.login(_store.userEmail, _store.password, context).then((value) {
              _store.login();

            });
          } else {
            _showErrorMessage('Please fill in all fields');
          }
        },
      ),
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
