class CheckUpdateVo {
  String version;
  String updateUrl;

  CheckUpdateVo({
    required this.version,
    required this.updateUrl,
  });

  factory CheckUpdateVo.fromJson(Map<String, dynamic> json) => CheckUpdateVo(
    version: json["version"],
    updateUrl: json["updateUrl"],
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "updateUrl": updateUrl,
  };
}
