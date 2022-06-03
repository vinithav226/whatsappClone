import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/bloc/user/user_bloc.dart';
import 'package:whatsapp/model/user_model.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    context.read<UserBloc>().add(UserFetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Select contact'),
            BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is UserLoadedState) {
                return Text(
                  '${state.users.length.toString()} contacts',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                );
              }
              return const Text('unable to fetch');
            })
          ]),
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadedState) {
            List<User> users = state.users;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                        size: 60,
                      ),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(users[index].id),
                    subtitle: Text(users[index].name),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }));
  }
}
