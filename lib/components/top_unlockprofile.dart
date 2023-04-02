import 'package:flutter/material.dart';

class TopUnlockWidget extends StatefulWidget {
  @override
  _TopUnlockWidgetState createState() => _TopUnlockWidgetState();
}

class _TopUnlockWidgetState extends State<TopUnlockWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Recent Unlocked Profile Lists",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.purple),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage('assets/images/unnamed.png'),
                                fit: BoxFit.fill),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 1.0, color: Colors.black)
                            ]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext conext) {
                          return AlertDialog(
                            title: Text('Not in stock'),
                            content:
                                const Text('This item is no longer available'),
                            actions: <Widget>[
                              /*FlatButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),*/
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // Foreground color
                                  onPrimary: Colors.white,
                                  // Background color
                                  primary: Colors.purple,
                                ).copyWith(
                                    elevation:
                                        ButtonStyleButton.allOrNull(0.0)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok'),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6.0, 2, 15, 2),
                      /*child: Chip(
                          label: Text('@anonymous'),
                          shadowColor: Colors.blue,
                          backgroundColor: Colors.green,
                          elevation: 10,
                          autofocus: true,
                        ),*/
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nagaraj",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          //SizedBox(height: 5.0,),
                          Text(
                            "Age 23, Ladhekar",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black38,
                            ),
                          ),
                          Text(
                            "Sadhanandha Magarisi",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black38,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Magaram, Utharadam",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Tirupur",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*RaisedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white,
                                ),
                                color: Colors.deepPurple,
                              ),*/
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // Foreground color
                                  onPrimary: Colors.white,
                                  // Background color
                                  primary: Colors.purple,
                                ).copyWith(
                                    elevation:
                                        ButtonStyleButton.allOrNull(0.0)),
                                onPressed: () {},
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              /*RaisedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.picture_as_pdf,
                                  color: Colors.white,
                                ),
                                color: Colors.blue,
                              ),*/
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // Foreground color
                                  onPrimary: Colors.white,
                                  // Background color
                                  primary: Colors.purple,
                                ).copyWith(
                                    elevation:
                                        ButtonStyleButton.allOrNull(0.0)),
                                onPressed: () {},
                                child: Icon(
                                  Icons.picture_as_pdf,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
