import 'package:flutter/material.dart';

class RotatedBoxWidget extends StatefulWidget {
  const RotatedBoxWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RotatedBoxState();
}

class RotatedBoxState extends State<RotatedBoxWidget> {
  var quarterturns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RotatedBox"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
              quarterTurns: quarterturns,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const RadialGradient(
                    colors: [
                      Color.fromARGB(255, 224, 238, 74),
                      Color.fromARGB(255, 33, 63, 236),
                    ],
                  ).createShader(bounds);
                },
                child: Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 17, 29, 39),
                    child: const FlutterLogo()),
              ),
            ),
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 63, 78, 165),
                    Color.fromARGB(255, 219, 127, 5),
                  ],
                ).createShader(bounds);
              },
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (quarterturns == 0 || quarterturns > 0) {
                        quarterturns++;
                      }
                    });
                  },
                  child: const Text("Rotated")),
            )
          ],
        ),
      ),
    );
  }
}
