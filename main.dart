import 'package:flutter/material.dart';
import 'add.dart';
import 'jogo.dart';
// Import the generated file
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyLogin());
}

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const myLoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class myLoginPage extends StatefulWidget {
  const myLoginPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<myLoginPage> createState() => _myLoginPageState();
}

class _myLoginPageState extends State<myLoginPage> {

  @override
  Widget build(BuildContext context) {
    final txtPassword = TextEditingController();
    final txtEmail = TextEditingController();

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the myLoginPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(flex: 1, child: Row(
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(flex: 20, child: Column(
                children: [
                  Expanded(flex: 1, child: Container(
                    child: TextField(
                        controller: txtEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(Icons.edit), //icon of text field
                            labelText: "email" //label text of field
                        )
                    ),
                    alignment: Alignment.centerRight,
                    color: Colors.white70,
                  )),
                  Expanded(flex: 1, child: Container(
                    child: TextField(
                        controller: txtPassword,
                        obscureText: true,//icon of text field
                        decoration: InputDecoration(
                            icon: Icon(Icons.password),
                            labelText: "password" //label text of field
                        )
                    ),
                    alignment: Alignment.centerRight,
                    color: Colors.white70,
                  )),
                  Center(
                      child: Row(
                          children: [
                            Expanded(flex: 2, child: Container()),
                            Container(
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blueGrey),
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => MyPlay()
                                    ));
                                  });
                                },
                                child: Text("Login"),
                              ),
                              margin: const EdgeInsets.all(1.0),),
                            Container(
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blueGrey),
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => add()
                                    ));
                                  });
                                },
                                child: Text("Cadastrar"),
                              ),
                              margin: const EdgeInsets.all(1.0),
                            ),
                          ]
                      )
                  ),
                ],
              )
              ),
              Expanded(flex: 1, child: Container()),
            ],
          )),
          Expanded(flex: 1, child: Container()),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


