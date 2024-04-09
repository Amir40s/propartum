import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propartum/provider/bottom_nav_provider.dart';
import 'package:propartum/screens/dashboard/dashboard_screen.dart';
import 'package:propartum/screens/profile/profile_screen.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/utils/images.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavProvider>(context);

    final List<Widget> screens = [
      DashboardScreen(),
      DashboardScreen(),
      DashboardScreen(),
      DashboardScreen(),
      DashboardScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: appColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.updateIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 24.0,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(MyIcons.ic_appointment,width: 24.0,height: 24.0,),
            activeIcon: Image.asset(MyIcons.ic_appointment,width: 24.0,height: 24.0,color: appColor,),
            label: "Appointment",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(MyIcons.ic_module,width: 24.0,height: 24.0,),
            activeIcon: Image.asset(MyIcons.ic_module,width: 24.0,height: 24.0,color: appColor,),
            label: "Modules",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(MyIcons.ic_payment,width: 24.0,height: 24.0,),
            activeIcon: Image.asset(MyIcons.ic_payment,width: 24.0,height: 24.0,color: appColor,),
            label: "Payments",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(MyIcons.ic_forum,width: 24.0,height: 24.0,),
            activeIcon: Image.asset(MyIcons.ic_forum,width: 24.0,height: 24.0,color: appColor,),
            label: "Forum",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(MyIcons.ic_profile,width: 24.0,height: 24.0,),
            activeIcon: Image.asset(MyIcons.ic_profile,width: 24.0,height: 24.0,color: appColor,),
            label: "Profile",
          ),
        ],
      ),
      body: screens[provider.currentIndex],
    );
  }
}
