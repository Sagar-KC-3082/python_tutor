/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/28/2024, Friday


import 'package:uuid/uuid.dart';

class SecurityUtils {
  static String encodeString(String data) {
    try {
      var uuid = const Uuid();
      return uuid.v5(Uuid.NAMESPACE_URL, data);
    } catch (e) {
      return '';
    }
  }
}