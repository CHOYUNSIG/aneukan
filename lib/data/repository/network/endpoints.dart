enum Endpoint {
  getMyInfo,
  getHomecamAccessList,
  getLog,
  getHomecamDetail,
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
      case Endpoint.getHomecamAccessList:
        return 'homecam/useraccess';
      case Endpoint.getHomecamDetail:
        return 'homecam/';
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
