import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/helper/cacheHelper/cache_helper.dart';
import '../../../../../core/helper/firebase_helper/firebase_key.dart';
import '../../domain/entity/sing_up_entity.dart';

class CreateAccountRemoteData {
  Future<UserCredential> createAccount({required SingUpEntity userEntity})async{
    try {
     final result= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEntity.email, password: userEntity.password);
     saveUserData(userEntity: userEntity, Uid: result.user!.uid);
     CacheHelper.setData(key:uid, value: result.user!.uid);
     return result;
    }on FirebaseAuthException catch (e){
      if (e.code == 'weak-password') {
        throw WrongPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailUsedBeforeException();
      } else {
        throw ServerException();
      }
    }
  }

  void saveUserData({required SingUpEntity userEntity ,required String Uid})async {
    try{
      await FirebaseFirestore.instance.collection(fireBaseCollectionKey).doc(Uid).set(
          {
            name:userEntity.fullName,
            email:userEntity.email,
            phone:userEntity.phone,
            uid:Uid,
          });
    }catch (e){print("Failed to add user: $e");}
  }
}