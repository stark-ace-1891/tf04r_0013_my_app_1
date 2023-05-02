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

class Noticia {
  final String titulo;
  final List<String> detalle;
  Noticia({required this.titulo, required this.detalle});
}

class MyApp extends StatelessWidget {
  List<Noticia> noticias = [
    Noticia(
      titulo:
          "Esponjosas, húmedas y dulces: Guía de las 5 tortas de chocolate que debes probar en Lima",
      detalle: [
        "Un postre que cae bien en cualquier momento y que guarda los recuerdos de la infancia, así es la torta de chocolate.",
        "Es por eso, que, para este tiempo, en el que el sol aún nos acompaña, pero que las noches empiezan a ser más frescas, esta torta es un imperdible. Aquí te dejamos cinco opciones que debes probar en Lima.",
      ],
    ),
    Noticia(
      titulo:
          "¿Dónde venden la mejor torta de chocolate de Lima? Las elegidas de los lectores de Provecho",
      detalle: [
        "El 27 de enero de cada año se celebra el Día Internacional de la Torta de Chocolate, esta tradición nace en Estados Unidos con el nombre de 'Chocolat Cake Day'.",
        "Para celebrar este día, le preguntamos a los lectores de Provecho cuál es la mejor torta de chocolate de Lima y estas fueron las diez más mencionadas.",
      ],
    ),
  ];

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
              color: Colors.brown,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notification_add_outlined,
                color: Colors.brown,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
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
              SizedBox(
                height: 10,
              ),
              ...noticias
                  .map(
                    (Noticia e) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            e.titulo,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        ...e.detalle
                            .map(
                              (String item) => ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item),
                                ),
                                minLeadingWidth: 3,
                                leading: Icon(
                                  Icons.cake,
                                  color: Colors.brown,
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
