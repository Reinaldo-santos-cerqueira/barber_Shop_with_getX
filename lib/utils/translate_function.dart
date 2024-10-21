import 'package:get_storage/get_storage.dart';
import 'package:translator/translator.dart';

Future<String> translateFunction(String textOriginal) async{
  final box = GetStorage();
  final translator = GoogleTranslator();

  var translateText = await translator.translate(textOriginal,from: 'en',to:box.read('language'));
  return translateText.toString();
}