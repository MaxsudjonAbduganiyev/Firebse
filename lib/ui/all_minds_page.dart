import 'package:flutter/material.dart';
import 'package:malumotlar_ombori/data/model/mind_model.dart';
import 'package:malumotlar_ombori/ui/widgets/mind_item.dart';
import 'package:malumotlar_ombori/view_model/minds_view_model.dart';
import 'package:provider/provider.dart';

class AllMindsPage extends StatelessWidget {
  const AllMindsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All minds page"),
      ),
      body: Consumer<MindsViewModel>(
        builder: (context, value, child) {
          if (value.minds == null) {
            context.read<MindsViewModel>().readMinds();
          } else if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: value.minds!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var mind = value.minds![index];
                return MindItem(mind: mind);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
