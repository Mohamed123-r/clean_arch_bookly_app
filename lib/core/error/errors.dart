class Errors {
  Errors({
      this.message, 
      this.domain, 
      this.reason,});

  Errors.fromJson(dynamic json) {
    message = json['message'];
    domain = json['domain'];
    reason = json['reason'];
  }
  String? message;
  String? domain;
  String? reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['domain'] = domain;
    map['reason'] = reason;
    return map;
  }

}