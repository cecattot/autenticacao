import 'dart:async';

import 'package:autenticacao/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class add extends StatefulWidget {
  add({Key? key, }) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  final emailctrl = TextEditingController();
  final nomectrl = TextEditingController();
  final senhactrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adcionar Aluno ")),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: nomectrl,
              decoration: InputDecoration(
                  icon: Icon(Icons.edit), //icon of text field
                  labelText: "Nome" //label text of field
              )
          ),
          alignment: Alignment.centerRight,
          color: Colors.white70,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
          controller: emailctrl,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(Icons.email), //icon of text field
              labelText: "Email" //label text of field
            )
            ),
          alignment: Alignment.centerRight,
          color: Colors.white70,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: senhactrl,
            obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.password), //icon of text field
                  labelText: "Senha" //label text of field
              )
          ),
          alignment: Alignment.centerRight,
          color: Colors.white70,
        ),
        Row(
          children:
          [
            Expanded(flex: 2, child: Container()),
            Container( child: ElevatedButton(
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: (){
              setState(() {
                Cadastrar();
              });
            },
            child: Icon(Icons.add),
          ),
          margin: const EdgeInsets.all(1.0),
          ),
          Container(child: ElevatedButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: (){
              setState(() {
                // nomectrl.dispose();
                Navigator.of(context).pop(MaterialPageRoute(
                    builder: (context) => MyLogin()
                ));
              });
            },
            child: Icon(Icons.remove),
          ),
            margin: const EdgeInsets.all(1.0),
          )]
        )
      ]),
    );
  }

  Future<void> Cadastrar() async{
    if(nomectrl.text == "" || emailctrl.text == "" || senhactrl.text == "" ){
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Os campos não podem ter valor nulo.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    return;
    }

    User? user;
    try{
      FirebaseAuth autenticacao = FirebaseAuth.instance;

      UserCredential credential = await
      autenticacao.createUserWithEmailAndPassword(email: emailctrl.text, password: senhactrl.text);
      user = credential.user;
      await user!.updateDisplayName(nomectrl.text);
      await user.reload();
      user.sendEmailVerification();
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(''),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Cadastro Realizado'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Atenção'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('$e'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
