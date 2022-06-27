import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:librarian_app/models/members_model.dart';
import 'package:librarian_app/providers/member_provider.dart';
import 'package:provider/provider.dart';

class AddMemberDialog extends StatefulWidget {
  AddMemberDialog({Key? key}) : super(key: key);

  @override
  State<AddMemberDialog> createState() => _AddMemberDialogState();
}

class _AddMemberDialogState extends State<AddMemberDialog> {
  var _firstName = TextEditingController();
  var _lastName = TextEditingController();
  var _booksBorrowed = TextEditingController();

  String _membershipTier = 'Ex. Gold';
  List<String> tiers = ['🥈 Silver', '🥇 Gold', '🥉 Platinum'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        "New Memeber Form",
        style: TextStyle(fontSize: 18),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
// *************** First Name **************************
          TextFormField(
            controller: _firstName,
            style: TextStyle(
                fontSize: 15,
                letterSpacing: 0,
                color: Theme.of(context).primaryColor),
            validator: (name) => name != null ? name : "Enter your name",
            decoration: InputDecoration(
              labelText: 'First name',
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
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColor, width: 2),
              ),
              // validator
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB71C1C))),
            ),
          ),

          SizedBox(
            height: 10,
          ),
// ************** Last Name *****************************
          TextFormField(
            controller: _lastName,
            style: TextStyle(
                fontSize: 15,
                letterSpacing: 0,
                color: Theme.of(context).primaryColor),
            validator: (name) => name != null ? name : "Enter your last name",
            decoration: InputDecoration(
              labelText: 'Last name',
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
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColor, width: 2),
              ),
              // validator
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB71C1C))),
            ),
          ),

// ************ dropdown menu *******************
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.grade_rounded,
                color: Theme.of(context).primaryColor,
              ),
              Container(
                width: 192,
                height: 50,
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    hint: Text(
                      "Membership tier",
                    ),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0),
                    items: tiers.map((tier) {
                      return DropdownMenuItem(value: tier, child: Text(tier));
                    }).toList(),
                    onChanged: (val) =>
                        setState(() => _membershipTier = val.toString())),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _booksBorrowed,
            style: TextStyle(
                fontSize: 15,
                letterSpacing: 0,
                color: Theme.of(context).primaryColor),
            validator: (name) => name != null ? name : "Enter books borrowed",
            decoration: InputDecoration(
              labelText: 'Books Borrowed by',
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
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColor, width: 2),
              ),
              // validator
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB71C1C))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<MemberProvider>().addMember(Member(
                          firstName: _firstName.text,
                          lastName: _lastName.text,
                          membership: _membershipTier,
                        ));
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: Text("Submit"))),
        ],
      ),
    );
  }
}
