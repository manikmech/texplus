import 'package:flutter/material.dart';

class test_webapp extends StatefulWidget {
  const test_webapp({super.key});

  @override
  State<test_webapp> createState() => _test_webappState();
}

class _test_webappState extends State<test_webapp> {
  Set<int> selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              color: Color.fromRGBO(255, 255, 255, 0.9),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 5,
              child: (Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                        height: 30,
                        width: 70,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                        child: Column(
                      children: [
                        ListTile(
                          leading: ImageIcon(
                            AssetImage('assets/icons/homeicon.png'),
                            // Path to your image
                            size: 20.0, // Icon size
                            color: Color.fromRGBO(171, 181, 186, 1),
                            // color: Color.fromRGBO(171, 181, 186, 1), // Optional: Tint color for the icon
                          ),
                          title: Text('Home',
                              style: TextStyle(color: Colors.black)),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: ImageIcon(
                            AssetImage('assets/icons/favorite.png'),
                            // Path to your image
                            size: 20.0, // Icon size
                            color: Color.fromRGBO(171, 181, 186,
                                1), // Optional: Tint color for the icon
                          ),
                          title: Text('Categories',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color.fromRGBO(171, 181, 186, 1))),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: ImageIcon(
                            AssetImage('assets/icons/homeicon.png'),
                            // Path to your image
                            size: 20.0, // Icon size
                            color: Color.fromRGBO(171, 181, 186,
                                1), // Optional: Tint color for the icon
                          ),
                          //Icon(ImageIcon(),Icons.favorite, color: Color.fromRGBO(171, 181, 186, 1)),
                          title: Text('Favorite',
                              style: TextStyle(
                                  color: Color.fromRGBO(171, 181, 186, 1))),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: ImageIcon(
                            AssetImage('assets/icons/library.png'),
                            // Path to your image
                            size: 20.0, // Icon size
                            color: Color.fromRGBO(171, 181, 186,
                                1), // Optional: Tint color for the icon
                          ),
                          title: Text('Library',
                              style: TextStyle(
                                  color: Color.fromRGBO(171, 181, 186, 1))),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: ImageIcon(
                            AssetImage('assets/icons/setting.png'),
                            // Path to your image
                            size: 20.0, // Icon size
                            color: Color.fromRGBO(171, 181, 186,
                                1), // Optional: Tint color for the icon
                          ),
                          title: Text('Setting',
                              style: TextStyle(
                                  color: Color.fromRGBO(171, 181, 186, 1))),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: ImageIcon(
                            AssetImage('assets/icons/logout.png'),
                            // Path to your image
                            size: 20.0, // Icon size
                            color: Color.fromRGBO(171, 181, 186,
                                1), // Optional: Tint color for the icon
                          ),
                          title: Text('Logout',
                              style: TextStyle(
                                  color: Color.fromRGBO(171, 181, 186, 1))),
                          onTap: () {},
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        height: 180,
                        width: 150,
                        child: Image.asset(
                          'assets/images/bottom.png',
                          fit: BoxFit.fitHeight,
                        )
                    ),
                  ],
                ),
              ))),
          // Container(
          //     color: Colors.blue,
          //     height: MediaQuery.of(context).size.height,
          //     width: MediaQuery.of(context).size.width/6,
          //     child: Column()),
          // Column(),
          // Column(),
        ],
      ),
    );
  }
}
