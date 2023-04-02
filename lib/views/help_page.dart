import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:kannada_devangar/utility/app_drawer.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('CONTACT US', style: TextStyle(fontSize: 20, color: Colors.purple),),
              SizedBox(height: 30),
              MarkdownBody(
                data: 'To Report fraud, \n Contact our Support Team Immedietly.\n Note: Registration No & Mobile No is manditory..'
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Call Us", style:TextStyle(fontSize:20, color: Colors.purple)),
                          /*ElevatedButton(
                            child: const Text('Provide feedback'),
                            onPressed: () {
                            },
                          ),*/
                          GestureDetector(
                            onTap: () => print("Tap: call"),
                            onLongPress: () => print("Long Press: Call"),
                            child: Icon(
                              Icons.call,
                              size: 20.0,
                              color: Colors.brown[900],
                            ),
                          ),
                          Text("+91 9384438645", style:TextStyle(fontSize:12, color: Colors.purple))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Write to Us", style:TextStyle(fontSize:20, color: Colors.purple)),
                          GestureDetector(
                            onTap: () => print("Tap: Email"),
                            onLongPress: () => print("Long Press: Email"),
                            child: Icon(
                              Icons.email_rounded,
                              size: 20.0,
                              color: Colors.brown[900],
                            ),
                          ),
                          Text("dmictiruppur@gmail.com", style:TextStyle(fontSize:12, color: Colors.purple))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
