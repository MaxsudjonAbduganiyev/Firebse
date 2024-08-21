import 'package:flutter/material.dart';
import 'package:malumotlar_ombori/data/model/mind_model.dart';
import 'package:malumotlar_ombori/main.dart';
import 'package:malumotlar_ombori/service/local_db_service.dart';
import 'package:malumotlar_ombori/ui/all_minds_page.dart';
import 'package:malumotlar_ombori/view_model/minds_view_model.dart';
import 'package:provider/provider.dart';

class WriteToDbPage extends StatelessWidget {
  WriteToDbPage({super.key});

    TextEditingController mind = TextEditingController();
    TextEditingController author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            context.read<MindsViewModel>().readMinds();

             Navigator.push(context, MaterialPageRoute(builder: (context) => AllMindsPage(), ));
          }, icon: Icon(Icons.read_more))
        ],
        backgroundColor: Colors.blue,
        title: Center(child: Text("Write to Database")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: mind,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<MindsViewModel>().addMind(MindModel(author: author.text, mind: mind.text));
          Navigator.push(context, MaterialPageRoute(builder: (context) => AllMindsPage(), ));


        },
      ),
    );
  }
}
