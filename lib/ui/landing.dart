import 'package:flutter/material.dart';
import 'package:second_opinion_app/ui/home_page_view/home_page_view.dart';

import '../utils/locale/app_localization.dart';
import '../utils/routes/routes.dart';
import '../widgets/app_icon_widget.dart';
import '../widgets/rounded_button_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

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
          Center(child: _buildRightSide()),
        ],
      ),
    );
  }

  Widget _buildRightSide() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppIconWidget(image: 'assets/icons/ic_appicon.png'),
              _buildWelcomeText(),
              _buildRegistrationButton(),
              SizedBox(
                height: 15,
              ),
              _buildSignInButton(),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildSignUpTextButton(),
        ),
      ],
    );
  }


  Widget _buildSignInButton() {
    return SizedBox(
      height: 50,
      child: RoundedButtonWidget(
        buttonText: 'Log In',
        buttonColor: Colors.orangeAccent,
        textColor: Colors.white,
        onPressed: () async {Navigator.pushNamed(context, Routes.login);},
      ),
    );
  }

  Widget _buildRegistrationButton() {
    return SizedBox(
      height: 50,
      child: RoundedButtonWidget(
        buttonText: 'Sign Up',
        buttonColor: Colors.orangeAccent,
        textColor: Colors.white,
        onPressed: () async {Navigator.pushNamed(context, Routes.registration);},
      ),
    );
  }

  Widget _buildSignUpTextButton() {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: TextButton(
        // padding: EdgeInsets.all(0.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t want to create an account ?',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(  fontSize: 10),
            ),Text(
              ' Continue as a Guest',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Color(0xFF16CAEA),fontSize: 10),
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>PageViewScreen()));
        },
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20, top: 20),
          child: const Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: const Text(
            'Welcome to H3LTH app. We will provide you assistance in all health related problems',
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
}
