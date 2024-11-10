import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:books/presantation/homescreen/bloc/home_bloc.dart';
import 'package:books/presantation/homescreen/homescreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchBooks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FlutterSplashScreen.scale(
        animationDuration: const Duration(seconds: 2),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.orange,
        childWidget: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: const Center(
            child: Icon(
              Icons.book_rounded,
              color: Colors.orange,
              size: 50,
            ),
          ),
        ),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        nextScreen: HomePage(),
      ),
    );
  }
}
