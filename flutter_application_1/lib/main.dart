import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyWpsStyleApp());

  doWhenWindowReady(() {
    const initialSize = Size(1100, 700);
    appWindow.minSize = const Size(800, 500);
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "WPS Style Flutter Window";
    appWindow.show();
  });
}

class MyWpsStyleApp extends StatelessWidget {
  const MyWpsStyleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WPS Style Flutter Desktop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const WpsMainWindow(),
    );
  }
}

class WpsMainWindow extends StatelessWidget {
  const WpsMainWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowBorder(
      color: Colors.transparent,
      width: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          body: Stack(
            children: [
              // Drop shadow background (outer glow)
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(0, 6),
                    )
                  ],
                ),
              ),

              // Main content
              Column(
                children: const [
                  CustomTitleBar(),
                  Expanded(child: AppBody()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTitleBar extends StatelessWidget {
  const CustomTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonColors = WindowButtonColors(
      iconNormal: Colors.white,
      mouseOver: Colors.grey[700],
      mouseDown: Colors.grey[800],
      iconMouseOver: Colors.white,
      iconMouseDown: Colors.white,
    );

    final closeButtonColors = WindowButtonColors(
      mouseOver: Colors.redAccent,
      mouseDown: Colors.red,
      iconNormal: Colors.white,
      iconMouseOver: Colors.white,
    );

    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.indigo[900],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.folder_special, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          const Text(
            "WPS Flutter Window",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(width: 8),
          Expanded(child: MoveWindow()), // Drag area
          Row(
            children: [
              MinimizeWindowButton(colors: buttonColors),
              MaximizeWindowButton(colors: buttonColors),
              CloseWindowButton(colors: closeButtonColors),
            ],
          ),
        ],
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xfff9fafc), Color(0xffedf1f8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          // Sidebar
          Container(
            width: 200,
            decoration: const BoxDecoration(
              color: Color(0xff2b2d42),
              boxShadow: [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 8,
                  offset: Offset(2, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Navigation",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Divider(color: Colors.white38),
                _navButton("Dashboard", Icons.dashboard),
                _navButton("Settings", Icons.settings),
                _navButton("About", Icons.info_outline),
                const Spacer(),
                _navButton("Exit", Icons.exit_to_app, color: Colors.redAccent),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Main area
          Expanded(
            child: Center(
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "WPS Office Style Counter",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "$counter",
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _button("−", Colors.redAccent, () {
                          setState(() => counter--);
                        }),
                        const SizedBox(width: 20),
                        _button("Reset", Colors.orange, () {
                          setState(() => counter = 0);
                        }),
                        const SizedBox(width: 20),
                        _button("+", Colors.green, () {
                          setState(() => counter++);
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navButton(String title, IconData icon, {Color color = Colors.white}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.blueGrey[700],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 10),
              Text(title, style: TextStyle(color: color)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 6,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
