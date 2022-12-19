import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:platform/platform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ScoreBoard",
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/scoreboard.png',
              height: 130,
            ),
            const SizedBox(
              height: 30,
            ),
            // if (Platform.isAndroid)
            //   const CupertinoActivityIndicator(
            //     radius: 20,
            //   )
            // else
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const Text(
              '\nMultipurpose IoT Scoreboard App',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Column(
//         children: [
//           Image.asset('image/scoreboard.png'),
//           const Text(
//             'Multipurpose IoT Scoreboard App',
//             style: TextStyle(
//                 fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
//           )
//         ],
//       ),
//       backgroundColor: Colors.white,
//       nextScreen: const MyHomePage(),
//       splashIconSize: 700,
//       duration: 2000,
//       splashTransition: SplashTransition.fadeTransition,
//       pageTransitionType: PageTransitionType.rightToLeftWithFade,
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;
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
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );

    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
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
                ),
                const Text('TIME', style: TextStyle(fontSize: 20)),
                GestureDetector(
                  onTap: () {
                    if (controller.isDismissed) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                          height: 300,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        if (controller.isAnimating) {
                          controller.stop();
                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          controller.reverse(
                              from: controller.value == 0
                                  ? 1.0
                                  : controller.value);
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      },
                      child: Icon(
                        isPlaying == true ? Icons.pause : Icons.play_arrow,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.reset();
                        setState(() {
                          isPlaying = false;
                        });
                      },
                      child: const Icon(
                        Icons.stop,
                      ),
                    ),
                  ],
                ),
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
