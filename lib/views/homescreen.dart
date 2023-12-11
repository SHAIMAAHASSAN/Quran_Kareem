import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_kareem/view_model/sura_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SuraViewModel>(builder: (context, value, child) {
      return ListView.builder(
          itemCount: value.suar.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/download.jpeg"),
                radius: 30,
              ),
              title: Text(value.suar[index].title),
              subtitle: Text(value.suar[index].subtitle),
              trailing: IconButton(
                icon: Icon(
                  value.suar[index].isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () => value.play(index),
              ),
            )
                // SuraCard(audio: value.suar[index].audio, title:value.suar[index]. title,
                //subtitle: value.suar[index].subtitle)
                ;
            //  Provider.of<SuraViewModel>(context, listen: false).;
          });
    });
  }
}
