import 'package:flutter/material.dart';
import 'package:second_opinion_app/utils/routes/routes.dart';
import 'package:second_opinion_app/widgets/helper/DialogHelper.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      'Settings',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconCard('assets/icons/Person.png', 'Profile', () {
                        Navigator.pushNamed(context, Routes.profile);
                      }),
                      _buildIconCard('assets/icons/BellIcon.png', 'Notifications', () {
                        Navigator.pushNamed(context, Routes.notification);
                      }),
                      _buildIconCard('assets/icons/Headphones.png', 'Help and Support', () {
                        Navigator.pushNamed(context, Routes.support);
                      }),
                      _buildIconCard('assets/icons/info.png', 'Privacy and Security', () {
                        DialogHelper.showPrivacyDialog(context, () {
                          Navigator.pop(context);
                        });
                      }),
                      _buildIconCard('assets/icons/Key.png', 'Change Password', () {
                        Navigator.pushNamed(context, Routes.change_password);
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
                color: Theme.of(context).primaryColor,
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
