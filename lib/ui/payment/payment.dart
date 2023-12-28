import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../utils/routes/routes.dart';
import '../../widgets/textfield_widget.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({
    Key? key,
  }) : super(key: key);



  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
      'Card Details',
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
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildCardNumberField(),
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
                          _buildNameField(),
                          _buildCheckBox()
                        ],
                      ),
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
      errorText: '',
      textController: cardExpiryController,
    );
  }

  Widget _buildCvvField() {
    final MaskTextInputFormatter maskFormatter =
    MaskTextInputFormatter(mask: '####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);
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
      errorText: '',
      textController: cvvController,
    );
  }

  Widget _buildCardNumberField() {
    final MaskTextInputFormatter maskFormatter =
    MaskTextInputFormatter(mask: '####  ####  ####  ####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);
    return TextFieldWidget(
      inputFormat: [maskFormatter],
      hint: 'Card Number',
      inputType: TextInputType.number,
      icon: Icons.credit_card,
      imageIcon: 'assets/icons/CreditCard.png',
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      errorText: '',
      textController: cardNumberController,
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
      errorText: '',
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

        },
        child: Text('Pay Now'),
      ),
    );
  }


}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Get the new input text and remove any non-numeric characters
    String newInput = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // If the new input is longer than 4 digits, truncate it to 4 digits
    if (newInput.length > 4) {
      newInput = newInput.substring(0, 4);
    }

    // If the new input has less than 4 digits, return it as is
    if (newInput.length < 4) {
      return TextEditingValue(
        text: newInput,
        selection: TextSelection.fromPosition(
          TextPosition(offset: newInput.length),
        ),
      );
    }

    // If the new input has 4 digits, format it as MM/YY
    String formattedValue = '${newInput.substring(0, 2)}/${newInput.substring(2)}';

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formattedValue.length),
      ),
    );
  }
}
