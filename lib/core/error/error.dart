import 'errors.dart';

class Error {
  Error({
      this.code, 
      this.message, 
      this.errors,});

  Error.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(Errors.fromJson(v));
      });
    }
  }
  num? code;
  String? message;
  List<Errors>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}