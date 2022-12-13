import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ScoreBoard",
      home: const MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.brown),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController myController1 = TextEditingController();
  TextEditingController myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScoreBoard DEMO"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Connect_IP to ESP",
              style: TextStyle(fontSize: 30),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                child: inputField(myController1, myController2)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.brown,
              ),
              onPressed: () {
                print(myController1.text + ":" + myController2.text);
              },
              child: const Text('Connect'),
            )
          ],
        ),
      ),
    );
  }
}

Widget inputField(
    TextEditingController myController1, TextEditingController myController2) {
  return Row(
    children: <Widget>[
      Flexible(
        flex: 7,
        child: TextField(
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'IP : 192.xxx.xx.x',
          ),
          controller: myController1,
        ),
      ),
      const Text(
        " : ",
        style: TextStyle(fontSize: 30),
      ),
      Flexible(
        flex: 3,
        child: TextField(
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Port',
          ),
          controller: myController2,
        ),
      ),
    ],
  );
}
