import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/bloc/user/user_bloc.dart';
import 'package:whatsapp/model/user_model.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
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
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserListError) {
            return const Text('Unable to fetch Data');
          }
          if (state is UserLoadedState) {
            List<User> users = state.users;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    minVerticalPadding: 5,
                    horizontalTitleGap: 30,
                    leading: const CircleAvatar(
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                        size: 60,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(users[index].name),
                    subtitle: const Text('(2)Yesterday , 4:50 pm'),
                    trailing: IconButton(
                      icon: const Icon(Icons.call),
                      onPressed: () {},
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.call),
      ),
    );
  }
}
