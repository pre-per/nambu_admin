import 'package:flutter/material.dart';
import 'package:nambu_admin/provider/navigationbarprovider.dart';
import 'package:provider/provider.dart';
import 'package:nambu_admin/screen/main/calendarscreen.dart';
import 'package:nambu_admin/screen/main/homescreen.dart';
import 'package:nambu_admin/screen/main/noticescreen.dart';
import 'package:nambu_admin/screen/main/profilescreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Navigationbarprovider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: Mainscreen(),
    );
  }
}

class Mainscreen extends StatelessWidget {
  final List<Widget> _screens = [
    Homescreen(),
    Calendarscreen(),
    Noticescreen(),
    Profilescreen(),
  ];

  Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Navigationbarprovider>(context);
    return Scaffold(
      body: _screens[provider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: provider.updateIndex,
        currentIndex: provider.selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: '캘린더'),
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label: '공지'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
    );
  }
}
