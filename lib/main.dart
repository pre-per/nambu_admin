import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nambu_admin/provider/calendaraddplanprovider.dart';
import 'package:nambu_admin/provider/calendarprovider.dart';
import 'package:nambu_admin/provider/navigationbarprovider.dart';
import 'package:nambu_admin/provider/noticewritingprovider.dart';
import 'package:nambu_admin/provider/randomnumprovider.dart';
import 'package:nambu_admin/provider/sportpersonprovider.dart';
import 'package:nambu_admin/screen/main/bathscreen.dart';
import 'package:nambu_admin/screen/main/deliveryscreen.dart';
import 'package:nambu_admin/screen/main/sportscreen.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nambu_admin/screen/sub/calendar/calendarscreen.dart';
import 'package:nambu_admin/screen/main/homescreen.dart';
import 'package:nambu_admin/screen/sub/calendar/noticescreen.dart';
import 'package:nambu_admin/screen/main/profilescreen.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', null);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Navigationbarprovider()),
        ChangeNotifierProvider(create: (_) => Calendarprovider()),
        ChangeNotifierProvider(create: (_) => NoticeProvider()),
        ChangeNotifierProvider(create: (_) => Calendaraddplanprovider()),
        ChangeNotifierProvider(create: (_) => SportpersonProvider()),
        ChangeNotifierProvider(create: (_) => RandomnumProvider()),
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
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.notoSansKrTextTheme(),
      ),
      home: Mainscreen(),
    );
  }
}

class Mainscreen extends StatelessWidget {
  final List<Widget> _screens = [
    Homescreen(),
    Sportscreen(),
    Bathscreen(),
    Deliveryscreen(),
    Profilescreen(),
  ];

  Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Navigationbarprovider>(context);
    return Scaffold(
      body: PageView(
        controller: provider.pageController,
        onPageChanged: provider.onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: provider.updateIndex,
        currentIndex: provider.selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_run), label: '운동회'),
          BottomNavigationBarItem(icon: Icon(Icons.bathtub), label: '목욕탕'),
          BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining), label: '도시락 배달'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
    );
  }
}
