import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/news_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/routes/BooksScreen/books_screen.dart';
import 'package:my_app/screens/routes/NewsScreen/create_news_screen.dart';
import 'package:my_app/screens/routes/SecondScreen/custom_screen.dart';
import 'package:my_app/screens/routes/SecondScreen/second_screen.dart';
import 'package:my_app/screens/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Screen'),
      routes: {
        '/second-screen': (context) => const SecondScreen(),
        '/custom-screen': (context) => const CustomScreen(),
        '/news-screen': (context) => const NewsScreen(),
        '/create-news-screen': (context) => const CreateNewsScreen(),
        '/books-screen': (context) => const BooksScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    
    const ProfileScreen(),
    const BooksScreen(),

    const SettingScreen(),
  ];

  final List<String> _appBarTitles = const [
    'Home',

    'Auction',
    'Notes',

    'Profile',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateAndCloseDrawer(BuildContext context, String routeName) {
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.pop(context); // Close the drawer first
    }
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Agus 4IKI'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            
            ListTile(
              title: const Text('Auction'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Notes'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Profile'),
              selected: _selectedIndex == 3,
              onTap: () {
                // Update the state of the app
                _onItemTapped(3);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 219, 38, 38),
        unselectedItemColor: Colors.grey, // Color for unselected items
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Auction',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.note, ),
            label: 'Notes',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(247, 232, 21, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
