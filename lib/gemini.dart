import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Gemini extends StatefulWidget {
  const Gemini({super.key});

  @override
  State<Gemini> createState() => _GeminiState();
}

class _GeminiState extends State<Gemini> {
  late GenerativeModel model;
  final TextEditingController textEditingController = TextEditingController();
  String? response;

  void dispose() {
    textEditingController.dispose();
  }

  @override
  void initState() {
    super.initState();
    const String apiKey = 'AIzaSyCAZAV_0xBSsQANt_vLUICBiBRh3I-xFp0';
    model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: "Enter your query",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyanAccent),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final input = textEditingController.text;
                    final content = Content.text(input);
                    try {
                      var generatedResponse =
                          await model.generateContent([content]);

                      setState(() {
                        response = generatedResponse.text;
                      });
                    } catch (e) {
                      print("Error generating content: $e");
                      setState(() {
                        response = "Error generating content";
                      });
                    }
                  },
                  child: const Text("Generate"),
                ),
                const SizedBox(height: 20),
                if (response != null)
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Text(
                        response!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
