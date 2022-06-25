import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:librarian_app/models/members_model.dart';

class MemberDetailsPage extends StatelessWidget {
  MemberDetailsPage({required this.member});
  Member member;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member Details",
            style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(right: 30, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/member.jpg")),
                    ),
                  ),
                  Container(
                    child: Text(
                      "${member.firstName} ${member.lastName}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  // image placeholder
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Membership Tier: ",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Poppins',
                        fontSize: 19,
                        letterSpacing: 0),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                    decoration: BoxDecoration(
                      color: Colors.amber[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      member.membership.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Currently Borrowed: ",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Poppins',
                        fontSize: 19,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      member.currentlyBorrowedBooks.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
