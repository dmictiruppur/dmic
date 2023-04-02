import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kannada_devangar/core/urls.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class TracknPayScreen extends StatelessWidget {

  String processTopUp="1";
  String RegistrationId;
  String OrderId;
  String OrderDetailId;
  String PackageId;
  String PackageCost;
  String IsTopUp="0";

  TracknPayScreen({
    this.RegistrationId,
    this.OrderId,
    this.OrderDetailId,
    this.PackageId,
    this.PackageCost,
  });

  String _title = 'Payment Gateway';
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              //height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.vertical,
              height: MediaQuery.of(context).size.height,
              child: WebView(
                initialUrl:  URLs.paymentGateway_tracknpay + '?processTopUp=' + this.processTopUp.toString() + '&RegistrationId=' + this.RegistrationId.toString() + '&OrderId=' + this.OrderId.toString() + '&PackageId=' + this.PackageId.toString() + '&IsTopUp=' + this.IsTopUp.toString() + '&OrderDetailId=' + this.OrderDetailId.toString() + '&PackageCost=' + this.PackageCost.toString(),
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              ),
            ),
          ),
        ],
      ),
      //floatingActionButton: _buildShowUrlBtn(),
    );
  }
}