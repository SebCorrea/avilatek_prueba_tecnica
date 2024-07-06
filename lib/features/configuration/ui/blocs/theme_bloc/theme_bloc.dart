import 'package:avilatek_prueba_tecnica/config/theme/theme_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const DarkThemeState()) {
    on<OnDarkModeSelected>(_onDarkModeSelected);
    on<OnLightModeSelected>(_onLightModeSelected);
  }

  void _onDarkModeSelected(OnDarkModeSelected event, Emitter<ThemeState> emit) {
    emit(const DarkThemeState());
  }

  void _onLightModeSelected(OnLightModeSelected event, Emitter<ThemeState> emit) {
    emit(const LightThemeState());
  }
}
