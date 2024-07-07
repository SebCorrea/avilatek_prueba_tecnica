abstract class UseCase<T, Params> {
  T execute(Params params);
}

class NoParams{}