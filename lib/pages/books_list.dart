import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:librarian_app/models/book_model.dart';
import 'package:librarian_app/providers/book_provider.dart';
import 'package:librarian_app/widgets/add_book_dialog.dart';
import 'package:librarian_app/widgets/book_item.dart';
import 'package:provider/provider.dart';

class BooksListPage extends StatelessWidget {
  BooksListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Books List",
              style: Theme.of(context).textTheme.titleMedium),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
// for adding an icon button
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
              child: GestureDetector(
                onTap: () {
// write on tap code for adding new book here
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddBook();
                      });
                },
                child: Icon(
                  Icons.add,
                  size: 35,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: context.watch<BookProvider>().books.length,
          itemBuilder: (context, index) =>
              BookItem(book: context.watch<BookProvider>().books[index]),
        ));
  }
}
