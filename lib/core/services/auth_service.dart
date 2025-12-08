import 'package:lifepro_new/core/services/local_storage_service.dart';

class AuthService {
  static const String _boxName = 'auth';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _emailKey = 'user_email';
  static const String _fullNameKey = 'full_name';

  final LocalStorageService _storage;

  AuthService(this._storage);

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final value = await _storage.get(_boxName, _isLoggedInKey);
    return value as bool? ?? false;
  }

  // Login user
  Future<bool> login(String email, String password, String fullName) async {
    // For now, simple validation - in production this would call an API
    if (email.isNotEmpty && password.isNotEmpty && fullName.isNotEmpty) {
      await _storage.save(_boxName, _isLoggedInKey, true);
      await _storage.save(_boxName, _emailKey, email);
      await _storage.save(_boxName, _fullNameKey, fullName);
      return true;
    }
    return false;
  }

  // Get current user email
  Future<String?> getCurrentUserEmail() async {
    return await _storage.get(_boxName, _emailKey) as String?;
  }

  // Get current user full name
  Future<String?> getCurrentUserFullName() async {
    return await _storage.get(_boxName, _fullNameKey) as String?;
  }

  // Logout user
  Future<void> logout() async {
    await _storage.delete(_boxName, _isLoggedInKey);
    await _storage.delete(_boxName, _emailKey);
    await _storage.delete(_boxName, _fullNameKey);
  }
}
