import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SecondOpinionCharges extends StatefulWidget {
  const SecondOpinionCharges({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondOpinionCharges> createState() => _SecondOpinionChargesState();
}

class _SecondOpinionChargesState extends State<SecondOpinionCharges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
       leading: _buildLeadingButton(),
      title: _buildTitle(),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      //actions: _buildActions(),
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
      'Second Opinion Charges',
      style: Theme.of(context).textTheme.headlineMedium,
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
        Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [_buildGeneralOpinion(), _buildSpecializedOpinion()],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildGeneralOpinion() {
    return Column(
      children: [
        ListTile(
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('General Opinion',),
              Text('\$100',style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),

        ),
        ListTile(
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('General Opinion x 2'),
              Text('\$200',style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),

        ),
      ],
    );
  }

  _buildSpecializedOpinion() {

    return Column(
      children: [
        ListTile(
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Specialized Opinion'),
              Text('\$200',style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),

        ),
        ListTile(
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Specialized Opinion x 2'),
              Text('\$400',style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),

        ),
      ],
    );


  }
}
