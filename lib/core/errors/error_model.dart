class ErrorModel {
  ErrorModel({
      this.error,});

  ErrorModel.fromJson(dynamic json) {
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }
  Error? error;
ErrorModel copyWith({  Error? error,
}) => ErrorModel(  error: error ?? this.error,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (error != null) {
      map['error'] = error?.toJson();
    }
    return map;
  }

}

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
  int? code;
  String? message;
  List<Errors>? errors;
Error copyWith({  int? code,
  String? message,
  List<Errors>? errors,
}) => Error(  code: code ?? this.code,
  message: message ?? this.message,
  errors: errors ?? this.errors,
);
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
Errors copyWith({  String? message,
  String? domain,
  String? reason,
}) => Errors(  message: message ?? this.message,
  domain: domain ?? this.domain,
  reason: reason ?? this.reason,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['domain'] = domain;
    map['reason'] = reason;
    return map;
  }

}