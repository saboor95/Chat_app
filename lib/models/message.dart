class Message{
  static String COLLECTION_NAME='Message';
  String id;
  String content;
  int dateTime;
  String roomId;
  String senderId;
  String senderName;

  Message(
  { this.id='',
    required this.content,
    required this.dateTime,
    required this.roomId,
    required this.senderId,
    required this.senderName}
      );

  Message.fromJson(Map<String,dynamic>json):this(
    id: json['id'],
    dateTime: json['dateTime'],
    content: json['content'],
    roomId: json['roomId'],
    senderId: json['senderId'],
    senderName: json['senderName'],
  );

  Map<String,dynamic>toJson(){
    return{
      'id': id,
      'dateTime': dateTime,
      'content':content,
      'roomId': roomId,
      'senderId': senderId,
      'senderName': senderName,
    };
  }
}