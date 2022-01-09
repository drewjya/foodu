import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const myAuthRedirectUri = 'io.supabase.foodu://login-callback';
const supabaseUrl = 'https://vzdglcklsqnsutfywqsx.supabase.co';
const supabaseAnon =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0MTA4MzQyMCwiZXhwIjoxOTU2NjU5NDIwfQ.61dta2YqUDYIS6rG50AnNdB10Vg-TlpW2xN85izSndw';

// user flutter_secure_storage to persist user session
class SecureStorages {
  static const _storage = FlutterSecureStorage();
  static const _key = 'session';
  static Future write(Session session) async {
    await _storage.write(key: _key, value: session.persistSessionString);
  }

  static Future<String?> getSession() async {
    return await _storage.read(key: _key);
  }

  static Future readAll() async {
    return await _storage.readAll();
  }

  static Future deleteAll() async {
    await _storage.deleteAll();
  }

  static Future deleteSession() async {
    await _storage.delete(key: _key);
  }
}
