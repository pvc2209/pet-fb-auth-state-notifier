import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/db_constants.dart';
import '../models/custom_error.dart';
import '../models/user_model.dart';

class ProfileRepository {
  Future<User> getProfile({required String uid}) async {
    try {
      final DocumentSnapshot userDoc = await usersRef.doc(uid).get();

      if (userDoc.exists) {
        final User currentUser = User.fromDoc(userDoc);

        return currentUser;
      }

      throw "User not found!";
      // throw ở đây thì sẽ được bắt ở ngay bên dưới chỗ catch (e)
      // => do đó hàm getProfile này chỉ throw ra CustomError mà thôi

    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: "Exception",
        message: e.toString(),
        plugin: "flutter_error/server_error",
      );
    }
  }
}
