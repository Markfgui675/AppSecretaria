import 'package:flutter/material.dart';

class Tests extends StatefulWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context){
                          return Container(
                            height: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text('Teste'),
                                ),
                                InkWell(
                                  onTap: (){},
                                  child: Text('Teste'),
                                )
                              ],
                            ),
                          );
                        }
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Icon(Icons.add, color: Colors.white, size: 32,),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}


