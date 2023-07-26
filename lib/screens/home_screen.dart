import 'package:flutter/material.dart';
import 'package:pixel/resources/auth_methods.dart';
import 'package:pixel/screens/history_meeting_screen.dart';
import 'package:pixel/screens/meeting_screen.dart';
import 'package:pixel/utils/colors.dart';
import 'package:pixel/widgets/custom_button.dart';
import 'package:pixel/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _page = 0;
  onPageChanged(int page){
    setState(() {
      _page =page;
    });

  }


  List<Widget> pages =[
      MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    CustomButton(text: 'Log Out', onPressed: ()=>AuthMethods().signOut())

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
              ),
              label: 'Meet & Chat',
              ),

              BottomNavigationBarItem(
               
            icon: Icon(
              Icons.lock_clock,
              ),
              label: 'Meeting',
              ),

              BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              ),
              label: 'Contacts',
              ),

              BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              ),
              label: 'Settings',
              ),
            ],
        ),
    );
  }
}

