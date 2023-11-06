import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LogInWork.dart';

class FirebaseWork with ChangeNotifier{

  String initUserEmail;
  String initUserName;
  String initUserGoalCount ;
  String initUserJournalCount;


  String get getInitUserName => initUserName;
  String get getInitUserEmail => initUserEmail;
  String get getInitUserGoalCount => initUserGoalCount;
  String get getInitUserJournalCount => initUserJournalCount;


  Future createNewUser(BuildContext context, dynamic data) async{
    return FirebaseFirestore.instance.collection("users").doc(Provider.of<LogInWork>(context, listen:false).getUserId).set(data);
  }

  Future initialiseData(BuildContext context) async{
    return FirebaseFirestore.instance.collection('users').doc(
        Provider.of<LogInWork>(context,listen: false).getUserId).get().then((doc) {
      print("Getting User Data");
      initUserName  = doc.data()['userName'];
      initUserEmail = doc.data()['userEmail'];
      initUserGoalCount = doc.data()['goalCount'];
      initUserJournalCount = doc.data()['journalCount'];
      print(initUserName);
      print(initUserEmail);
      print(initUserGoalCount);
      print(initUserJournalCount);

      notifyListeners();
    });
  }

  Future Save(BuildContext context, dynamic data) async{
    return FirebaseFirestore.instance.collection('journals').doc(Provider.of<LogInWork>(context,listen: false).getUserId).collection('myJournals').doc().set(data);
  }


  Future goalComplete(BuildContext context, String goal) async{

    notifyListeners();
    return FirebaseFirestore.instance.collection('goals').doc(Provider.of<LogInWork>(context,listen: false).getUserId).collection('goalsDone').doc().set(
     { 'completedGoals' : goal,

    }
    );
  }

  Future goalIncrement(BuildContext context){
initUserGoalCount == null? initUserGoalCount= '1': initUserGoalCount = '${(int.parse(initUserGoalCount) + 1).toString()}';
notifyListeners();
print('Goal Count $initUserGoalCount');
return FirebaseFirestore.instance.collection('users').doc(Provider.of<LogInWork>(context,listen: false).getUserId).update(
  {'goalCount': getInitUserGoalCount,}
);
  }


  Future goalDeleter(BuildContext context, String id){
    return FirebaseFirestore.instance.collection('goals').doc(Provider.of<LogInWork>(context, listen: false).getUserId).collection('myGoals').doc(id).delete();
  }

  Future goalAdder(BuildContext context, dynamic data){
    return FirebaseFirestore.instance.collection('goals').doc(Provider.of<LogInWork>(context,listen: false).getUserId).collection('myGoals').doc().set(data
    );
  }

  Future journalIncrement(BuildContext context){
    initUserJournalCount == null? initUserJournalCount = '1' : initUserJournalCount = '${int.parse(initUserJournalCount)+1}';
    notifyListeners();
    print('Journal Count $initUserJournalCount');
    return FirebaseFirestore.instance.collection('users').doc(Provider.of<LogInWork>(context,listen: false).getUserId).update(
        {'journalCount': getInitUserJournalCount,}
    );
  }

}