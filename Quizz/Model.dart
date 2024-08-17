class Questions {
  final String question;
  final List<String> answers;

  Questions(this.question, this.answers);

  List<String> ShuffelTheList() {
    final shuffeldList = List.of(answers);
    shuffeldList.shuffle();
    return shuffeldList;
  }
}
