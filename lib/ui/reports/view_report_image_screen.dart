import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ViewReportImage extends StatefulWidget {
  const ViewReportImage({Key? key, required this.fileName, required this.imageUrl}) : super(key: key);

  final String fileName;
  final String imageUrl;

  @override
  State<ViewReportImage> createState() => _ViewReportImageState();
}

class _ViewReportImageState extends State<ViewReportImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: _buildBody(),);
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
     widget.fileName,
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
                padding: const EdgeInsets.all( 12.0),
                child: CachedNetworkImage(imageUrl: widget.imageUrl),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
