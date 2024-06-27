import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantinwisaga1/themes/theme.provider.dart';
import 'package:provider/provider.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 150), // Menyesuaikan nilai ini untuk mengatur seberapa jauh teks ke kiri
            Text(
              'Settings',
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary), // Menjaga konsistensi warna ikon (meskipun tidak ada drawer)
      ), 
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Warna bayangan dengan opacity
                  spreadRadius: 3, // Radius penyebaran bayangan
                  blurRadius: 5, // Radius blur bayangan
                  offset: Offset(0, 3), // Offset bayangan (x, y)
                ),
              ],
            ),
            margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                  onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false).toogleTheme(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
