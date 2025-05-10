class MottoListVo {
  int id;
  String title;
  String summary;
  List<String> labels;

  MottoListVo({
    required this.id,
    required this.title,
    required this.summary,
    required this.labels,
  });

  factory MottoListVo.fromJson(Map<String, dynamic> json) => MottoListVo(
    id: json["id"],
    title: json["title"],
    summary: json["summary"],
    labels: List<String>.from(json["labels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "summary": summary,
    "labels": List<dynamic>.from(labels.map((x) => x)),
  };
}
