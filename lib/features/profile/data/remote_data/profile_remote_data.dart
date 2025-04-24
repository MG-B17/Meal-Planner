import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_planner/core/errors/exception.dart';
import 'package:meal_planner/core/helper/cacheHelper/cache_helper.dart';

import '../../../../core/helper/firebase_helper/firebase_key.dart';
import '../../domain/entity/user_entity.dart';
 class ProFileRemoteData {
  Future<bool>updateProfile({required UserEntity userEntity})async{
    try{
      final String token = await CacheHelper.getData(key: uid);
      await FirebaseFirestore.instance.collection(fireBaseCollectionKey).doc(token).update({
        name:userEntity.name,
        email:userEntity.email,
        phone:userEntity.phone,
      });
      return true;
    }on FirebaseException {
      throw ServerException();
    }
  }

  Future<UserEntity>getUserData()async{
   try {
      final String token = await CacheHelper.getData(key: uid);
      final r = await FirebaseFirestore.instance.collection(
          fireBaseCollectionKey).doc(token).get();
      final result = r.data();
      final UserEntity userData = UserEntity(
          phone: result![phone], email: result[email], name: result[name]);
      return userData;
    }on FirebaseException{
     throw ServerException();
   }
  }
}