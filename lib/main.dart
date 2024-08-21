import 'package:flutter/material.dart';
import 'package:malumotlar_ombori/data/repository/mind_repository.dart';
import 'package:malumotlar_ombori/service/local_db_service.dart';
import 'package:malumotlar_ombori/ui/write_to_db_page.dart';
import 'package:malumotlar_ombori/view_model/minds_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MindsViewModel(mindRepository: MindRepository(db: LocalDatabase())),)
      ],
      child: const MyApp()));
}

 class MyApp extends StatefulWidget {
   const MyApp({super.key});
 
   @override
   State<MyApp> createState() => _MyAppState();
 }
 
 class _MyAppState extends State<MyApp> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: WriteToDbPage(),
     );
   }
 }
 