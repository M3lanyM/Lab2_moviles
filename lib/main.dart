import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    SismosScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.waves),
            label: 'Sismos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '¿Lo sentiste?',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Más',
          ),
        ],
      ),
    );
  }
}

class SismosScreen extends StatefulWidget {
  const SismosScreen({super.key});

  @override
  _SismosScreenState createState() => _SismosScreenState();
}

class _SismosScreenState extends State<SismosScreen> {
  List<bool> _selections = [true, false];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sismos'),
          actions: [
            IconButton(
              icon: Icon(Icons.help_outline),
              color: Colors.orange,
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            tabs: [
              Tab(text: 'Mapas'),
              Tab(text: 'Lista'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/mapa.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    left: 0,
                    bottom: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToggleButtons(
                          children: const [
                            Text('24 Horas'),
                            Text('15 Días'),
                          ],
                          isSelected: _selections,
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0;
                                  buttonIndex < _selections.length;
                                  buttonIndex++) {
                                if (buttonIndex == index) {
                                  _selections[buttonIndex] = true;
                                } else {
                                  _selections[buttonIndex] = false;
                                }
                              }
                            });
                          },
                        ),
                      ],
                    )),
              ],
            ),
            const Center(
              child: Text('Contenido del tab de Lista'),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
