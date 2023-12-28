import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../utils/routes/routes.dart';
import '../../widgets/textfield_widget.dart';
import 'package:awesome_card/awesome_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildTitle() {
    return Text(
      'Payments',
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.only(top: 10, bottom: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // _buildPaymentMethodType(),
                          _buildCreditCard(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Card Details',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _buildCardNumberField(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: _buildExpiryField()),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(child: _buildCvvField()),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _buildNameField(),
                          SizedBox(
                            height: 15,
                          ),
                          _buildCheckBox()
                        ],
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: _buildProceedButton(),
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpiryField() {
    final MaskTextInputFormatter maskFormatter =
        MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);
    return TextFieldWidget(
      inputFormat: [maskFormatter],
      hint: 'Expiry Date',
      imageIcon: 'assets/icons/Calender2.png',
      inputType: TextInputType.number,
      icon: Icons.phone_outlined,
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      textController: cardExpiryController,
    );
  }

  Widget _buildCvvField() {
    final MaskTextInputFormatter maskFormatter =
        MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);

    return TextFieldWidget(
      inputFormat: [maskFormatter],
      hint: 'CVV',
      imageIcon: 'assets/icons/CreditCard.png',
      inputType: TextInputType.number,
      icon: Icons.credit_card,
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      textController: cvvController,
    );
  }

  Widget _buildCardNumberField() {
    final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
        mask: '####  ####  ####  ####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);

    return Material(
      child: TextFieldWidget(
        inputFormat: [maskFormatter],
        hint: 'Card Number',
        inputType: TextInputType.number,
        icon: Icons.credit_card,
        imageIcon: 'assets/icons/CreditCard.png',
        inputAction: TextInputAction.next,
        autoFocus: false,
        onChanged: (value) {},
        onFieldSubmitted: (value) {},
        textController: cardNumberController,
      ),
    );
  }

  Widget _buildNameField() {
    return TextFieldWidget(
      hint: 'Name',
      inputType: TextInputType.name,
      imageIcon: 'assets/icons/Person.png',
      icon: Icons.person,
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      textController: nameController,
    );
  }

  Widget _buildCheckBox() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: checked,
            onChanged: (value) {
              setState(() {
                checked = !checked;
              });
            },
          ),
          Text('Save for the future checkouts', style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }

  Widget _buildProceedButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          await showCongradulationsDialog(context);
          Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
        },
        child: Text('Pay Now'),
      ),
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

  Widget _buildCreditCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: (14), vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Card',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.addPayment);
                    },
                    icon: Icon(Icons.add_circle_outline_rounded),
                    label: Text('Add New'),
                  )
                ],
              ),
            ),
            CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 11 / 9,
                  padEnds: false,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  CreditCard(
                      cardNumber: "5450 7879 4864 7854",
                      cardExpiry: "10/25",
                      cardHolderName: " ",
                      cvv: "456",
                      bankName: "Card Number",
                      cardType: CardType.masterCard,
                      showBackSide: false,
                      frontBackground: CardBackgrounds.custom(0xFF18abc5),
                      backBackground: CardBackgrounds.white,
                      showShadow: true,
                      textExpDate: 'Exp. Date',
                      textName: 'Name',
                      textExpiry: 'MM/YY'),
                ]),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please select your payment method',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Color(0xFF6e6e6e)),
        ),
        SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              SelectableLogo(
                text: 'Card',
                imagePath: 'assets/icons/credit-card (1).png',
              ),
              SelectableLogo(
                text: 'Apple Pay',
                imagePath: 'assets/icons/applePay.png',
              ),
              SelectableLogo(
                text: 'Google Pay',
                imagePath: 'assets/icons/gPay.png',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SelectableLogo extends StatefulWidget {
  final String text;
  final String imagePath;

  SelectableLogo({required this.text, required this.imagePath});

  @override
  _SelectableLogoState createState() => _SelectableLogoState();
}

class _SelectableLogoState extends State<SelectableLogo> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color textColor = _isSelected ? Theme.of(context).primaryColor : Colors.black;
    Color borderColor = _isSelected ? Theme.of(context).primaryColor : Colors.grey;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8, bottom: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 20,
                child: Image.asset(
                  widget.imagePath,
                  semanticLabel: '',
                ),
              ),
              SizedBox(width: 16),
              Text(
                widget.text,
                style: TextStyle(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
