
enum ApiRoutes {
  accessTokenRefresh,
  token,
  faq,
  faqEdit,
  city,
  cityEdit,
  branchType,
  branchServiceType,
  atmService
}


extension ApiRoutesExtension on ApiRoutes{

  String path([List<String> params = const []]) {
    switch (this) {
      case ApiRoutes.atmService:
        return "";
      case ApiRoutes.branchType:
        return "BranchType";
      case ApiRoutes.branchServiceType:
        return "BranchServiceType";
      case ApiRoutes.city:
        return "City";
      case ApiRoutes.cityEdit:
        return "City/${params[0]}";
      case ApiRoutes.accessTokenRefresh:
        return "refresh-token";
      case ApiRoutes.token:
        return "Token";
      case ApiRoutes.faq:
        return  "Faq";
      case ApiRoutes.faqEdit:
        return "Faq/${params[0]}";
    }
  }

}