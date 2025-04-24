import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planner/core/helper/cacheHelper/cache_helper.dart';
import 'package:meal_planner/core/helper/firebase_helper/firebase_key.dart';

import '../../../../../core/errors/exception.dart';
import '../../domain/entity/login_entity.dart';

class LoginRemoteData {

  Future<UserCredential> login({required LoginEntity loginEntity})async{
    try{
     final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginEntity.email, password: loginEntity.password);
     CacheHelper.setData(key:uid, value: result.user!.uid);
     return result ;
    }on FirebaseException catch(e){
      if (e.code=="invalid-credential")
      {
        print("invalid-credential");
        throw WrongPasswordException();
      }
      else{
        throw ServerException();
      }
    }
  }
}