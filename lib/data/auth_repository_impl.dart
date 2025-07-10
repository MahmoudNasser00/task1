import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/entities/user_entity.dart';
import '../domain/repositories/auth_repository.dart';
import '../core/supabase_config.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserEntity?> signUp(String email, String password, String name) async {
    final res = await SupabaseConfig.client.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': name},
    );

    if (res.user != null) {
      return UserEntity(email: res.user!.email ?? '', name: name);
    }
    return null;
  }

  @override
  Future<UserEntity?> login(String email, String password) async {
    final res = await SupabaseConfig.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (res.user != null) {
      return UserEntity(email: res.user!.email ?? '');
    }
    return null;
  }
}
