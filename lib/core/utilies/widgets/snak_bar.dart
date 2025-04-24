import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';


MaterialBanner mySnackBar({required context, required String text,required ContentType contentType}){
  return MaterialBanner(
    elevation: 0,
    backgroundColor: Colors.transparent,
    forceActionsBelow: true,
    content: AwesomeSnackbarContent(
      title: text,
      message:"",
      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: contentType,
      // to configure for material banner
      inMaterialBanner: true,
    ),
    actions: const [SizedBox.shrink()],
  );
}