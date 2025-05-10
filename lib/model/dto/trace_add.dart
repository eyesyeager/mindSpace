class TraceAddDto {
  final String key;
  final String content;
  final String deviceId;
  final String os;
  final String model;

  TraceAddDto({
    required this.key,
    required this.content,
    required this.deviceId,
    required this.os,
    required this.model,
  });

  TraceAddDto.fromJson(Map<String, dynamic> json)
      : key = json['key'] as String,
        content = json['content'] as String,
        deviceId = json['deviceId'] as String,
        os = json['os'] as String,
        model = json['model'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['content'] = content;
    data['deviceId'] = deviceId;
    data['os'] = os;
    data['model'] = model;
    return data;
  }
}
