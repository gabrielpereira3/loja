import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 88, 161, 234),
                Color.fromARGB(255, 255, 255, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );

    return Drawer(
      child: Stack(
        children: [
          _buildBodyBack(),
          ListView(
            padding: const EdgeInsets.only(left: 32, top: 16),
            children: [
              const Text(
                "Flutter's travel",
                style: TextStyle(fontSize: 45, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
