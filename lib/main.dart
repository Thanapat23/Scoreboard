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
      debugShowCheckedModeBanner: false,
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
  int scoreA = 0;
  int scoreB = 0;
  int setA = 0;
  int setB = 0;
  int count = 0;
  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;

  @override
  void initState() {
    super.initState();
    image1 = Image.asset(
      "image/led0.png",
      width: 60,
    ); // set0
    image2 = Image.asset(
      "image/led1.png",
      width: 60,
    ); // set1
    image3 = Image.asset(
      "image/led2.png",
      width: 60,
    ); // set2
    image4 = Image.asset(
      "image/led3.png",
      width: 60,
    ); // set3
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScoreBoard DEMO"),
      ),
      body: Center(
        // crossAxisAlignment: CrossAxisAlignment.center,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      //TeamA
                      children: <Widget>[
                        const Text("TEAM A",
                            style:
                                TextStyle(fontSize: 40, color: Colors.black)),
                        Text(
                          "$scoreA",
                          style: const TextStyle(fontSize: 60),
                        ),
                        Row(
                            //1 คะแนน
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonPlus(1, 1),
                                  child: const Text("+1")),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.red[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonMinus(1, 1),
                                  child: const Text("-1"))
                            ]),
                        Row(
                            //2 คะแนน
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonPlus(1, 2),
                                  child: const Text("+2")),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.red[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonMinus(1, 2),
                                  child: const Text("-2"))
                            ]),
                        Row(
                            //3 คะแนน
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonPlus(1, 3),
                                  child: const Text("+3")),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.red[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonMinus(1, 3),
                                  child: const Text("-3")),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Column(
                                //SETPOINT
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.green[400],
                                        shape:
                                            const StadiumBorder(), // foreground
                                      ),
                                      onPressed: () => buttonSetPlus(1, 1),
                                      child: const Text("+ SET")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.red[400],
                                        shape:
                                            const StadiumBorder(), // foreground
                                      ),
                                      onPressed: () => buttonSetMinus(1, 1),
                                      child: const Text("- SET"))
                                ]),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "SET A",
                                  style: TextStyle(fontSize: 30),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    setA == 0
                                        ? image1
                                        : setA == 1
                                            ? image2
                                            : setA == 2
                                                ? image3
                                                : image4
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      // TeamB
                      children: [
                        const Text("TEAM B",
                            style:
                                TextStyle(fontSize: 40, color: Colors.black)),
                        Text(
                          "$scoreB",
                          style: const TextStyle(fontSize: 60),
                        ),
                        Row(
                            //1 คะแนน
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonPlus(2, 1),
                                  child: const Text("+1")),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.red[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonMinus(2, 1),
                                  child: const Text("-1")),
                            ]),
                        Row(
                            //2 คะแนน
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonPlus(2, 2),
                                  child: const Text("+2")),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.red[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonMinus(2, 2),
                                  child: const Text("-2")),
                            ]),
                        Row(
                            //3 คะแนน
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonPlus(2, 3),
                                  child: const Text("+3")),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.red[400],
                                    shape: const StadiumBorder(), // foreground
                                  ),
                                  onPressed: () => buttonMinus(2, 3),
                                  child: const Text("-3")),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "SET B",
                                  style: TextStyle(fontSize: 30),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    setB == 0
                                        ? image1
                                        : setB == 1
                                            ? image2
                                            : setB == 2
                                                ? image3
                                                : image4
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                                //SETPOINT
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.green[400],
                                        shape:
                                            const StadiumBorder(), // foreground
                                      ),
                                      onPressed: () => buttonSetPlus(2, 1),
                                      child: const Text("+ SET")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.red[400],
                                        shape:
                                            const StadiumBorder(), // foreground
                                      ),
                                      onPressed: () => buttonSetMinus(2, 1),
                                      child: const Text("- SET"))
                                ]),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Text('QT/HALFTIME', style: TextStyle(fontSize: 20)),
                // Text(
                //   "$count",
                //   style: const TextStyle(fontSize: 40),
                // ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue[400],
                  ),
                  onPressed: () => buttonQT(1),
                  child: Text(
                    "$count",
                    style: const TextStyle(fontSize: 50),
                  ),
                )
              ],
            )),
      ),
    );
  }

  void buttonPlus(int team, int increment) {
    setState(() {
      if (team == 1) {
        scoreA += increment;
      }

      if (team == 2) {
        scoreB += increment;
      }
    });
  }

  void buttonMinus(int team, int decrement) {
    setState(() {
      if (team == 1) {
        scoreA = (scoreA < decrement) ? 0 : scoreA - decrement;
      }

      if (team == 2) {
        scoreB = (scoreB < decrement) ? 0 : scoreB - decrement;
      }
    });
  }

  void buttonSetPlus(int team, int increment) {
    setState(() {
      if (team == 1) {
        setA = (setA + increment > 3) ? 3 : setA + increment;
      }
      if (team == 2) {
        setB = (setB + increment > 3) ? 3 : setB + increment;
      }
    });
  }

  void buttonSetMinus(int team, int decrement) {
    setState(() {
      if (team == 1) {
        setA = (setA < decrement) ? 0 : setA - decrement;
      }

      if (team == 2) {
        setB = (setB < decrement) ? 0 : setB - decrement;
      }
    });
  }

  void buttonQT(int increment) {
    setState(() {
      count = (count + increment > 4) ? 0 : count + increment;
    });
  }
}
