import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:librarian_app/models/book_model.dart';
import 'package:librarian_app/pages/add_book.dart';
import 'package:librarian_app/pages/book_details.dart';
import 'package:librarian_app/pages/books_list.dart';
import 'package:librarian_app/pages/home_page.dart';
import 'package:librarian_app/providers/book_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => BookProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      // theme data
      theme: ThemeData(
        primaryColor:
            const Color(0xFF483434), // appbar bg, buttons bg, book title text,
        scaffoldBackgroundColor: const Color(0xFFFFF3E4), // Page bg only!!
        secondaryHeaderColor: Color.fromARGB(255, 248, 227, 210), // card bg,
        textTheme: const TextTheme(
            // title Large for book titles in books details page and member names in members details page
            titleLarge: TextStyle(
              fontSize: 25.5,
              fontWeight: FontWeight.w500,
              color: Color(0xFF483434),
              letterSpacing: 0,
            ),
            // title medium for appBar Text only
            titleMedium: TextStyle(
              fontSize: 25.5,
              color: Color(0xFFFFF3E4),
              letterSpacing: 2,
            ),
            // title small for other book authors and members memberships
            titleSmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Color(0xFF6B4F4F),
            ),
            // body medium for text inside buttons
            bodyMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFF3E4),
              letterSpacing: 1,
            ),
            // body text
            bodySmall: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color(0xFF6B4F4F)),
            // book title in book list page only
            bodyLarge: TextStyle(
                fontSize: 17.5,
                color: Color(0xFF483434),
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/books-list',
        builder: (context, state) => BooksListPage(),
      ),
      GoRoute(
        path: '/book-details',
        builder: (context, state) => BookDetailsPage(book: state.extra as Book),
      ),
      GoRoute(
        path: '/add-book',
        builder: (context, state) => AddBookPage(),
      ),
    ],
  );
}
