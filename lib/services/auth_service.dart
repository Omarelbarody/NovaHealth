import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<Map<String, String>> getAuthHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    
    return {
      "Content-Type": "application/json",
      if (accessToken != null) "Authorization": "Bearer $accessToken",
    };
  }
  
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }
  
  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refresh_token');
  }
  
  static Future<void> saveTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
  }
  
  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }
  
  static Future<bool> isLoggedIn() async {
    final accessToken = await getAccessToken();
    return accessToken != null;
  }
  
  // Store user data
  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    
    if (userData.containsKey('id')) {
      await prefs.setInt('user_id', userData['id']);
    }
    if (userData.containsKey('username')) {
      await prefs.setString('username', userData['username']);
    }
    if (userData.containsKey('phone_number')) {
      await prefs.setString('phone_number', userData['phone_number']);
    }
    if (userData.containsKey('email')) {
      await prefs.setString('email', userData['email']);
    }
    if (userData.containsKey('role')) {
      await prefs.setString('role', userData['role']);
    }
  }
  
  // Get user data
  static Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    
    return {
      'id': prefs.getInt('user_id'),
      'username': prefs.getString('username'),
      'phone_number': prefs.getString('phone_number'),
      'email': prefs.getString('email'),
      'role': prefs.getString('role'),
    };
  }
  
  // Clear user data
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    await prefs.remove('username');
    await prefs.remove('phone_number');
    await prefs.remove('email');
    await prefs.remove('role');
  }
  
  // Logout - clear all data
  static Future<void> logout() async {
    await clearTokens();
    await clearUserData();
  }
} 