enum Endpoint {
  getMyInfo,
  getHomecamList,
  getLog,
  getLogin,
  getHomecamIdFromSerialNumber,

  postRegister,
  postHomecamAccessPermissionRequest,
}

extension EndpointExtension on Endpoint {
  String get path {
    switch (this) {
      case Endpoint.getMyInfo:
        return 'user/';
      case Endpoint.getHomecamList:
        return 'homecam/useraccess';
      case Endpoint.getLog:
        return 'video/list';
      case Endpoint.getLogin:
        return 'user/login';
      case Endpoint.getHomecamIdFromSerialNumber:
        return 'homecam/';

      case Endpoint.postRegister:
        return 'user/';
      case Endpoint.postHomecamAccessPermissionRequest:
        return 'homecam/access';
    }
  }
}
