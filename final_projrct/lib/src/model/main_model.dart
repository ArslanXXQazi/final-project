class MainModel
{
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  int?     id;
  MainModel({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    this.id,
});
}