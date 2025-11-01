import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const TransparentApp());

  doWhenWindowReady(() {
    appWindow.alignment = Alignment.center;
    appWindow.size = const Size(800, 600);
    appWindow.title = "Transparent Window";
    appWindow.show();
  });
}

class TransparentApp extends StatelessWidget {
  const TransparentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TransparentWindow(),
    );
  }
}

class TransparentWindow extends StatelessWidget {
  const TransparentWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent,
      body: WindowBorder(
        color: Colors.transparent,
        width: 0,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Transparent Window",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
