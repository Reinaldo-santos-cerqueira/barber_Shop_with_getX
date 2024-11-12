import 'package:app_barber_shop/models/user_model.dart';
import 'package:app_barber_shop/services/firebase/messaging/firebase_messaging.dart';
import 'package:app_barber_shop/utils/format_cpf.dart';
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
        'cpf': formatCpf(user.cpf),
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

  Future<QuerySnapshot> getUsersByCpf(String cpf) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('cpf', isEqualTo: cpf)
        .get();

    return querySnapshot;
  }

  Future<QuerySnapshot> _updateTokenByEmail(String email,String? token) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot document = querySnapshot.docs.first;
      String docId = document.id;

      await FirebaseFirestore.instance.collection('users').doc(docId).update({
        'token': token,
      });
    }
    return querySnapshot;
  }

  Future<void> signIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    String? token = await MessagingFirebase().getToken();
    await _updateTokenByEmail(email,token);

  }
}
