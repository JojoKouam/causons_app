import 'package:flutter/material.dart';
import 'package:causons/archived.dart';
import 'package:causons/messages.dart';
import 'package:causons/settings.dart';
import 'package:causons/profil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Color(0xFFfcab35),
          unselectedLabelColor: Colors.white70,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Causons'),
          ),
          body: const TabBarView(
            children: [
              MessagesPage(),
              ArchivedPage(),
              SettingsPage(),
              ProfilPage(),
            ],
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat_outlined), text: 'Conversations'),
              Tab(icon: Icon(Icons.inventory_2_outlined), text: 'Archivées'),
              Tab(icon: Icon(Icons.settings), text: 'Paramètres'),
              Tab(icon: Icon(Icons.person), text: 'Profil'),
            ],
          ),

        ),
      ),
    );
  }
}
