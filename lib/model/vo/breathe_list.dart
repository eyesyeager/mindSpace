class BreatheListVo {
  int id;
  String name;
  String effect;

  BreatheListVo({
    required this.id,
    required this.name,
    required this.effect,
  });

  factory BreatheListVo.fromJson(Map<String, dynamic> json) => BreatheListVo(
    id: json["id"],
    name: json["name"],
    effect: json["effect"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "effect": effect,
  };
}
