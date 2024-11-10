import 'package:books/presantation/homescreen/subwidgets/bottom_sheet.dart';
import 'package:books/presantation/homescreen/widgets/Authorswidget.dart';
import 'package:books/presantation/homescreen/widgets/homewidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> screens = [
    const HomeView(),
    const AuthorsView(),
  ];

  final List<String> titles = ['App Name', 'Authors'];
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _currentindex == 1
            ? FloatingActionButton(
                onPressed: () {
                  //bottom sheet for adding author
                  bottomsheet(context);
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.black54)
            : null,

        //Appbar
        appBar: AppBar(
          title: Text(
            titles[_currentindex],
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
        ),

        //Body
        body: screens[_currentindex],

        //Botttom navigation bar
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.orange,
            currentIndex: _currentindex,
            onTap: (value) {
              setState(() {
                _currentindex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin), label: 'Authors')
            ]),
      ),
    );
  }
}
