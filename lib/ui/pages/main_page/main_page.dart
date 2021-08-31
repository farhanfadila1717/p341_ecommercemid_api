import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../favorite_page/favorite_page.dart';
import '../bag_page/bag_page.dart';
import '../categories_page/categories_page.dart';
import '../profile_page/profile_page.dart';
import '../home_page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          CategoriesPage(),
          BagPage(),
          FavoritePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.shoppingCart), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.shoppingBag), label: 'Bag'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart),
              label: 'Fav',
              activeIcon: Icon(FontAwesomeIcons.solidHeart)),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              label: 'Profile',
              activeIcon: Icon(FontAwesomeIcons.userAlt)),
        ],
      ),
    );
  }
}
