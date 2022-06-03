import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/bloc/user/user_bloc.dart';
import 'package:whatsapp/contact_list.dart';
import 'package:whatsapp/individual_chat_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/model/user_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
      body: SizedBox(
        child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserListError) {
            return const Text('Unable to fetch Data');
          }
          if (state is UserLoadedState) {
            List<User> users = state.users;
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IndividualChatScreen(
                              name: users[index].name,
                              imageUrl: users[index].id),
                        ),
                      );
                    },
                    contentPadding: const EdgeInsets.all(4),
                    leading: const CircleAvatar(
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                        size: 60,
                      ),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(users[index].name),
                    subtitle: const Text('see you later'),
                    trailing:
                        Text(DateFormat.yMMMd().format(users[index].date)),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ContactListScreen(),
            ),
          );
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
