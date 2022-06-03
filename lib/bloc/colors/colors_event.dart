part of 'colors_bloc.dart';

abstract class ColorsEvent extends Equatable {
  const ColorsEvent();

  @override
  List<Object> get props => [];
}

class ColorChangeEvent extends ColorsEvent {
  Color selectedColor;
  ColorChangeEvent({
    required this.selectedColor,
  });

  ColorChangeEvent copyWith({
    Color? selectedColor,
  }) {
    return ColorChangeEvent(
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}
