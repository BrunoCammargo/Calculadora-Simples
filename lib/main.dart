
import 'package:flutter/material.dart';


// -> Main
void main() {
  runApp( const MyApp() );
}

// -> Widget MeuApp
class MyApp extends StatelessWidget{
  const MyApp( {Key? key} ) : super(key: key);

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
  MyWidgets myWidgets = MyWidgets();

  //Metodos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 90),
              Padding(padding: EdgeInsets.only(left: 20, right: 30), child: myWidgets.txtMain),
              const SizedBox(height: 100),
              Padding(padding: EdgeInsets.only(left: 15, right: 15), child: myWidgets.txtSub) ,
              const Divider(),
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: myWidgets.buttons,
                  )
              ),
            ],
        )
      )
    );
  }
}


// MyWidgets
class MyWidgets{

  //variaveis
  static MainAxisAlignment alignmentButtons = MainAxisAlignment.spaceEvenly;
  static double spacingButton = 10;

  Text txtMain = const Text(
    'Main',
    style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
    textAlign: TextAlign.right,
    textDirection: TextDirection.rtl,
    );

  Text txtSub = const Text(
    'Sub-main',
    style: TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
    textAlign: TextAlign.left,
    textDirection: TextDirection.rtl,
    );

  List<Widget> buttons = [
    SizedBox(height: spacingButton + 20),
    Row(
      mainAxisAlignment: alignmentButtons,
      children: [
      createTextButton('C', txtColor: Colors.redAccent),
      createTextButton('+-'),
      createTextButton(','),
      createTextButton('/', txtColor: Colors.green)
      ],
    ),

    SizedBox(height: spacingButton),
    Row(
      mainAxisAlignment: alignmentButtons,
      children: [
      createTextButton('7', funcOn: null),
      createTextButton('8', funcOn: null),
      createTextButton('9', funcOn: null),
      createTextButton('X', txtColor: Colors.green, funcOn: null)
      ],
    ),

    SizedBox(height: spacingButton),
    Row(
      mainAxisAlignment: alignmentButtons,
      children: [
      createTextButton('4', funcOn: null),
      createTextButton('5', funcOn: null),
      createTextButton('6', funcOn: null),
      createTextButton('-', txtColor: Colors.green, funcOn: null)
      ],
    ),

    SizedBox(height: spacingButton),
    Row(
      mainAxisAlignment: alignmentButtons,
      children: [
      createTextButton('1', funcOn: null),
      createTextButton('2', funcOn: null),
      createTextButton('3', funcOn: null),
      createTextButton('+', txtColor: Colors.green, funcOn: null)
      ],
    ),

    SizedBox(height: spacingButton),
    Row(
      mainAxisAlignment: alignmentButtons,
      children: [
      createTextButton('', bgColor: Color.fromRGBO(33, 33, 33, 0) ),
      createTextButton('0', funcOn: null),
      createTextButton('', bgColor: Color.fromRGBO(33, 33, 33, 0)),
      createTextButton('=', bgColor: Colors.lightGreen, funcOn: null)
      ],
    ),
  ];

  // Metodos
  static TextButton createTextButton(String txt, {Color? bgColor, Color? txtColor, void Function()? funcOn}){
    TextButton _button = TextButton(
        style: TextButton.styleFrom(
            backgroundColor: bgColor == null ? Color.fromRGBO(33, 33, 33, 0.7) : bgColor,
            fixedSize: Size(65, 65),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        onPressed: funcOn,
        child: Text(
          txt,
          style: TextStyle(color: (txtColor == null ? Colors.white : txtColor) , fontSize: 35),
          )
    );
    return _button;
  }

}