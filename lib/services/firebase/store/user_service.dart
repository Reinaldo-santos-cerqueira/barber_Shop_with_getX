import 'package:app_barber_shop/models/user_model.dart';
import 'package:app_barber_shop/services/firebase/store/image_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  Future<void> create(UserModel user) async {
    UserCredential userCredential =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    String imageUrl = "";
    String uid = userCredential.user!.uid;

    // if (user.photo.isNotEmpty) {
    //   imageUrl = await ImageService().download(user, uid);
    // }
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': user.name,
      'cpf': user.cpf,
      'email': user.email,
      'imagem': user.photo,
      'created_at': Timestamp.now(),
    });
  }
}
