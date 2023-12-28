import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notificationData = [
    {
      'label': 'Appointment Confirmed',
      'description': 'Your appointment will start in 15 minutes',
      'timeago': DateTime.now().subtract(
        Duration(hours: 5),
      ),
    },
    {
      'label': 'Appointment Alarm',
      'description': 'Your appointment will start in 15 minutes',
      'timeago': DateTime.now().subtract(
        Duration(hours: 568),
      ),
    },
    {
      'label': 'New Feature',
      'description': 'Your appointment will start in 15 minutes',
      'timeago': DateTime.now().subtract(
        Duration(minutes: 15),
      ),
    },
    {
      'label': 'Appointment Alarm',
      'description': 'Your appointment will start in 20 minutes',
      'timeago': DateTime.now().subtract(
        Duration(hours: 5),
      ),
    },
    {
      'label': 'Appointment Confirmed',
      'description': 'Your appointment will start in 40 minutes',
      'timeago': DateTime.now().subtract(
        Duration(hours: 5, minutes: 20),
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        body: RefreshIndicator(onRefresh: () async {}, child: _buildBody()));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(backgroundColor: Colors.transparent,
      leading: _buildLeadingButton(),
      centerTitle: true,
      title: _buildTitle(),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Notifications',
      style: Theme.of(context).textTheme.headlineMedium
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
              child: ListView.builder(
                physics: const BouncingScrollPhysics( ),
                itemCount: notificationData.length,
                itemBuilder: (context, index) {
                  return NotificationsTile(
                    label: notificationData[index]['label'],
                    description: notificationData[index]['description'],
                    timeStamp: notificationData[index]['timeago'],
                    iconData: Icons.notifications_rounded,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({
    Key? key,
    required this.label,
    required this.description,
    required this.timeStamp,
    required this.iconData,
  }) : super(key: key);

  final String label;
  final String description;
  final DateTime timeStamp;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(8.0), child: _buildIcon(label)),
              const SizedBox(width: 8.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.69,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 18),


                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      description,
                    ),
                    Text(
                      timeago.format(timeStamp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CircleAvatar _buildIcon(String label) {
    print(label.contains('arm'));
    if (label.contains('Conf')) {
      return CircleAvatar(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF1ce0a3),
          child: ImageIcon(
            AssetImage('assets/icons/appointmentConfirmed.png'),
            size: 18,
          ));
    } else if (label.contains('Alarm')) {
      return CircleAvatar(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFFec652a),
          child: ImageIcon(
            AssetImage('assets/icons/notificationClock.png'),
            size: 18,
          ));
    }

    return CircleAvatar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF16caea),
        child: ImageIcon(
          AssetImage('assets/icons/notification.png'),
          size: 18,
        ));
  }
}
