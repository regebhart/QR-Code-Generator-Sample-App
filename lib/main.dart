import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textInputController = TextEditingController();

  String qrdata = "";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter QR Code Generator"),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: size.height * 0.7, maxWidth: size.width * 0.8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text("Enter QR data below:"),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(child: TextField(controller: textInputController)),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              qrdata = textInputController.text;
                            });
                          },
                          child: const Text("Generate"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Stack(
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(10), child: Container(color: Colors.blue[900])),
                        if (qrdata.isNotEmpty)
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: QrImage(
                              data: qrdata,
                              foregroundColor: Colors.white,
                            ),
                          )),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "Bold text with information",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text("Regular text with less important information"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
