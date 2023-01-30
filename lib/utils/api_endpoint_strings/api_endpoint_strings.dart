class ApiEndPoint {
 static String baseUrl = 'http://collegeprojectz.com/apniseva/API';
 static String loginOtp = '$baseUrl/LoginOTP';
 static String verifyOtp = '$baseUrl/VerifyOTP';
 static String getLoc = '$baseUrl/select_city?user_id';
 static String getDash = '$baseUrl/user_home';
 static String subCat = '$baseUrl/SubCategory';
 static String service = '$baseUrl/user_service_list';
 static String addToCart = '$baseUrl/addto_to_cart';

 static String getOrder = '$baseUrl/customer_allorder';
 static String getOrderDetails = "$baseUrl/UserGetSingleOrder";
 static String imageAPI = 'http://collegeprojectz.com/apniseva/uploads/';
}