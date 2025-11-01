import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const BlueTransparentApp());

  doWhenWindowReady(() {
    appWindow.alignment = Alignment.center;
    appWindow.size = const Size(900, 600);
    appWindow.title = "Blue Transparent Flutter Window";
    appWindow.show();
  });
}

class BlueTransparentApp extends StatelessWidget {
  const BlueTransparentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const BlueWindow(),
    );
  }
}

class BlueWindow extends StatelessWidget {
  const BlueWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(94, 255, 255, 255), 
      body: WindowBorder(
        color: Colors.transparent,
        width: 0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Container(
                width: 320,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Blue Transparent Window",
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
