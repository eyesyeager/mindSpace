class Result<T> {
  final int code;
  final String? msg;
  final T? data;

  Result({
    required this.code,
    this.msg,
    this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return Result<T>(
      code: json['code'] as int,
      msg: json['msg'] as String?,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return {
      'code': code,
      'msg': msg,
      'data': data != null ? toJsonT(data as T) : null,
    };
  }
}