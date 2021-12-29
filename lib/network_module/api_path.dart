
enum ApiRoutes {
  postCity
}


extension ApiRoutesExtension on ApiRoutes{

  String get path {
    switch (this) {
      case ApiRoutes.postCity:
        return "City";
    }
  }

}