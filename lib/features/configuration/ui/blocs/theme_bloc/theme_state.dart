part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  final AppTheme appTheme;
  final bool isDarkMode;

  const ThemeState({
    required this.appTheme,
    required this.isDarkMode,
  });
}

class DarkThemeState extends ThemeState {
  const DarkThemeState()
      : super(
          appTheme: const DarkTheme(),
          isDarkMode: true,
        );

  @override
  List<Object?> get props => [appTheme, isDarkMode];
}

class LightThemeState extends ThemeState {
  const LightThemeState()
      : super(
          appTheme: const LightTheme(),
          isDarkMode: false,
        );

  @override
  List<Object?> get props => [appTheme, isDarkMode];
}
