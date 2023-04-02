import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewPdf extends StatefulWidget {
  final String file;
  const ViewPdf({this.file}) ;

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  File filename;

  static Future<File> loadNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    final text = '${indexPage + 1} of $pages';

    final file = loadNetwork(widget.file);

    return Scaffold(
        appBar: AppBar(
          title: Text("View PDF"),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //child: Text(filename.path),
        child: PDFView(
          filePath: file.toString(),
          // autoSpacing: false,
          // swipeHorizontal: true,
          // pageSnap: false,
          // pageFling: false,
          //onRender: (pages) => setState(() => this.pages = pages),
          onViewCreated: (controller) => setState(() => this.controller = controller),
          onPageChanged: (indexPage, _) => setState(() => this.indexPage = indexPage),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://api.whatsapp.com/send';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}