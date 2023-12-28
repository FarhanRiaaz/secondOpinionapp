import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> status = ['All', 'Pending', 'Complete', 'Incomplete'];
  List<String> selectedStatus = [];

  List<String> payment = [
    'Card',
    'Apple Pay',
    'Google Pay',
  ];
  List<String> selectedPaymentCategories = [];

  List<String> arrangedBy = [
    'Alphabetically',
    'Date',
    'Time',
  ];
  List<String> selectedArrangedByCategories = [];

  List<String> date = [
    'Today',
    'Weekly',
    'Monthly',
  ];
  List<String> selectedDateCategories = [];

  List<String> categories = ['Cardiology', 'Neurology', 'Nephrology', 'Ontology'];
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Apply'),
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFccd2d8),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF6e6e6e),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Reset'),
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                ),
              ],
            )),
          ),
        ),
        Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildStatusFilter(),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // _buildPaymentFilter(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildArrangeByFilter(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDateFilter(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildCategoryFilter(),
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

  Widget _buildStatusFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8.0,
          children: status.map((category) {
            return FilterChip(
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              elevation: 1,
              backgroundColor: Colors.white,
              showCheckmark: false,
              selectedColor: Color(0xFFcff4fa),
              label: !selectedStatus.contains(category)
                  ? Text(category)
                  : Text(
                      category,
                      style: TextStyle(color: Color(0xFF16caea)),
                    ),
              selected: selectedStatus.contains(category),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedStatus.add(category);
                  } else {
                    selectedStatus.remove(category);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPaymentFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8.0,
          children: payment.map((category) {
            return FilterChip(
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              elevation: 1,
              backgroundColor: Colors.white,
              showCheckmark: false,
              selectedColor: Color(0xFFcff4fa),
              label: !selectedPaymentCategories.contains(category)
                  ? Text(category)
                  : Text(
                      category,
                      style: TextStyle(color: Color(0xFF16caea)),
                    ),
              selected: selectedPaymentCategories.contains(category),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedPaymentCategories=[];
                    selectedPaymentCategories.add(category);
                  } else {
                    selectedPaymentCategories.remove(category);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildArrangeByFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Arranged By',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8.0,
          children: arrangedBy.map((category) {
            return FilterChip(
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              elevation: 1,
              backgroundColor: Colors.white,
              showCheckmark: false,
              selectedColor: Color(0xFFcff4fa),
              label: !selectedArrangedByCategories.contains(category)
                  ? Text(category)
                  : Text(
                      category,
                      style: TextStyle(color: Color(0xFF16caea)),
                    ),
              selected: selectedArrangedByCategories.contains(category),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedArrangedByCategories=[];
                    selectedArrangedByCategories.add(category);
                  } else {
                    selectedArrangedByCategories.remove(category);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8.0,
          children: date.map((category) {
            return FilterChip(
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              elevation: 1,
              backgroundColor: Colors.white,
              showCheckmark: false,
              selectedColor: Color(0xFFcff4fa),
              label: !selectedDateCategories.contains(category)
                  ? Text(category)
                  : Text(
                      category,
                      style: TextStyle(color: Color(0xFF16caea)),
                    ),
              selected: selectedDateCategories.contains(category),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedDateCategories.add(category);
                  } else {
                    selectedDateCategories.remove(category);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8.0,
          children: categories.map((category) {
            return FilterChip(
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              elevation: 1,
              backgroundColor: Colors.white,
              showCheckmark: false,
              selectedColor: Color(0xFFcff4fa),
              label: !selectedCategories.contains(category)
                  ? Text(category)
                  : Text(
                      category,
                      style: TextStyle(color: Color(0xFF16caea)),
                    ),
              selected: selectedCategories.contains(category),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedCategories.add(category);
                  } else {
                    selectedCategories.remove(category);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      'Filter',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
