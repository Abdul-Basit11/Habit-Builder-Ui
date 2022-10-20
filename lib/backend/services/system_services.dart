import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_bilder_app/backend/model/habit_model.dart';
import 'package:habit_bilder_app/backend/model/user_model.dart';

import '../model/reminder_model.dart';

class SystemServices {
  /// Create User
  Future<void> createUser(HabitUserModel habitUserModel) async {
    DocumentReference _docref = FirebaseFirestore.instance
        .collection('userCollection')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return await _docref.set(habitUserModel.toJson());
  }

  /// Habit Create
  Future createHabit(
      HabitModel habitModel, List<ReminderModel> reminders) async {
    DocumentReference habitref =
        FirebaseFirestore.instance.collection('habit').doc();
    return await habitref
        .set(habitModel.toJson(habitref.id), SetOptions(merge: true))
        .then((value) {
      reminders.forEach((element) async {
        return await FirebaseFirestore.instance
            .collection('habit')
            .doc(habitref.id)
            .collection('Reminders')
            .doc()
            .set(element.toJson(), SetOptions(merge: true));
      });
    });
  }

  /// Mark habit as a complete
  Future markHabitAsCompleted(String habitId) async {
    return await FirebaseFirestore.instance
        .collection('habit')
        .doc(habitId)
        .update({"isCompleted": true});
  }

  ///fetchCurrent User Habit
  Stream<List<HabitModel>> fetchCurrentHabit() {
    return FirebaseFirestore.instance
        .collection('habit')
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("isCompleted", isEqualTo: false)
        .snapshots()
        .map((allHabits) => allHabits.docs
            .map((singleHabit) => HabitModel.fromJson(singleHabit.data()))
            .toList());
  }
}
