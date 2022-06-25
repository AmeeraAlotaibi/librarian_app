import 'package:librarian_app/models/book_model.dart';

class Member {
  int? id;
  String firstName;
  String lastName;
  String membership;
  List<int>? currentlyBorrowedBooks;

  Member({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.membership,
    this.currentlyBorrowedBooks,
  });
}
