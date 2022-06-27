import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:librarian_app/models/members_model.dart';
import '/providers/member_provider.dart';

class MemberItem extends StatelessWidget {
  MemberItem({required this.member});
  // function to capitalize the first letter of a given string
  String capitalize(String string) {
    return string[0].toUpperCase() + string.substring(1).toLowerCase();
  }

  Member member;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
// container for card to add padding
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).secondaryHeaderColor,
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push('/member-details', extra: member);
                },
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).secondaryHeaderColor,
                  child: Row(children: [
                    // container that houses the placeholder image
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/member.jpg")),
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
                              "${member.firstName} ${member.lastName}",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Text(
                            member.membership,
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 0),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                  member.currentlyBorrowedBooks.toString(),
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
