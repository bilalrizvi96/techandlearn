import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Database {
  final databaseRef = FirebaseDatabase.instance.reference();
  final user = FirebaseAuth.instance.currentUser;
  addCourse({var c_name, var t_std, var cost, var time}) {
    var data = {
      'c_name': c_name,
      'totalstd': t_std,
      'cost': cost,
      'time': time
    };
    databaseRef.child('CertificationCourses').push().set(data);
  }

  addStudent(
      {var s_name,
      var f_name,
      var password,
      var contact,
      var semester,
      var email}) {
    var data = {
      's_name': s_name,
      'f_name': f_name,
      'password': password,
      'contact': contact,
      'semester': semester,
      'email': email,
      'uid': user!.uid,
    };
    databaseRef.child('Student').push().set(data);
  }

  regCourseUser({var c_name, var uuid}) {
    var data = {'c_name': c_name, 'uuid': uuid};
    databaseRef.child('RegCourse').push().set(data);
  }

  regCertificationCourseUser({var c_name, var uuid}) {
    var data = {'c_name': c_name, 'uuid': uuid};
    databaseRef.child('RegCertificationCourse').push().set(data);
  }
}
