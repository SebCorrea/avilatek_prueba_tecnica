import 'package:get_it/get_it.dart';

final Injector injector = Injector(
  services: [],
);

class Injector {
  final List<InjectionService> services;

  Injector({required this.services});

  Future<void> injectAll() async => await Future.wait(
        services.map((service) => service.inject()),
      );
}

abstract class InjectionService {
  Future<void> inject();
}

final getIt = GetIt.instance;
