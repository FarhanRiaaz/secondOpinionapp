import 'package:flutter/material.dart';
import 'package:second_opinion_app/data/sharedpref/shared_preference_helper.dart';
import 'package:second_opinion_app/ui/payment/card_screen.dart';
import 'package:second_opinion_app/ui/second_opinion_charges/second_opinion_charges.dart';
import 'package:second_opinion_app/utils/routes/routes.dart';
import 'package:second_opinion_app/widgets/helper/DialogHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key, required this.onBackPressed}) : super(key: key);
  final VoidCallback onBackPressed;

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      // leading: _buildLeadingButton(),
      centerTitle: true,
      title: _buildTitle(),
    );
  }

  Widget _buildLeadingButton() {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        widget.onBackPressed();
      },
    );
  }

  Widget _buildTitle() {
    return Text(
      'More',
      style: Theme
          .of(context)
          .textTheme
          .headlineMedium,
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
            width: MediaQuery
                .of(context)
                .size
                .width * 0.35,
            child: Opacity(opacity: 0.25, child: Image.asset('assets/images/background/bottomRight.png')),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.7,
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
                  padding: EdgeInsets.only(bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconCard('assets/icons/CreditCard.png', 'Payment', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
                      }),
                      _buildIconCard('assets/icons/info.png', 'Second Opinion Charges', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondOpinionCharges()));
                      }),
                      _buildIconCard('assets/icons/Setting.png', 'Setting', () {
                        Navigator.pushNamed(context, Routes.setting);
                      }),
                      _buildIconCard('assets/icons/info.png', 'About Us', () {
                        DialogHelper.showAboutUsDialog(context, () {
                          Navigator.pop(context);
                        });
                      }),
                      _buildIconCard('assets/icons/logout.png', 'Logout', () {
                        DialogHelper.showLogoutDialog(context, () async {
                          SharedPreferences shared = await SharedPreferences.getInstance();
                          Navigator.pop(context);
                          SharedPreferenceHelper(shared).removeAuthToken();
                          SharedPreferenceHelper(shared).saveIsLoggedIn(false);
                          Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
                        });
                      }),
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

  Widget _buildIconCard(String icon, String text, VoidCallback onPressed) {
    return Card(
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(icon),
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
              SizedBox(width: 16.0),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
