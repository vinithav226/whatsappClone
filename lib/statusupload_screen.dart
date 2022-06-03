import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/bloc/colors/colors_bloc.dart';

class StatusUpload extends StatefulWidget {
  const StatusUpload({Key? key}) : super(key: key);

  @override
  State<StatusUpload> createState() => _StatusUploadState();
}

class _StatusUploadState extends State<StatusUpload> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ColorsBloc, ColorsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.selectedColor,
            body: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 8),
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: const Scrollbar(
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                      hintText: 'type status',
                      hintStyle: TextStyle(color: Colors.white24, fontSize: 54),
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    context
                        .read<ColorsBloc>()
                        .add(ColorChangeEvent(selectedColor: Colors.white));
                  },
                  icon: const Icon(Icons.circle),
                  color: Colors.white,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<ColorsBloc>()
                        .add(ColorChangeEvent(selectedColor: Colors.black));
                  },
                  icon: const Icon(Icons.circle),
                  color: Colors.black,
                  iconSize: 30,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
