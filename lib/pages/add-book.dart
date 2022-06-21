import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddBookPage extends StatelessWidget {
  AddBookPage({Key? key}) : super(key: key);
  var _newBookTitle = TextEditingController();
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
                  controller: _newBookTitle,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontSize: 17,
                      color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
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
              ElevatedButton(
                onPressed: () {
                  // add new book function here needs provider
                  // Provider.of(context).read<BookProvider>().addBook();
                  // GoRouter.of(context).pop();
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
