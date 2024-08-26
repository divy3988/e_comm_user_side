import 'package:e_comm/Provider/user_provider.dart';
import 'package:e_comm/pages_users/BottomNav.dart';
import 'package:e_comm/pages_users/home.dart';
import 'package:e_comm/pages_users/login.dart';
import 'package:e_comm/pages_users/signup.dart';
import 'package:e_comm/pages_users/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final String adminemail = 'test123@gmail.com';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Sign-Up': (context) => SignUp(),
        '/BottomNav': (context) => Bottomnav(),
        '/log-in': (context) => LogIn(),
        '/home': (context) => HomePage(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black45),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          ),
        ],
        child: Stream(),
      ),
    );
  }

  StreamBuilder<User?> Stream() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        if (snapshots.connectionState == ConnectionState.active) {
          if (snapshots.hasData) {
            if (snapshots.data!.email != adminemail) return Bottomnav();
          }
        }
        return welcome();
      },
    );
  }
}
