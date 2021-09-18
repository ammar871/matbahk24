import 'package:image_picker/image_picker.dart';

class Cemmon{
  static String UserId="";
  static String UserToken="";
  static String Userphone="";
  static String UserRole="";
  static String MarketId="";

  static pickImage(XFile? image)async{
    ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
  }






  // details shared User







}