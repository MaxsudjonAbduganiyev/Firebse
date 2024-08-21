import 'package:flutter/material.dart';
import 'package:malumotlar_ombori/data/model/mind_model.dart';
import 'package:malumotlar_ombori/main.dart';
import 'package:malumotlar_ombori/ui/all_minds_page.dart';
import 'package:malumotlar_ombori/ui/write_to_db_page.dart';
import 'package:malumotlar_ombori/view_model/minds_view_model.dart';
import 'package:provider/provider.dart';

class MindItem extends StatelessWidget {
  MindModel mind;
  MindItem({required this.mind, super.key});
  TextEditingController mindCtrl = TextEditingController();
  TextEditingController author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mindCtrl.text = mind.mind;
    author.text = mind.author;
    return ListTile(
      onLongPress: () {
        showDialog(context: context, builder: (context) => AlertDialog(
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Bekor qilish")),
            TextButton(onPressed: () {
              context.read<MindsViewModel>().deleteMinds(mind.mind);
               Navigator.pop(context);
            }, child: Text("Ha"))
          ],
          title: Text("O`chirasizmi?"),
        ),);

      },
      title: Text(mind.mind),
      subtitle: Text(mind.author),
      trailing: IconButton(onPressed: () {
   showDialog(context: context, builder: (context) => AlertDialog(
     actions: [
       TextButton(onPressed: () {
         Navigator.pop(context);
       }, child: Text("Bekor qilish")),
       TextButton(onPressed: () {
         context.read<MindsViewModel>().updateMinds(MindModel(author: author.text, mind: mindCtrl.text), mind.mind);
         Navigator.pop(context);
       }, child: Text("Yangilash"))
     ],
     content: SizedBox(
       height: 150,
       child: Column(
         children: [
           TextField(
             controller: mindCtrl,
             decoration: InputDecoration(
                 label: Text("Quote"), border: OutlineInputBorder()),
           ),
           SizedBox(
             height: 24,
           ),
           TextField(
             controller: author,
             decoration: InputDecoration(
                 label: Text("Author"), border: OutlineInputBorder()),
           )
         ],
       ),
     ),
   ),);
      }, icon: Icon(Icons.edit)),
    );
  }
}
