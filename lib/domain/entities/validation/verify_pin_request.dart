
class VerifyPinRequest {
  int? postcode;

  VerifyPinRequest({this.postcode});

  VerifyPinRequest.fromJson(Map<String, dynamic> json) {
    postcode = json["postcode"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["postcode"] = postcode;
    return _data;
  }
}