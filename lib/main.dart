import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/bloc/colors/colors_bloc.dart';
import 'package:whatsapp/bloc/theme/theme_bloc.dart';
import 'package:whatsapp/bloc/user/user_bloc.dart';
import 'package:whatsapp/call_screen.dart';
import 'package:whatsapp/chat_screen.dart';
import 'package:whatsapp/model/services.dart';
import 'package:whatsapp/status_screen.dart';
import 'package:whatsapp/theme/theme_constant.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
    ),
    BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepo: UserServices()),
    ),
    BlocProvider<ColorsBloc>(
      create: (context) => ColorsBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeState.themeData,
        home: const MyHomePage(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darktheme = true;

  late ThemeData selectedTheme;
  setTheme(ThemeData selectedTheme) {
    context.read<ThemeBloc>().add(ThemeEvent(appTheme: selectedTheme));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
      return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('WhatsApp'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: darkTheme,
                        child: const Text('Dark Theme'),
                        onTap: () => {
                              selectedTheme = darkTheme,
                              setTheme(selectedTheme),
                            }),
                    PopupMenuItem(
                      value: lightTheme,
                      child: const Text('Light Theme'),
                      onTap: () => {
                        selectedTheme = lightTheme,
                        setTheme(selectedTheme),
                      },
                    ),
                  ],
                ),
              ],
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.camera_alt_rounded,
                    ),
                  ),
                  Tab(
                    text: 'CHATS',
                  ),
                  Tab(
                    text: 'STATUS',
                  ),
                  Tab(
                    text: 'CALLS',
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Center(
                  child: Text('Camera'),
                ),
                ChatScreen(),
                StatusScreen(),
                CallScreen(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
