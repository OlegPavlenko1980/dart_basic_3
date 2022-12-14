import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';

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
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> nav = ['Мои фото', 'Галерея'];

  Map<String, dynamic> data = {
    'Мои фото': [
      'https://img.desktopwallpapers.ru/rocks/pics/wide/1920x1200/27640f370156a0e0ae3ee9608fc8480a.jpg',
      'https://img.desktopwallpapers.ru/world/pics/wide/1920x1200/ec13dd5a2fb69efdb62c6b349de31e1f.jpg',
      'https://img1.akspic.ru/attachments/crops/2/2/4/0/50422/50422-senokosnoye_ugodye-pole-selskoe_hozyajstvo-zakat-risovoe_pole-2560x1440.jpg',
      'https://mobimg.b-cdn.net/v3/fetch/13/13fcae729f327cc0ba8e82dfda2291ea.jpeg'
    ],
    'Галерея': [
      'https://img2.fonwall.ru/o/iw/4000x2500-beach-city.jpg?route=mid&amp;h=750',
      'https://mobimg.b-cdn.net/v3/fetch/fc/fc97db329bd4482025eaa1e3961dc80e.jpeg',
      'https://catherineasquithgallery.com/uploads/posts/2021-02/1612678074_74-p-kartinka-fon-zelenii-lug-125.jpg',
      'https://img.fonwall.ru/o/63/zima-sneg-goryi-derevya.jpg?route=mid&amp;h=750'
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
            return ListView.builder(
              key: PageStorageKey(name),
              itemCount: data[name].length,
              controller: ScrollController(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 200,
                  /*child: CachedNetworkImage(
                    imageUrl: data[name][index],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),*/
                   child: Image.network(
                      data[name][index],
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
