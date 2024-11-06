import 'package:app_barber_shop/models/user_model.dart';
import 'package:app_barber_shop/services/firebase/store/image_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  Future<String?> create(UserModel user, UserCredential? userCredential) async {
    String? imageUrl = "";
    if (userCredential != null) {
      String uid = userCredential.user!.uid;

      if (user.photo != null) {
        imageUrl = await ImageService().uploadImage(user, uid);
      }
      DocumentReference docRef =
          await FirebaseFirestore.instance.collection('users').add({
        'name': user.name,
        'cpf': user.cpf,
        'email': user.email,
        'imagem': imageUrl,
        'created_at': Timestamp.now(),
      });

      return docRef.id;
    }
    return null;
  }

  // Future<void> delete() {}

  Future<UserCredential?> createUserCredential(UserModel user) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    return userCredential;
  }
}
