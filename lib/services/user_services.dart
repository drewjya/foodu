
import 'package:foodu/class/user.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserServices {
  final _client = Get.find<SupabaseClient>();
  static const user = 'users';
  Future<List<UserData>> getUsers() async {
    final response = await _client.from('users').select().execute();
    if (response.error == null) {
      final results = response.data as List<dynamic>;
      return results.map((e) => UserData.fromJson(json: e)).toList();
    }
    return [];
  }

  Future<UserData?> getUser(String id) async {
    final response = await _client.from(user).select().eq('id', id).execute();
    if (response.error == null) {
      if ((response.data as List).isEmpty) {
        return UserData(
            username: 'Andre',
            id: 'id',
            email: 'email',
            bio: 'bio',
            followers: 0,
            following: 0,
            imglink: '');
      }
      return UserData.fromJson(json: response.data[0]);
    }
    // print(response.error?.message);
    return null;
  }

  Future<UserData> getCurrentUser() async {
    final response = await _client
        .from('users')
        .select()
        .eq('id', _client.auth.currentUser!.id)
        .limit(1)
        .single()
        .execute();
    if (response.error == null) {
      return UserData.fromJson(json: response.data as Map<String, dynamic>);
    }
    return UserData(
      username: 'quest',
      id: 'quest',
      email: 'quest',
      bio: 'quest',
      followers: 0,
      following: 0,
      imglink: 'quest',
    );
  }

  Future<bool> checkExist() async {
    final response = await _client
        .from(user)
        .select()
        .eq('id', _client.auth.currentUser!.id)
        .execute();
    if (response.error == null) {
      if ((response.data as List).isNotEmpty) {
        return true;
      }
      return false;
    }
    return false;
  }

  Future<void> insertUser() async {
    await _client.from(user).insert(
      {
        'id': _client.auth.currentUser!.id,
        'email': _client.auth.currentUser!.email,
        'username': 'guest',
        'imglink': null,
        'bio': '',
        'following': 0,
        'followers': 0,
      },
    ).execute();
  }
}
