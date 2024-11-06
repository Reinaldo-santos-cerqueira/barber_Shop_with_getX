import 'package:app_barber_shop/models/user_model.dart';
// import 'package:app_barber_shop/services/firebase/store/image_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  Future<String?> create(UserModel user, UserCredential? userCredential) async {
    String? imageUrl =
        "https://firebasestorage.googleapis.com/v0/b/app-barber-shop-be663.firebasestorage.app/o/noPhoto.png?alt=media&token=cf1edb89-7ce0-4170-bb30-c841659d4897";
    if (userCredential != null) {
      // String uid = userCredential.user!.uid;

      // if (user.photo != null) {
      //   imageUrl = await ImageService().uploadImage(user, uid);
      // }
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

  Future<void> deleteUser(String email, String password, String? id) async {
    User? user = FirebaseAuth.instance.currentUser;
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    try {
      await user?.reauthenticateWithCredential(credential);
      if (id != null) {
        await FirebaseFirestore.instance.collection('users').doc(id).delete();
      }
      await user?.delete();
    } on FirebaseAuthException catch (e) {
      print("Erro ao excluir usuário: $e");
    }
  }

  Future<UserCredential?> createUserCredential(UserModel user) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    return userCredential;
  }
}
