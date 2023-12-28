import 'package:flutter/material.dart';
import 'package:second_opinion_app/constants/assets.dart';

class DialogHelper {
  DialogHelper._();

  static Future<void> showRegistrationDialog(
      BuildContext context, String title, String buttonText, String description, VoidCallback callback) async {
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
              image: DecorationImage(
                image: AssetImage(Assets.popupBackground),
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
                        Assets.tickIcon,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 18.0, color: Color(0xFF222B2C)),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, color: Color(0xFFBEBEBE)),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () => callback(),
                      child: Text(
                        buttonText,
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


  static Future<void> showCompletionDialog(
      BuildContext context,
      String title,
      String description,
      ) async {
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
              image: DecorationImage(
                image: AssetImage(Assets.popupBackground),
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
                      child: Icon(
                        Icons.warning,
                        size: 60,
                        color: Colors.red,
                      ),

                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 18.0, color: Color(0xFF222B2C)),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, color: Color(0xFFBEBEBE)),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                      },
                      child: Text(
                        'OK',
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


  static Future<void>  showUserDeleteConfirmationDialog(BuildContext context, String subUserProfileName, VoidCallback callback) {
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
              image: DecorationImage(
                image: AssetImage(Assets.popupBackground),
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
                    const SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        'Delete Sub User Profile',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF222B2C),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Are you sure you want to delete the sub user profile "$subUserProfileName"?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF949191),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: callback,
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  static Future<void> showDeleteConfirmationDialog(BuildContext context, String documentName, VoidCallback callback) async {
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
              image: DecorationImage(
                image: AssetImage(Assets.popupBackground),
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
                    const SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        'Delete Document',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF222B2C),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Are you sure you want to delete the document "$documentName"?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF949191),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => callback(),
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showAboutUsDialog(BuildContext context, VoidCallback callback) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: 400,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(Assets.popupBackground),
                fit: BoxFit.contain,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        Assets.tickIcon,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        'About H3LTH',
                        style: TextStyle(fontSize: 20.0, color: Color(0xFF222B2C)),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'H3LTH is a dynamic startup on a mission to bridge the gap between experts and patients, making healthcare accessible and convenient, regardless of geographical boundaries. Our journey began with personal experiences of limited information and misdiagnosis, fueling our determination to provide a better solution for individuals seeking reliable medical guidance.\n\nAt H3LTH, we understand the frustration and anxiety that comes with not fully understanding your medical condition. That\'s why our primary aim is to bring you peace of mind. We are here to empower you with comprehensive medical insights and ensure that you receive the accurate information you deserve.\n\nWe are committed to ensuring that your health concerns are addressed promptly and efficiently. Our team of experienced professionals works tirelessly to ensure that each interaction with our platform is seamless and informative. At H3LTH, we believe in the power of knowledge and the importance of making informed decisions about your health.\n\nJoin us on this journey as we work towards bringing you the peace of mind you deserve, bridging the gap between patients and experts, and revolutionizing the way medical opinions are sought and delivered.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, color: Color(0xFF938F8F)),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: callback,
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
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


  static Future<void> showLogoutDialog(BuildContext context, VoidCallback callback) async {
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
              image: DecorationImage(
                image: AssetImage(Assets.popupBackground),
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
                      child: ImageIcon(
                        AssetImage('assets/icons/logout.png'),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        'Logout Confirmation',
                        style: TextStyle(fontSize: 18.0, color: Color(0xFF222B2C)),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Are you sure you want to log out?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, color: Color(0xFF938F8F)),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: callback,
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
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

  static Future<void> showCongradulationsDialog(BuildContext context, VoidCallback callback) async {
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
                      "Your information has been forwarded to the doctors. We'll notify you shortly with their expert opinions.",
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

  static Future<void> showPrivacyDialog(BuildContext context, VoidCallback callback) async {
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
              image: DecorationImage(
                image: AssetImage(Assets.popupBackground),
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
                      height: 50,
                      child: Image.asset(
                        'assets/icons/info.png', // Replace with the appropriate image asset for privacy and security
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        'Privacy and Security',
                        style: TextStyle(fontSize: 18.0, color: Color(0xFF222B2C)),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Your privacy and security are important to us. We take all necessary measures to protect your personal information.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, color: Color(0xFF938F8F)),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: callback,
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
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

}
