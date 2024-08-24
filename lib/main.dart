import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_talk/SplashScreen.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:vision_talk/gemini.dart';

void main() {
  runApp(const Gemini());
}

class visionTalk extends StatefulWidget {
  const visionTalk({super.key});

  @override
  State<visionTalk> createState() => _visionTalkState();
}

class _visionTalkState extends State<visionTalk> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Vision Talk",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.lato().fontFamily,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              child: ListView(
                children: [
                  Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: "Your Vision...",
                              labelStyle: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.lato().fontFamily,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                              ),
                              prefixIcon: const Icon(
                                Icons.settings,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ))),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                          onPressed: () async {
                            var url = Uri.https('www.googleapis.com',
                                '/books/v1/volumes', {'q': '{http}'});
                          },
                          child: Text(
                            "Generate",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// AIzaSyCAZAV_0xBSsQANt_vLUICBiBRh3I-xFp0