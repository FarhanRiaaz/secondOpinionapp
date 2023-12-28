import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class ViewPDF extends StatefulWidget {
  final String pdfURL;
  final String fileName;

  const ViewPDF({super.key, required this.pdfURL,required this.fileName});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<ViewPDF> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildLeadingButton(),
        centerTitle: true,
        title: Text(
          widget.fileName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        widget.pdfURL,
        key: _pdfViewerKey,
      ),
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
}
