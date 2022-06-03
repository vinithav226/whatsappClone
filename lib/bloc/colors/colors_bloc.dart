import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'colors_event.dart';
part 'colors_state.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  ColorsBloc() : super(ColorsState(selectedColor: Colors.black)) {
    on<ColorChangeEvent>((event, emit) {
      emit(state.copyWith(selectedColor: event.selectedColor));
    });
  }
}
