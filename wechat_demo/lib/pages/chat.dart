
class Chat {
  String? name;
  String? imageUrl;
  String? msg;

  Chat({this.name, this.imageUrl, this.msg});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'name': String name,
      'imageUrl': String imageUrl,
      'msg': String msg,
      } =>
          Chat(
            name: name,
            imageUrl: imageUrl,
            msg: msg,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}