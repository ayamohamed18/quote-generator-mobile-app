class Quote{
   final String? id;
   final String ?content;
   final String ?author;

  Quote({required this.id, required this.content, required this.author});

 factory Quote.fromJson(Map<String, dynamic> json) {
final id = json['_id'];
final content = json['content'];
    final author = json['author'];
    return Quote(id: id, content: content, author: author);

 }


 Map<String, dynamic> toJson() {
  return { '_id':id,
            'content':content,
            'author':author
  };
 
 }

}