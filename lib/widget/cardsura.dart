import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/sura_view_model.dart';

class SuraCard extends StatelessWidget {
   SuraCard({required this.audio, required this.title, required this.subtitle
     ,super.key});
  String title;
  String subtitle;
  String audio;
   //void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Consumer<SuraViewModel>(builder: (context, value, child)
    {
      return ListTile(
//
// tileColor:Colors.cyan ,
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/images/download.jpeg"),
          radius: 30,),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing:
        FittedBox(
          child: Row(
            children: [
              IconButton(
                onPressed: () {

// print("============>play sound");
                },
                icon:  const Icon(Icons.play_arrow),
              ),
              const SizedBox(
                width: 8,
              ),
              IconButton(
                onPressed: () {

                  print("============>replay sound");
                },
                icon: const Icon(Icons.replay),
              ),
            ],
          ),
        ),
      );
    });

  }
}


