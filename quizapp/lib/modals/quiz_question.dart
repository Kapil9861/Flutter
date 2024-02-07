class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(this.question, this.answers);

  List<String> shuffledAnswers() {
    final shuffledAnswerList = List.of(answers);
    shuffledAnswerList.shuffle();
    return shuffledAnswerList;
  }
}
