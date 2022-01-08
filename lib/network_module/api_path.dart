
enum ApiRoutes {
  postCity,
  faq
}


extension ApiRoutesExtension on ApiRoutes{

  String get path {
    switch (this) {
      case ApiRoutes.faq:
        return  "Faq";
      case ApiRoutes.postCity:
        return "City";
    }
  }

}