abstract class BaseApiServices {
  //
  // These are just abstract class a structure of get and post apis
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
