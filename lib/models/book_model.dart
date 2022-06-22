class Book {
  int? id;
  String title;
  String author;
  List<String> genre;
  bool available;
  List<int> borrowedBy;
// constructor
  Book({
    this.id,
    required this.title,
    required this.author,
    this.genre = const ['default'],
    this.available = true,
    this.borrowedBy = const [0],
  });
}
