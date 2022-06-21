import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:librarian_app/providers/book_provider.dart';
import 'package:provider/provider.dart';
import '/models/book_model.dart';

class AddBookPage extends StatelessWidget {
  AddBookPage({Key? key}) : super(key: key);
  // controller variables
  final bookTitle = TextEditingController();
  final bookAuthor = TextEditingController();
  final bookGenre = TextEditingController();
  final bookAvailable = TextEditingController();
  final bookBorrowedBy = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Book",
            style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Add New Book Form",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          // Form column
          Column(
            children: [
              Container(
                width: 300,
                child: TextField(
                  controller: bookTitle,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontSize: 17,
                      color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.title_rounded),
                      iconColor: Theme.of(context).primaryColor,
                      hintText: "Book Title",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0,
                          color: Color.fromARGB(255, 152, 152, 152)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 3,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
// text field for book author
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 300,
                child: TextField(
                  controller: bookAuthor,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontSize: 17,
                      color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.title_rounded),
                      iconColor: Theme.of(context).primaryColor,
                      hintText: "Author Name",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0,
                          color: Color.fromARGB(255, 152, 152, 152)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 3,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),

// text field for book genre
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 300,
                child: TextField(
                  controller: bookGenre,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontSize: 17,
                      color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.title_rounded),
                      iconColor: Theme.of(context).primaryColor,
                      hintText: "Genres",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0,
                          color: Color.fromARGB(255, 152, 152, 152)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 3,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
// text field for book availability
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 300,
                child: TextField(
                  controller: bookAvailable,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontSize: 17,
                      color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.title_rounded),
                      iconColor: Theme.of(context).primaryColor,
                      hintText: "Book Availibility",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0,
                          color: Color.fromARGB(255, 152, 152, 152)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 3,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
// text field for book borrowed by
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 300,
                child: TextField(
                  controller: bookBorrowedBy,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontSize: 17,
                      color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.title_rounded),
                      iconColor: Theme.of(context).primaryColor,
                      hintText: "Borrowed by?",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0,
                          color: Color.fromARGB(255, 152, 152, 152)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 3,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // add new book function here needs provider
                  context.read<BookProvider>().addBook(Book(
                        title: bookTitle.text,
                        author: bookAuthor.text,
                      ));
                  GoRouter.of(context).pop();
                },
                child: Text(
                  "Add",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
