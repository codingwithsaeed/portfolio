import 'package:portfolio/features/home/domain/entities/lang_holder_model.dart';

base class User {
  final LangHolderModel name;
  final LangHolderModel jobTitle;
  final LangHolderModel about;
  final List<Skill> skills;
  final List<Education> educations;
  final List<WordExperience> workExperiences;
  final String photo;

  const User({
    required this.name,
    required this.jobTitle,
    required this.about,
    required this.photo,
    this.skills = const <Skill>[],
    this.educations = const <Education>[],
    this.workExperiences = const <WordExperience>[],
  });
}

enum SkillType { programming, tools, languages }

base class Skill {
  final SkillType type;
  final LangHolderModel name;
  final int level;

  const Skill({required this.type, required this.name, required this.level});
}

base class Education {
  final LangHolderModel grade;
  final DateTime startDate;
  final DateTime? endDate;
  final LangHolderModel institute;
  final String? link;

  const Education({
    required this.grade,
    required this.startDate,
    required this.institute,
    this.endDate,
    this.link,
  });
}

base class WordExperience {
  final LangHolderModel company;
  final DateTime startDate;
  final DateTime? endDate;
  final LangHolderModel title;
  final String? link;

  const WordExperience({
    required this.company,
    required this.startDate,
    required this.title,
    this.endDate,
    this.link,
  });
}
