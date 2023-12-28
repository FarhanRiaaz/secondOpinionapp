import 'package:flutter/material.dart';
import 'package:second_opinion_app/utils/routes/routes.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  List<Map<String, String>> chatList = [
    {
      'name': 'John Doe',
      'question': 'How can I reset my password?',
      'date': '2023-05-08',
    },
    {
      'name': 'Jane Smith',
      'question': 'What are the payment options?',
      'date': '2023-05-09',
    },
    {
      'name': 'Bob Johnson',
      'question': 'How can I track my order?',
      'date': '2023-05-10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(backgroundColor: Colors.transparent,
      title: _buildTitle(),
      centerTitle: true,
      leading: _buildLeadingButton(),
    );
  }

  _buildBody() {
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSearchBarWithButton(),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      color: Colors.white,
                      child: _buildCardList(),
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
      'Help and Support',
      style: Theme.of(context).textTheme.headlineMedium ,
    );
  }

  Widget _buildSearchBarWithButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFFCCD2D8),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: chatList.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildChatWidget(chatList[index]['name']!, chatList[index]['question']!, chatList[index]['date']!);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }

  Widget _buildChatWidget(String name, String question, String date) {
    return InkWell(onTap: (){Navigator.pushNamed(context, Routes.chat);},
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              radius: 25,
            ),
            SizedBox(
              width: 6,
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(date),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    question,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
