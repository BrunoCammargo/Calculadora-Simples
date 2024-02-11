
import 'package:flutter/material.dart';


// -> Main
void main() {
  runApp( const MeuApp() );
}

// -> Widget MeuApp
class MeuApp extends StatelessWidget{
  const MeuApp( {Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

}

// -> Widget Homepage
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Atributos

  //Metodos
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
