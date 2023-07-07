import 'package:flutter/material.dart';
import 'package:flutterapp_udemy_foodpanda/Authentication/login.dart';
import 'package:flutterapp_udemy_foodpanda/Authentication/register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.white,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          title: const Text(
            'ifood',
            style: TextStyle(
              fontSize: 60,
              color: Colors.black,
              fontFamily: 'Lobster',
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock, color: Colors.black,),
                text: 'Login',
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.black,),
                text: 'Register',
              ),
            ],
            indicatorColor: Colors.indigo,
            indicatorWeight: 6,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Colors.grey,
                Colors.white,
              ],
            ),
          ),
          child: const TabBarView(
            children: [
              LoginScreen(),
              RegisterScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
