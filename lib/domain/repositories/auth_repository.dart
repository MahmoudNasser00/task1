import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signUp(String email, String password, String name);
  Future<UserEntity?> login(String email, String password);
}
