
class VerifyPanRequest {
  String? panNumber;

  VerifyPanRequest({this.panNumber});

  VerifyPanRequest.fromJson(Map<String, dynamic> json) {
    panNumber = json["panNumber"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["panNumber"] = panNumber;
    return _data;
  }
}