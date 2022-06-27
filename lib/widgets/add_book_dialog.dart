import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:librarian_app/models/book_model.dart';
import 'package:librarian_app/providers/book_provider.dart';
import 'package:librarian_app/widgets/toggle_switch.dart';
import 'package:provider/provider.dart';

class AddBook extends StatelessWidget {
  AddBook({Key? key}) : super(key: key);
  final _bookTitle = TextEditingController();
  final _bookAuthor = TextEditingController();
  final _bookGenres = TextEditingController();
  final _currentlyBorrowed = TextEditingController();
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        title: Text(
          "New Book Form",
          style: TextStyle(fontSize: 18),
        ),
        content: Form(
            child: Column(
          children: [
// ************************** Book TITLE ***************************
            TextFormField(
              controller: _bookTitle,
              style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0,
                  color: Theme.of(context).primaryColor),
              validator: (name) => name != null ? name : "Enter a book title",
              decoration: InputDecoration(
                labelText: 'Book Title',
                icon: Icon(
                  Icons.title_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                labelStyle: TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal),
                contentPadding: EdgeInsets.only(left: 15),
                floatingLabelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2)),
                // when field is focused
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                ),
                // validator
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB71C1C))),
              ),
            ),

            SizedBox(
              height: 10,
            ),

// ************************** Book Author ***************************
            TextFormField(
              controller: _bookAuthor,
              style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0,
                  color: Theme.of(context).primaryColor),
              validator: (name) =>
                  name != null ? name : "Enter an author's name",
              decoration: InputDecoration(
                labelText: 'Book Author',
                icon: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
                labelStyle: TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal),
                contentPadding: EdgeInsets.only(left: 15),
                floatingLabelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2)),
                // when field is focused
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                ),
                // validator
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB71C1C))),
              ),
            ),

            SizedBox(
              height: 10,
            ),

// ************************** Book Genres ***************************
            TextFormField(
              controller: _bookGenres,
              style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0,
                  color: Theme.of(context).primaryColor),
              validator: (name) => name != null ? name : "Enter a genre",
              decoration: InputDecoration(
                labelText: 'Book Genres',
                icon: Icon(
                  Icons.bookmark,
                  color: Theme.of(context).primaryColor,
                ),
                labelStyle: TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal),
                contentPadding: EdgeInsets.only(left: 15),
                floatingLabelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2)),
                // when field is focused
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                ),
                // validator
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB71C1C))),
              ),
            ),

            SizedBox(
              height: 10,
            ),

// ************************** Currently borrowed by ***************************
            TextFormField(
              controller: _currentlyBorrowed,
              style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0,
                  color: Theme.of(context).primaryColor),
              validator: (name) => name != null ? name : "Enter a name",
              decoration: InputDecoration(
                labelText: 'Borrowed By',
                icon: Icon(
                  Icons.border_color_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                labelStyle: TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal),
                contentPadding: EdgeInsets.only(left: 15),
                floatingLabelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2)),
                // when field is focused
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                ),
                // validator
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB71C1C))),
              ),
            ),

            SizedBox(
              height: 20,
            ),
// ****************** toggle button **************************
            Column(
              children: [
                Text(
                  "Book Available?",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                ToggleSwitch(),
              ],
            ),

            SizedBox(
              height: 5,
            ),

            Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () {
                      context.read<BookProvider>().addBook(Book(
                          title: _bookTitle.text, author: _bookAuthor.text));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    child: Text("Submit"))),
          ],
        )));
  }
}
