import 'package:customer_management/core/contants/api_constants.dart';
import 'package:customer_management/domain/entities/validation/verify_pan_reposne.dart';
import 'package:customer_management/domain/entities/validation/verify_pan_request.dart';
import 'package:customer_management/domain/entities/validation/verify_pin_reposne.dart';
import 'package:customer_management/domain/entities/validation/verify_pin_request.dart';
import 'package:customer_management/domain/repositories/validation_repo/validation_repo.dart';
import 'package:customer_management/network/network_api/common_api.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ValidationRepository extends IValidationRepo {
  @override
  Future<VerifyPanResponse> verifyPan(VerifyPanRequest request) async {

     try {
      final response = await CommonApi().apiService.post(
            ApiConstants.panEndpoint,
            data: request.toJson()

          
          );

      if (response.statusCode == HttpStatus.ok) {
        return VerifyPanResponse.fromJson(response.data);
      } else {
        return VerifyPanResponse.fromJson(response.data);
      }
    } catch (e) {
      rethrow;
    }
  
  }

  @override
  Future<VerifyPinResponse> verifyPin(VerifyPinRequest request) async {
   try {
      final response = await CommonApi().apiService.post(
            ApiConstants.addEndPoint,
            data: request.toJson()
          
          );

      if (response.statusCode == HttpStatus.ok) {
        return VerifyPinResponse.fromJson(response.data);
      } else {
        return VerifyPinResponse.fromJson(response.data);
      }
    } catch (e) {
      rethrow;
    }
  }
}
