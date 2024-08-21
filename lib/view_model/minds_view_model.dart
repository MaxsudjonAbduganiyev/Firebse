import 'package:flutter/cupertino.dart';
import 'package:malumotlar_ombori/data/model/mind_model.dart';
import 'package:malumotlar_ombori/data/repository/mind_repository.dart';

class MindsViewModel extends ChangeNotifier {
  MindRepository? mindRepository;
  MindsViewModel({required this.mindRepository});

  List<MindModel>? minds;
  bool isLoading = false;

  void addMind(MindModel mind) async {
    mindRepository!.addMind(mind);
  }

  void readMinds() async{
    loadingChanger();
    minds = await mindRepository!.readMind();
   loadingChanger();
  }

  void updateMinds(MindModel mindModel, String mind) async{
     mindRepository!.updateMind(mindModel, mind);
     readMinds();
  }

  void deleteMinds( String mind) async{
    mindRepository!.deleteMind(mind);
    readMinds();
  }

  void loadingChanger(){
    isLoading =! isLoading;
    notifyListeners();
  }
}
