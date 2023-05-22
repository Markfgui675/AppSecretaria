import 'package:flutter/material.dart';

class Tests extends StatefulWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            DraggableScrollableSheet(
                initialChildSize: 0.3,
                minChildSize: 0.3,
                maxChildSize: 0.5,
                builder: (_, scrollController){
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(16),
                          child: Container(width: 50, height: 6, color: Colors.black,),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height*0.3,
                            child: ListView.separated(
                                controller: scrollController,
                                itemBuilder: (context, index){
                                  return ListTile(
                                    title: Text('Item $index'),
                                  );
                                },
                                separatorBuilder: (kl, lk){
                                  return const Divider();
                                },
                                itemCount: 20
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}


