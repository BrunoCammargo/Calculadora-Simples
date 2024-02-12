
import 'package:flutter/material.dart';
import 'dart:math';

// -> Main
void main() {
  runApp(const MyApp());
}

// -> Widget MeuApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  static String textMain = '';
  static String textSub = '';
  String op = '';
  num? leftNumber;
  num? rightNumber;
  num? res;


  //Metodos
  Function clickNumber(String digit)
  {
    void _click()
    {
      
      setState(() {
        if(digit == '.'){
          if(textMain.isNotEmpty && textMain.indexOf('.') == -1)
            {
              textMain = "$textMain$digit";
            }
        }

        else
        {
          textMain = textMain + digit;
        }

      });
    }

    return _click;
  }

  Function clickOp(String digit)
  {
    void _click()
    {

      if(textMain.isEmpty && leftNumber == null) {return;}

      setState(() {
          if(leftNumber == null) {
            leftNumber = num.parse(textMain);
            textMain = '';
          }
          op = digit;
          textSub = '$leftNumber $op ';
      } );
    }

    return _click;
  }

  Function clickDel(String digit)
  {
    void _click()
    {
      setState(() {
        if(digit == '<' && textMain.isNotEmpty) {
          textMain = textMain.substring(0, textMain.length - 1);
        }
        else if(digit == 'c' && (textMain.isNotEmpty || leftNumber != null)) {
          textMain = '';
          textSub = '';
          leftNumber = null;
          rightNumber = null;
          res = 0;
        }
      });

    }

    return _click;
  }

  void clickRes()
  {
    setState(() {

      if(textMain.isNotEmpty) {
        rightNumber = num.parse(textMain);

        switch(op)
        {
          case '+':
            res = leftNumber! + rightNumber!;
            break;

          case '-':
            res = leftNumber! - rightNumber!;
            break;

          case '/':
            res = leftNumber! / rightNumber!;
            break;

          case 'x':
            res = leftNumber! * rightNumber!;
            break;

          case '^':
            res = pow(leftNumber!, rightNumber!);
            break;
        }

        textMain = res.toString();
        textSub = '$leftNumber $op $rightNumber = $res';

        leftNumber = null;
        rightNumber = null;
        op = '';

      }

    });
  }

  void clickNegative(){
      setState(() {

        if(textMain.isNotEmpty)
        {
          if(textMain.indexOf('-') != -1)
          {
            textMain = textMain.substring(1);
          }
          else
          {
            textMain = '-' + textMain;
          }
        }

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 90),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: myWidgets.createTxtMain()),
            const SizedBox(height: 100),
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: myWidgets.createTxtSub()),
            const Divider(),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: myWidgets.createButtons(
                  clickNumber: clickNumber,
                  clickOp: clickOp,
                  clickDel: clickDel,
                  clickNegative: clickNegative,
                  clickRes: clickRes
              ),
            )),
          ],
        )));
  }
}

// MyWidgets
class MyWidgets {
  //variaveis
  static MainAxisAlignment alignmentButtons = MainAxisAlignment.spaceEvenly;
  static double spacingButton = 10;


  // Metodos

  Text createTxtMain()
  {
    return Text(
      _HomePageState.textMain,
      style: const TextStyle(
          color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
      textAlign: TextAlign.right,
      textDirection: TextDirection.ltr,
    );
  }

  Text createTxtSub()
  {
    return Text(
      _HomePageState.textSub,
      style: const TextStyle(
          color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
      textAlign: TextAlign.right,
      textDirection: TextDirection.ltr,
    );
  }

  List<Widget> createButtons(
      {dynamic clickNumber, dynamic clickOp, dynamic clickDel, dynamic clickRes, dynamic clickNegative})
  {
    List<Widget> buttons = [
      SizedBox(height: spacingButton + 20),
      Row(
        mainAxisAlignment: alignmentButtons,
        children: [
          createTextButton('C', txtColor: Colors.redAccent, funcOn: clickDel('c')),
          createTextButton('◀', txtColor: Colors.redAccent, funcOn: clickDel('<')),
          createTextButton('^', txtColor: Colors.green, funcOn: clickOp('^')),
          createTextButton('/', txtColor: Colors.green, funcOn: clickOp('/'))
        ],
      ),
      SizedBox(height: spacingButton),
      Row(
        mainAxisAlignment: alignmentButtons,
        children: [
          createTextButton('7', funcOn: clickNumber('7')),
          createTextButton('8', funcOn: clickNumber('8')),
          createTextButton('9', funcOn: clickNumber('9')),
          createTextButton('x', txtColor: Colors.green, funcOn: clickOp('x'))
        ],
      ),
      SizedBox(height: spacingButton),
      Row(
        mainAxisAlignment: alignmentButtons,
        children: [
          createTextButton('4', funcOn: clickNumber('4')),
          createTextButton('5', funcOn: clickNumber('5')),
          createTextButton('6', funcOn: clickNumber('6')),
          createTextButton('-', txtColor: Colors.green, funcOn: clickOp('-'))
        ],
      ),
      SizedBox(height: spacingButton),
      Row(
        mainAxisAlignment: alignmentButtons,
        children: [
          createTextButton('1', funcOn: clickNumber('1')),
          createTextButton('2', funcOn: clickNumber('2')),
          createTextButton('3', funcOn: clickNumber('3')),
          createTextButton('+', txtColor: Colors.green, funcOn: clickOp('+'))
        ],
      ),
      SizedBox(height: spacingButton),
      Row(
        mainAxisAlignment: alignmentButtons,
        children: [
          createTextButton('+-', funcOn: clickNegative),
          createTextButton('0', funcOn: clickNumber('0')),
          createTextButton(',', funcOn: clickNumber('.')),
          createTextButton('=', bgColor: Colors.lightGreen, funcOn: clickRes)
        ],
      ),
    ];
    return buttons;
  }

  static TextButton createTextButton(String txt,
      {Color? bgColor, Color? txtColor, void Function()? funcOn}) {
    TextButton button = TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
              bgColor == null ? const Color.fromRGBO(33, 33, 33, 0.7) : bgColor,
          fixedSize: const Size(65, 65),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        onPressed: funcOn,
        child: Text(
          txt,
          style: TextStyle(
              color: (txtColor == null ? Colors.white : txtColor),
              fontSize: 35),
        ));
    return button;
  }
}
