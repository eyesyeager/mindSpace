class MottoDetailVo {
  String title;
  String content;

  MottoDetailVo({
    required this.title,
    required this.content,
  });

  factory MottoDetailVo.fromJson(Map<String, dynamic> json) => MottoDetailVo(
    title: json["title"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
  };
}
