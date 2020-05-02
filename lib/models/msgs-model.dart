class MessagesList {
  final List<Message> messages;
  MessagesList({this.messages,});

  factory MessagesList.fromJson(List<dynamic> parsedJson) {
    List<Message> messages = new List<Message>();
    messages = parsedJson.map((i)=>Message.fromJson(i)).toList();
    return new MessagesList(
      messages: messages
    );
  }
}

class Message{
  final String id;
  final String name;
  final String imagePath;
  final String content;
   final String time;

  Message({
    this.id,
    this.name,
    this.imagePath,
    this.content,
    this.time
}) ;

  factory Message.fromJson(Map<String, dynamic> json){
    return new Message(
      id: json['id'].toString(),
      name: json['name'],
      imagePath: json['imagePath'],
      content: json['content'],
      time: json['time'],
    );
  }
  toString() {
      return '{$id, $name, $imagePath, $content, $time}';
  }
}