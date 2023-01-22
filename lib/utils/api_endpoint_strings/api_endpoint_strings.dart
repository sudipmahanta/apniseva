class ApiEndPoint {
 static String baseUrl = 'http://collegeprojectz.com/apniseva/API';
 static String registerApi = '$baseUrl/LoginOTP';
 static String getUser = '$baseUrl/VerifyOTP?contact';
 static String getLoc = '$baseUrl/select_city?user_id';
 static String getDash = '$baseUrl/user_home';
 static String getOrder = '$baseUrl/customer_allorder?user_id';
 static String getOrderDetails = "$baseUrl/UserGetSingleOrder?";
 static String imageAPI = 'http://collegeprojectz.com/apniseva/uploads/';
}