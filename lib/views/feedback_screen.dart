import 'package:flutter/material.dart';
import 'package:feedback/feedback.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:kannada_devangar/utility/app_drawer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackShareScreen extends StatelessWidget {
  const FeedbackShareScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback & Share'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text('Share Your Feedback with us'),
              const SizedBox(height: 10),
              /*const SizedBox(height: 10),
              const MarkdownBody(
                data: '# How does it work?\n'
                    '1. Just press the `Provide feedback` button.\n'
                    '2. The feedback view opens. '
                    'You can choose between draw and navigation mode. '
                    'When in navigate mode, you can freely navigate in the '
                    'app. Try it by opening the navigation drawer or by '
                    'tapping the `Open scaffold` button. To switch to the '
                    'drawing mode just press the `Draw` button on the right '
                    'side. Now you can draw on the screen.\n'
                    '3. To finish your feedback just write a message '
                    'below and send it by pressing the `Submit` button.',
              ),*/
              const SizedBox(height: 10),
              /*ElevatedButton(
                child: const Text('Open scaffold'),
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return _SecondaryScaffold();
                      },
                    ),
                  );
                },
              ),*/
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Provide feedback'),
                onPressed: () {
                  /*BetterFeedback.of(context)?.show(
                    (
                      String feedbackText,
                      Uint8List feedbackScreenshot,
                    ) async {
                      // upload to server, share whatever
                      // for example purposes just show it to the user
                      alertFeedbackFunction(
                        context,
                        feedbackText,
                        feedbackScreenshot,
                      );
                    },
                  );*/
                },
              ),
              if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) ...[
                const SizedBox(height: 10),
                TextButton(
                  child: const Text('Provide E-Mail feedback'),
                  onPressed: () {
                    print("Email Button Clicked");
                    /*BetterFeedback.of(context)?.show(
                      (
                        String feedbackText,
                        Uint8List feedbackScreenshot,
                      ) async {
                        // draft an email and send to developer
                        print("Inner");
                        final screenshotFilePath =
                            await writeImageToStorage(feedbackScreenshot);

                        final Email email = Email(
                          body: feedbackText,
                          subject: 'App Feedback',
                          recipients: ['dmictiruppur@gmail.com'],
                          cc: ['yathavtech@gmail.com'],
                          attachmentPaths: [screenshotFilePath],
                          isHTML: false,
                        );
                        await FlutterEmailSender.send(email);
                      },
                    );*/
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  child: const Text('Provide feedback via platform sharing'),
                  onPressed: () {
                    /*BetterFeedback.of(context)?.show(
                      (
                        String feedbackText,
                        Uint8List feedbackScreenshot,
                      ) async {
                        final screenshotFilePath =
                            await writeImageToStorage(feedbackScreenshot);

                        await Share.shareFiles(
                          [screenshotFilePath],
                          text: feedbackText,
                        );
                      },
                    );*/
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SecondaryScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold 2'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}

Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
  final Directory output = await getTemporaryDirectory();
  final String screenshotFilePath = '${output.path}/feedback.png';
  final File screenshotFile = File(screenshotFilePath);
  await screenshotFile.writeAsBytes(feedbackScreenshot);
  return screenshotFilePath;
}

Future<void> createGitlabIssueFromFeedback(BuildContext context) async {
  /*BetterFeedback.of(context)?.show((
    feedbackText,
    feedbackScreenshot,
  ) async {
    const projectId = 'your-gitlab-project-id';
    const apiToken = 'your-gitlab-api-token';
    final screenshotFilePath = await writeImageToStorage(feedbackScreenshot);
    // Upload screenshot
    final uploadRequest = http.MultipartRequest(
      'POST',
      Uri.https(
        'gitlab.com',
        '/api/v4/projects/$projectId/uploads',
      ),
    )
      ..files.add(await http.MultipartFile.fromPath(
        'file',
        screenshotFilePath,
      ))
      ..headers.putIfAbsent('PRIVATE-TOKEN', () => apiToken);
    final uploadResponse = await uploadRequest.send();

    final dynamic uploadResponseMap = jsonDecode(
      await uploadResponse.stream.bytesToString(),
    );
    // Create issue
    await http.post(
      Uri.https(
        'gitlab.com',
        '/api/v4/projects/$projectId/issues',
        <String, String>{
          'title': feedbackText.padRight(80),
          'description': '$feedbackText\n'
              "${uploadResponseMap["markdown"] ?? "Missing image!"}",
        },
      ),
      headers: {
        'PRIVATE-TOKEN': apiToken,
      },
    );
  });*/
}
