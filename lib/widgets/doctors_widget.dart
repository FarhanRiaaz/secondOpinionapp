import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second_opinion_app/ui/second_opinion/second_opinion_details.dart';
import 'package:second_opinion_app/utils/routes/routes.dart';

import '../models/categories/submitted_opinion_response.dart';

class DoctorsWidget extends StatelessWidget {
  const DoctorsWidget(
      {Key? key, required this.specialization, required this.doctorName, required this.dateTime, required this.status, required this.secondOpinionResult})
      : super(key: key);

  final Result secondOpinionResult;
  final String specialization;
  final String doctorName;
  final DateTime dateTime;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondOpinionDetailScreen(submittedOpinion:secondOpinionResult,)));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      specialization,
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 16),
                    ),
                    Text(
                      doctorName,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 12),
                    ),
                    Text(
                      DateFormat('MMMM d, y').format(dateTime),
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: status == 'Pending'
                        ? Color(0xfffce7da)
                        : status == 'Complete'
                        ? Color(0xffd4fae7)
                        : Color(0xfffadada),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: status == 'Pending'
                          ? Color(0xfffdae54)
                          : status == 'Complete'
                          ? Color(0xff1ce0a3)
                          : Color(0xFFe35959),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionWidget({
    required IconData icon,
    required VoidCallback onPressed,
    required BuildContext context,
  }) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme
              .of(context)
              .primaryColor
              .withOpacity(0.1),
        ),
        child: IconButton(
          splashRadius: 10,
          color: Theme
              .of(context)
              .primaryColor,
          onPressed: onPressed,
          icon: Icon(icon, size: 15),
        ),
      ),
    );
  }
}
