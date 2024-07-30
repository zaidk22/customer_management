


import '../../entities/validation/verify_pan_request.dart';

import '../../entities/validation/verify_pan_reposne.dart';
import '../../entities/validation/verify_pin_reposne.dart';
import '../../entities/validation/verify_pin_request.dart';

abstract class  IValidationRepo {
  Future<VerifyPanResponse> verifyPan(VerifyPanRequest request);

Future<VerifyPinResponse> verifyPin(VerifyPinRequest request);
}

