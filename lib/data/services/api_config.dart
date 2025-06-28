class ApiBase {
  static const apiBaseUrs = "http://192.168.1.100:3000";
}

class EndPoint {
  static final loginApi = "${ApiBase.apiBaseUrs}/api/login";
  static final signupApi = "${ApiBase.apiBaseUrs}/api/signup";

  static final String getAllAdvisors = '${ApiBase.apiBaseUrs}/api/advisors';
}
