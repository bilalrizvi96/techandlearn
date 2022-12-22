import 'package:firebase_database/firebase_database.dart';

class Database {
  final databaseRef = FirebaseDatabase.instance.reference();
  addCourse({var c_name, var t_std, var cost, var time}) {
    var data = {
      'c_name': c_name,
      'totalstd': t_std,
      'cost': cost,
      'time': time
    };
    databaseRef.child('CertificationCourses').push().set(data);
  }

  addStudent({var s_name, var f_name, var password, var contact}) {
    var data = {
      's_name': s_name,
      'f_name': f_name,
      'password': password,
      'contact': contact
    };
    databaseRef.child('Student').push().set(data);
  }
}
