final String tablePreferences = 'preferences';

class PreferenceFields {
  static final List<String> values = [
    id, language, blacklist, skip
  ];

  static final String id = '_id';
  static final String language = 'language';
  static final String blacklist = 'blacklist';
  static final String skip = 'skip';
}

class Preferences{

  final int? id;
  final String language;
  final String blacklist;
  final int skip;

  const Preferences({
    this.id, required this.language, required this.blacklist, required this.skip
  });

  Preferences copy({
    int? id,
    String? language,
    String? blacklist,
    int? skip
  }) => Preferences(
      id: id ?? this.id,
      language: language ?? this.language,
      blacklist: blacklist ?? this.blacklist,
      skip: skip ?? this.skip
  );

  static Preferences fromJson(Map<String, Object?> json) => Preferences(
    id: json[PreferenceFields.id] as int?,
    language: json[PreferenceFields.language] as String,
    blacklist: json[PreferenceFields.blacklist] as String,
    skip: json[PreferenceFields.skip] as int
  );

  Map<String, Object?> toJson() => {
    PreferenceFields.id: id,
    PreferenceFields.language: language,
    PreferenceFields.blacklist: blacklist,
    PreferenceFields.skip: skip
  };

}