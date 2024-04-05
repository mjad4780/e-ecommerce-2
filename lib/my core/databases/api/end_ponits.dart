class EndPoint {
  static String baseUrl = "http://10.0.2.2/e-ecommerse";

//ده خاص باالاميلوتر لانه غير مرفوع علي استضافه
  static String test = "$baseUrl/test.php";

///////Auth
  static String Sugin_up = "$baseUrl/auth/sign_up.php";
  static String linklogin = "$baseUrl/auth/login.php";
  static String verfycode = "$baseUrl/auth/verfycode.php";
  static String sendverfycode = "$baseUrl/auth/sendverfycode.php";

///////forget_password////////////
  static String check_email = "$baseUrl/forget_password/check_email.php";
  static String verfycode_forget =
      "$baseUrl/forget_password/verfycode_forget_password.php";
  static String Repassword = "$baseUrl/forget_password/Repassword.php";

  /// ////////home////////////////////
  static String categories = "$baseUrl/items/categories_item.php";
  static String home = "$baseUrl/home.php";

//////////////favorite//////////////
  static String removefavorite = "$baseUrl/favorite/removefavorite.php";
  static String addfavorite = "$baseUrl/favorite/addfavorite.php";
  static String getfavorite = "$baseUrl/favorite/get_favorite.php";
///////////cart////////////////
  static String getcurrent_cart = "$baseUrl/cart/get_count_cart.php";
  static String add_cart = "$baseUrl/cart/add_cart.php";
  static String delete_cart = "$baseUrl/cart/delete_cart.php";
  static String getcart = "$baseUrl/cart/getcart.php";

/////////////////image///////////////
  static String image_cat = '$baseUrl/upload/categories';
  static String image_item = '$baseUrl/upload/item';
  //////////////////searchitem
  static String search = '$baseUrl/items/search.php';
}

class ApiKey {
  static String token = 'token';
}
