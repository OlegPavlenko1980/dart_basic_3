import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> nav = ['Список 1', 'Список 2'];
  //final List fakeData = List.generate(100, (index) => index.toString());
  String tab_sel = 'Мои фото';
  Map<String, dynamic> data = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Homework example'),
          bottom: TabBar(
            tabs: <Widget>[
              ...nav.map((e) {
                return Tab(text: e);
              }).toList()
            ],
          ),
        ),
        body: TabBarView(
          children: nav.map((name) {
            if (name == 'Список 2') tab_sel = 'Галерея';
            return ListView(
              controller: ScrollController(),
              key: PageStorageKey(name),
              children: <Widget>[
                for (var i = 0; i < data[tab_sel].length; i++)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(26.0),
                      child: Text(data[tab_sel][i]),
                    ),
                  ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}