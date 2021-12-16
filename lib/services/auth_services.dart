import 'package:foodu/config/config.dart';
import 'package:foodu/services/user_services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _client = Get.find<SupabaseClient>();
  UserServices userServices = UserServices();
  String getCurrentId() {
    return _client.auth.currentUser!.id;
  }

  Future<bool> recoverSession() async {
    final box = await SecureStorages.getSession();
    if (box != null) {
      final response = await _client.auth.recoverSession(box);
      if (response.error == null) {
        SecureStorages.write(response.data!);
        return true;
      }
      return false;
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    final response =
        await _client.auth.signIn(email: email, password: password);
    if (response.error == null) {
      final data = await userServices.checkExist();
      if (data == false) {
        await userServices.insertUser();
      }
      SecureStorages.write(response.data!);
      return true;
    }
    Get.snackbar('Error', response.error!.message);
    return false;
  }

  Future<bool> signup(String email, String password) async {
    final response = await _client.auth.signUp(email, password);
    if (response.error == null) {
      // await SecureStorages.write(response.data!);
      return true;
    }
    return false;
  }

  Future<bool> logout() async {
    final response = await _client.auth.signOut();
    if (response.error == null) {
      SecureStorages.deleteAll();
      return true;
    }
    return false;
  }
}
