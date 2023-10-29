import 'package:flutter/material.dart';
import 'package:tarea7/views/TaskListScreen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
      body: TaskListScreen(),
      // IndexedStack(
      //   index: posicion,
      //   children: pantallas,
      // ),
      // bottomNavigationBar: NavigationBar(
      //   backgroundColor: Colors.black,
      //   selectedIndex: posicion,
      //   onDestinationSelected: (int index) {
      //     mostrarPantalla(index);
      //   },
      //   destinations: allDestinations.map((Destination destination) {
      //     return NavigationDestination(
      //       icon: Icon(destination.icon, color: destination.color),
      //       label: destination.title,
      //     );
      //   }).toList(),
      // )
    );
  }
}

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);
  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}
