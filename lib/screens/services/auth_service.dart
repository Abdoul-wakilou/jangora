// auth_service.dart - Version mock pour le développement frontend

class AuthService {
  // Mock user data
  static const String mockEmail = "jangora@gmail.com";
  static const String mockPassword = "jangora123";
  bool _isLoggedIn = false;

  // Mock login
  Future<bool> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simule un appel réseau

    if (email == mockEmail && password == mockPassword) {
      _isLoggedIn = true;
      return true;
    }
    return false;
  }

  // Mock registration
  Future<bool> register(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simule un appel réseau
    _isLoggedIn = true; // Auto-login après inscription
    return true; // Toujours réussi en mock
  }

  // Mock logout
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _isLoggedIn = false;
  }

  // Vérifie l'état de connexion
  bool get isLoggedIn => _isLoggedIn;
}