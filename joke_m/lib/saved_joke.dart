final String tableJokes = 'jokes';

class JokeFields {
  static final List<String> values = [
    text
  ];
  static final String text = 'text';
}

class Joke{
  final String text;

  const Joke({
    required this.text
  });

  Joke copy({
    String? text
  }) => Joke(
      text: text ?? this.text
  );

  static Joke fromJson(Map<String, Object?> json) => Joke(
      text: json[JokeFields.text] as String
  );

  Map<String, Object?> toJson() => {
    JokeFields.text: text
  };

}