import 'dart:io';

import 'package:app_barber_shop/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageService {
  Future<String?> uploadImage(UserModel user, String uid) async {
    final firebaseStorage = FirebaseStorage.instance;
    await requestStoragePermission();

    if (user.photo == null) {
      throw Exception("Arquivo de imagem não fornecido.");
    }

    if (user.photo == null || !File(user.photo!.path).existsSync()) {
      throw Exception("Imagem não encontrada ou caminho inválido.");
    }

    String filePath = 'uploaded_images/${uid}_${DateTime.now().millisecondsSinceEpoch}.png';

    File file = File(user.photo!.path);

    await firebaseStorage.ref(filePath).putFile(file);

    String downloadUrl = await firebaseStorage.ref(filePath).getDownloadURL();

    return downloadUrl;
  }

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }
}
