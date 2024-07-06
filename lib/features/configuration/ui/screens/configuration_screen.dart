import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/ui_strings.dart';
import 'package:avilatek_prueba_tecnica/core/ui/widgets/basic_appbar.dart';
import 'package:avilatek_prueba_tecnica/features/configuration/ui/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: UIStrings.configuration,
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: _ConfigurationView(),
      ),
    );
  }
}

class _ConfigurationView extends StatelessWidget {
  const _ConfigurationView();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [_ThemeSection()],
    );
  }
}

class _ThemeSection extends StatelessWidget {
  const _ThemeSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tema'.toUpperCase(),
          style: context.textTheme.titleSmall,
        ),
        const SizedBox(height: 4.0),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(7)
          ),
          child: const _ThemeSelector(),
        ),
      ],
    );
  }
}

class _ThemeSelector extends StatelessWidget {
  const _ThemeSelector();

  @override
  Widget build(BuildContext context) {
    final themeSate = context.watch<ThemeBloc>().state;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ThemeCard(
          icon: Icons.dark_mode,
          label: 'Oscuro',
          isSelected: themeSate.isDarkMode,
          onTap: () => context.read<ThemeBloc>().add(OnDarkModeSelected()),
        ),
        _ThemeCard(
          icon: Icons.light_mode,
          label: 'Claro',
          isSelected: !themeSate.isDarkMode,
          onTap: () => context.read<ThemeBloc>().add(OnLightModeSelected()),
        )
      ],
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeCard({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: 110,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? context.colorScheme.primary : context.colorScheme.background,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: context.colorScheme.secondary,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(label),
            const SizedBox(
              height: 8.0,
            ),
            _SelectedThemeIcon(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _SelectedThemeIcon extends StatelessWidget {
  final bool isSelected;

  const _SelectedThemeIcon({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: isSelected ? context.colorScheme.secondary : context.colorScheme.background,
        borderRadius: BorderRadius.circular(20),
      ),
      duration: const Duration(milliseconds: 200),
      child: isSelected
          ? Icon(
              Icons.check,
              size: 14,
              color: context.colorScheme.background,
            )
          : const SizedBox(),
    );
  }
}
