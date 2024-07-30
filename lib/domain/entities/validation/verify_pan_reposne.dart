
class VerifyPanResponse {
  String? status;
  int? statusCode;
  bool? isValid;
  String? fullName;

  VerifyPanResponse({this.status, this.statusCode, this.isValid, this.fullName});

  VerifyPanResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    statusCode = json["statusCode"];
    isValid = json["isValid"];
    fullName = json["fullName"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["statusCode"] = statusCode;
    _data["isValid"] = isValid;
    _data["fullName"] = fullName;
    return _data;
  }
}