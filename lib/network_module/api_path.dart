
enum ApiRoutes {
  postCity,
  accessTokenRefresh,
  token,
  faq,
  faqEdit
}


extension ApiRoutesExtension on ApiRoutes{

  String path([List<String> params = const []]) {
    switch (this) {
      case ApiRoutes.accessTokenRefresh:
        return "refresh-token";
      case ApiRoutes.token:
        return "Token";
      case ApiRoutes.faq:
        return  "Faq";
      case ApiRoutes.faqEdit:
        return "Faq/${params[0]}";
      case ApiRoutes.postCity:
        return "City";
    }
  }

}