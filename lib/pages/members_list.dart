import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:librarian_app/providers/member_provider.dart';
import 'package:librarian_app/widgets/member_tile.dart';
import 'package:provider/provider.dart';

class MembersListPage extends StatelessWidget {
  const MembersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Members List",
            style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
            child: GestureDetector(
              onTap: () {
                // write on tap code for adding new member here
                // GoRouter.of(context).push("/add-new-member");
              },
              child: Icon(
                Icons.person_add,
                size: 35,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          )
        ],
      ),
      // start of the body
      body: ListView.builder(
        itemCount: context.watch<MemberProvider>().members.length,
        itemBuilder: ((context, index) => MemberItem(member: context.watch<MemberProvider>().members[index])))
    );
  }
}