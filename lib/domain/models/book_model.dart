class BookModel {
  final String id;
  final String title;
  final String description;
  String authorName;
  final String publishedDate;
  final String authorid;
  String coverUrl;
  final int price;

  BookModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.publishedDate,
      required this.authorid,
      this.authorName = '',
      required this.coverUrl,
      required this.price});

  factory BookModel.fromjson(Map<String, dynamic> json) {
    return BookModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        publishedDate: json['publishedDate'],
        authorid: json['authorId'],
        coverUrl: json['coverPictureURL'],
        price: json['price']);
  }
}
