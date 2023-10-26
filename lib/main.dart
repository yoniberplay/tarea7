import 'package:flutter/material.dart';
import 'package:tarea7/views/genero.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int posicion = 0;
  String titulo = '';

  // static var pantallas = [
  //   const CajaHerramientas(),
  //   GenderView(),
  //   EdadView(),
  //   PaisView(),
  //   HomeScreen(),
  //   WordPress()
  // ];
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Tareas', Icons.task, Colors.grey),
    Destination(1, 'Pendientes', Icons.pending, Colors.grey),
    Destination(2, 'Realizadas', Icons.done, Colors.grey),
  ];

  void mostrarPantalla(int index) {
    setState(() {
      posicion = index;
      titulo = allDestinations[index].title;
    });
  }

  void contactoModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Center(
            child: Text('Contactame',
                style: TextStyle(
                  fontSize: 20, // Tamaño de fuente grande
                  color: Colors.white, // Color blanco
                  fontWeight: FontWeight.bold, // Fuente en negrita
                )),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/foto.jpeg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Yoniber Encarnacion',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Desarrollador de Software',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          'yoniber.encarnacion@email.com',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          '829-988-4791',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar',
                  style: TextStyle(
                    fontSize: 18, // Tamaño de fuente grande
                    color: Colors.white, // Color blanco
                    fontWeight: FontWeight.bold,
                    // Fuente en negrita
                  )),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              tooltip: 'Contacto',
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                contactoModal();
              },
            ),
          ],
          title: Text(titulo,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.black,
        ),
        body: GenderView(),
        // IndexedStack(
        //   index: posicion,
        //   children: pantallas,
        // ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.black,
          selectedIndex: posicion,
          onDestinationSelected: (int index) {
            mostrarPantalla(index);
          },
          destinations: allDestinations.map((Destination destination) {
            return NavigationDestination(
              icon: Icon(destination.icon, color: destination.color),
              label: destination.title,
            );
          }).toList(),
        ));
  }
}

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);
  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}
