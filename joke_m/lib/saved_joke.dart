final String tableJokes = 'jokes';

class JokeFields {
  static final List<String> values = [
    id, setup, delivery
  ];

  static final String id = '_id';
  static final String setup = 'setup';
  static final String delivery = 'delivery';
}

class Joke{

  final int? id;
  final String setup;
  final String delivery;

  const Joke({
    this.id, required this.setup, required this.delivery
  });

  Joke copy({
    int? id,
    String? setup,
    String? delivery,
  }) => Joke(
      id: id ?? this.id,
      setup: setup ?? this.setup,
      delivery: delivery ?? this.delivery
  );

  static Joke fromJson(Map<String, Object?> json) => Joke(
      id: json[JokeFields.id] as int?,
      setup: json[JokeFields.setup] as String,
      delivery: json[JokeFields.delivery] as String
  );

  Map<String, Object?> toJson() => {
    JokeFields.id: id,
    JokeFields.setup: setup,
    JokeFields.delivery: delivery
  };

}