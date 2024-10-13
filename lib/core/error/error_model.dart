import 'error.dart';

class ErrorModel {
  ErrorModel({
      this.error,});

  ErrorModel.fromJson(dynamic json) {
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (error != null) {
      map['error'] = error?.toJson();
    }
    return map;
  }

}