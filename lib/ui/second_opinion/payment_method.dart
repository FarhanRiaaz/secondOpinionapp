import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:second_opinion_app/utils/routes/routes.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: _buildTitle(),
      centerTitle: true,
      leading: _buildLeadingButton(),
    );
  }

  Widget _buildBody() {
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
        _buildMainContent(),
        Align(alignment: Alignment.bottomRight, child: _buildContinueButton())
      ],
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 1,
            child: RadioListTile<String>(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/credit-card (1).png',
                      scale: 0.8,
                    ),
                    SizedBox(width: 12.0),
                    Text('Card'),
                  ],
                ),
              ),
              value: 'Card',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
              activeColor: Colors.green,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              selected: _selectedOption == 'option1',
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 1,
            child: RadioListTile<String>(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      child: CachedNetworkImage(imageUrl: 'https://assets.stickpng.com/images/5847e97bcef1014c0b5e4824.png'),
                    ),
                    SizedBox(width: 12.0),
                    Text('Apple Pay'),
                  ],
                ),
              ),
              value: 'ApplePay',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
              activeColor: Colors.green,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              selected: _selectedOption == 'option1',
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 1,
            child: RadioListTile<String>(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      child: CachedNetworkImage(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Google_Pay_Logo.svg/1200px-Google_Pay_Logo.svg.png'),
                    ),
                    SizedBox(width: 8.0),
                    Text('Google Pay'),
                  ],
                ),
              ),
              value: 'GooglePay',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
              activeColor: Colors.green,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              selected: _selectedOption == 'option3',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Payment Method',
      style: Theme.of(context).textTheme.headlineMedium,
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

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              if (_selectedOption == 'Card') {
                Navigator.pushNamed(context, Routes.addPayment);
              }
            },
            child: Text('Continue')),
      ),
    );
  }
}
