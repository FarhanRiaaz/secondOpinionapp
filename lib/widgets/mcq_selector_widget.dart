
import 'package:flutter/material.dart';

import '../models/categories/category_instance_response.dart';
import '../ui/categories/questions.dart';

class McqWidget extends StatefulWidget {
  final String question;
  final List<Option> options;
  final int selectedOption;
  final Function(int) onSelect;

  const McqWidget({
    required this.question,
    required this.options,
    required this.selectedOption,
    required this.onSelect,
  });

  @override
  State<McqWidget> createState() => _McqWidgetState();
}

class _McqWidgetState extends State<McqWidget> with AutomaticKeepAliveClientMixin {

  int selectedValue = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ...List<Widget>.generate(
              widget.options.length,
                  (int i) {
                final currentOption = widget.options[i];
                return OptionRadioTile(
                  option: currentOption.option!,
                  selectedOption: selectedValue,
                  value: i,
                  onChanged: (int? value) {
                    setState(() {
                      widget.onSelect(value!);
                      selectedValue = value;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override

  bool get wantKeepAlive => true;
}