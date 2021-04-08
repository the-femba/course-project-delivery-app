import 'package:get/get.dart';

import 'api/api.dart';

class NotExistsDeliveryException implements ApiException {}

class ExistsDeliveryException implements ApiException {}

class ValidationException implements ApiException {}

void initApi() {
  var apiSrv = ApiService();

  apiSrv.addErrorHandler(
    'NotExistsDeliveryException',
    (errorData) => throw NotExistsDeliveryException(),
  );

  apiSrv.addErrorHandler(
    'ExistsDeliveryException',
    (errorData) => throw ExistsDeliveryException(),
  );

  apiSrv.addErrorHandler(
    'ValidationException',
    (errorData) => throw ValidationException(),
  );

  Get.put<ApiService>(apiSrv).init('https://api.delivery.flx.pub');
}
