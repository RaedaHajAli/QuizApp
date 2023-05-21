// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionModel {
  final int id, answerIndex;
  final String question;
  final List<String> options;

  QuestionModel({
    required this.id,
    required this.answerIndex,
    required this.question,
    required this.options,
  });
}
