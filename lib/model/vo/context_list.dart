class ContextListVo {
  final String code;
  final String value;

  ContextListVo({required this.code, required this.value});

  ContextListVo.fromJson(Map<String, dynamic> json)
      : code = json['code'] as String,
        value = json['value'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['value'] = value;
    return data;
  }
}
