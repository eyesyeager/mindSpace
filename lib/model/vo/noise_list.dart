class NoiseListVo {
  int id;
  String name;
  String picUrl;

  NoiseListVo({
    required this.id,
    required this.name,
    required this.picUrl,
  });

  factory NoiseListVo.fromJson(Map<String, dynamic> json) => NoiseListVo(
    id: json["id"],
    name: json["name"],
    picUrl: json["picUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "picUrl": picUrl,
  };
}
