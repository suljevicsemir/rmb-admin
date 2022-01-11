
enum ApiRoutes {
  postCity,
  token,
  faq
}


extension ApiRoutesExtension on ApiRoutes{

  String get path {
    switch (this) {
      case ApiRoutes.token:
        return "Token";
      case ApiRoutes.faq:
        return  "Faq";
      case ApiRoutes.postCity:
        return "City";
    }
  }

}