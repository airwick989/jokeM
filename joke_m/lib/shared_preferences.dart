import 'options.dart';

class Preferences{
  late final String language;
  late final Set<String> blacklist;
  late final bool skip;

  Preferences({
    required this.language, required this.blacklist, required this.skip
  });

}