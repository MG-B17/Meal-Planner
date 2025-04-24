import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_planner/core/errors/failure.dart';

class GoogleSingInData{

  Future<Either<Failure,UserCredential>> signInWithGoogle() async {
    // Trigger the authentication flow
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final result= await FirebaseAuth.instance.signInWithCredential(credential);
      return right(result);
    }on FirebaseAuthException{
      return left(ServerFailure());
    }
  }
}