base class User {
  final String name;
  final String jobTitle;
  final String about;
  final String photo;

  const User({
    required this.name,
    required this.jobTitle,
    required this.about,
    required this.photo,
  });
}

enum SkillType { programming, tools, languages }

base class Skill {
  final SkillType type;
  final String name;
  final int level;

  const Skill({required this.type, required this.name, required this.level});
}
