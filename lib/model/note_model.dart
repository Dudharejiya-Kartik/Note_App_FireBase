class notemodel {
  String? title;
  String? content;

  notemodel({
    required this.title,
    required this.content,
  });

  factory notemodel.fromMap(Map data) => notemodel(
        title: data['title'],
        content: data['content'],
      );

  Map<String, dynamic> get toMap => {
        'title': title,
        'content': content,
      };
}
