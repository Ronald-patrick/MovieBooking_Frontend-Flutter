import 'package:flutter/material.dart';
import 'cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DarkLightTheme();
  }
}

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({
    Key key,
  }) : super(key: key);

  @override
  _DarkLightThemeState createState() => _DarkLightThemeState();
}

ThemeData _darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  accentColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
);

ThemeData _lightTheme = ThemeData(
  primaryColor: Colors.white,
  accentColor: Colors.black,
  brightness: Brightness.light,
);

bool _light = true;

class _DarkLightThemeState extends State<DarkLightTheme> {
  @override
  Widget build(BuildContext context) {
    dynamic themeAccent() {
      (_light) ? Colors.black : Colors.white;
    }

    dynamic themeDark() {
      (_light) ? Colors.grey[300] : Colors.white;
    }

    return MaterialApp(
      theme: _light ? _lightTheme : _darkTheme,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: themeAccent(),
              size: 40,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.account_circle_outlined,
                    color: themeAccent(), size: 40),
                onPressed: () {}),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: IconButton(
                    icon: Center(
                      child: Icon(
                        Icons.bedtime,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        (_light == true) ? _light = false : _light = true;
                      });
                    }),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello Ronald,',
                    style: TextStyle(
                        color: themeAccent(),
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
                SizedBox(height: 10),
                Text('Book Your Favourite Movie!',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 18, letterSpacing: 1)),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: 'Search Theatre, Movies, Location, etc.',
                        filled: true,
                        fillColor: themeDark(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2),
                        )),
                  ),
                ),
                Cards(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Most Popular',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900)),
                      Text('See All', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-ZBkxD13AR2VIfh_JUbVheDv_60QerQOMt7lTMPGLVad4j50daqYmWOklexEK8ZgpRG0&usqp=CAU',
                        height: 160.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text("Avatar",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w900)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                'IMDb',
                                style: TextStyle(
                                    backgroundColor: Colors.amber,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12),
                              ),
                            ),
                            Text(
                              "7.8/10",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Text(
                          'Sci-fi/ Adventure',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey,
                size: 35,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  color: themeDark(),
                  size: 35,
                ),
                title: Text('Explore',
                    style: TextStyle(
                      color: themeAccent(),
                    ))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.confirmation_num,
                  color: themeDark(),
                  size: 35,
                ),
                title: Text('Bookings',
                    style: TextStyle(
                      color: themeAccent(),
                    ))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: themeDark(),
                  size: 35,
                ),
                title: Text('Profile',
                    style: TextStyle(
                      color: themeAccent(),
                    ))),
          ],
        ),
      ),
    );
  }
}
