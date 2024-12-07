enum Endpoint {
  getUserInfo,
  getHomecamList,
  getHomecamDetail,
  getLog,
  getLogDetail,
  getLogin,

  postRegister,
  postHomecamAccessPermissionRequest,
}

extension EndpointExtension on Endpoint {
  String get path {
    switch (this) {
      case Endpoint.getUserInfo:
        return 'user/info';
      case Endpoint.getHomecamList:
        return 'homecam/list';
      case Endpoint.getHomecamDetail:
        return 'homecam/detail';
      case Endpoint.getLog:
        return 'log';
      case Endpoint.getLogDetail:
        return 'log/detail';
      case Endpoint.getLogin:
        return 'user/login';

      case Endpoint.postRegister:
        return 'user/';
      case Endpoint.postHomecamAccessPermissionRequest:
        return 'homecam/accesshomecam';
    }
  }
}
