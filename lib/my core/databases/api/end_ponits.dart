class EndPoint {
  // static String baseUrl = "https://student.valuxapps.com/api/";
  static String baseUrl = "http://10.0.2.2/e-ecommerse";
  static String baseUrl2 = "http://10.0.2.2/e-ecommerse/test.php";

//ده خاص باالاميلوتر لانه غير مرفوع علي استضافه
  static String test = "$baseUrl/test.php";

  static String Sugin_up = "$baseUrl/auth/sign_up.php";
  static String linklogin = "$baseUrl/auth/login.php";

  static String signIn = "login";

  static String signUp = "register";

  static String profile = "profile";
  static String logout = "logout";
  static String banners = "banners";
  static String categories = "categories";
  static String home = "home";
  static String carts = "carts";
  static String favorite = "favorites";
  static String search = "products/search";
}

class ApiKey {
  static String status = "status";

  static String errorMessage = "ErrorMessage";

  static String email = "email";

  static String password = "password";

  static String token = "token";

  static String message = "message";

  static String id = "id";

  static String name = "name";

  static String phone = "phone";

  static String confirmPassword = "confirmPassword";

  static String location = "location";

  static String profilePic = "profilePic";
}
