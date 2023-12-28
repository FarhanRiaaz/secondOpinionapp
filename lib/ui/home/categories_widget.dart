import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:second_opinion_app/utils/routes/routes.dart';
import 'package:second_opinion_app/widgets/select_user_modal_widget.dart';

import '../../models/categories/all_category_response.dart';

class MedicalFieldGridTile extends StatefulWidget {
  const MedicalFieldGridTile({
    super.key,
    required this.category
  });

  final GetAllCategoryResponse category;



  @override
  State<MedicalFieldGridTile> createState() => _MedicalFieldGridTileState();
}

class _MedicalFieldGridTileState extends State<MedicalFieldGridTile> {

  String _selectedOption = '-1';

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            _showBottomSheet(context,);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 40,
                  width: 40,
                  child: CachedNetworkImage(imageUrl:
                    widget.category.image??'',
                    fit: BoxFit.fitHeight,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  widget.category.title??'',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {


    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return SelectUserModal(category: widget.category,);
      },
    );
  }
}
