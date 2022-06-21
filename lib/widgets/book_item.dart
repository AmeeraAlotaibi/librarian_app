import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:librarian_app/models/book_model.dart';

class BookItem extends StatelessWidget {
  BookItem({required this.book});
  Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
// container for card to add padding
          Container(
              color: Theme.of(context).secondaryHeaderColor,
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push('/book-details', extra: book);
                },
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).secondaryHeaderColor,
                  child: Row(children: [
                    // container that houses the placeholder image
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
                      width: 100,
                      height: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/book-cover-placeholder.png")),
                      ),
                    ),
                    // book details text in card
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // this is to align the text to the left side of the column
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              book.title,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Text(
                            book.author,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(book.genre.toString(),
                                  style:
                                      Theme.of(context).textTheme.bodySmall)),
                        ],
                      ),
                    )
                  ]),
                ),
              ))
        ]);
  }
}
