part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class OnDarkModeSelected extends ThemeEvent {
  @override
  List<Object?> get props => [];
}

class OnLightModeSelected extends ThemeEvent {
  @override
  List<Object?> get props => [];
}