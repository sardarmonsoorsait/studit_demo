class ApiRepository {
  static bool login(String email, String password) {
    bool isMatch = false;
    if (email == 'studit@gmail.com' && password == '1234') {
      isMatch = true;
    } else {
      isMatch = false;
    }
    return isMatch;
  }
}
