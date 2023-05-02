import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Util {
  static getMonth(int index) {
    switch (index) {
      case 1:
        return "Enero";
      case 2:
        return "Febrero";
      case 3:
        return "Marzo";
      case 4:
        return "Abril";
      case 5:
        return "Mayo";
      case 6:
        return "Junio";
      case 7:
        return "Julio";
      case 8:
        return "Agisto";
      case 9:
        return "Setiembre";
      case 10:
        return "Octubre";
      case 11:
        return "Noviembre";
      case 12:
        return "Diciembre";
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now().toUtc();
    String subtitulo =
        "${Util.getMonth(now.month).toUpperCase()} ${now.day.toString()} a las ${(now.hour).toString()}:${now.minute.toString()}";
    print(subtitulo);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.blue,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notification_add_outlined,
                color: Colors.blue,
              ),
            ),
          ],
          title: SizedBox(
            width: 180,
            height: 40,
            child: Image(
              image: AssetImage(
                "assets/images/logo.png",
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                subtitulo,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const Image(
              image: AssetImage(
                "assets/images/noticia.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
