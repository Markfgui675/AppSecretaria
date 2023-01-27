import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Teste'),
        centerTitle: true,

      ),


      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Text('Texto'),
              Text('Texto'),
              Text('Texto'),
              Text('Texto'),
              Text('Texto'),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),
              Text('Texto', style: TextStyle(fontSize: 50),),

            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(
                onPressed: (){},
                child: Text('Botão')
            )

          ],
        ),
      ),

    );
  }
}
