import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/bloc/user/user_bloc.dart';
import 'package:whatsapp/model/user_model.dart';
import 'package:whatsapp/statusupload_screen.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
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
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(4),
                    leading: const CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                        size: 60,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(users[index].name),
                    subtitle: const Text('45 minutes ago'),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.green),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'manual status',
            backgroundColor: const Color.fromARGB(255, 228, 226, 226),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StatusUpload(),
                ),
              );
            },
            child: const Icon(
              Icons.edit,
              color: Color.fromARGB(255, 92, 92, 92),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'camera status',
            onPressed: () {},
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
