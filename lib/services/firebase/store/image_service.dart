import 'dart:io';

import 'package:app_barber_shop/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageService {
  Future<String> download(UserModel user, String uid) async {
    Reference storageRef = FirebaseStorage.instance.ref().child('user_images/$uid.jpg');
    UploadTask uploadTask = storageRef.putFile(File(user.photo));
    await uploadTask;

    String downloadUrl = await storageRef.getDownloadURL();
    
    return downloadUrl;
  }
}