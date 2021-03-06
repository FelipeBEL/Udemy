import 'package:atividadecodetec/screens/home_screen.dart';
import 'package:atividadecodetec/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;
bool isLoggedIn;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  isLoggedIn = prefs.getInt("userId") != null ? true : false;
  print(isLoggedIn);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Atividade CodeTec',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 83, 171),
        textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
      ),
      home: isLoggedIn && isLoggedIn != null ? HomeScreen() : LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
