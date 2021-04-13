import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void getresponse() async {
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/e-caldron-310610-668f84289264.json").build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle,language: Language.english);
   AIResponse response = await dialogflow.detectIntent("Hi!!!");
  print(response.getMessage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () async {
              getresponse();
            }, 
            child: Text("Get Response"),
          ),
        ),
      ),
    );
  }
}