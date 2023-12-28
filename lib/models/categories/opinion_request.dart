class OpinionSubmitRequest {
  int? form;
  int? userId;
  List<Answer>? answers = [];
  String? description;
  String? files;

  OpinionSubmitRequest({
    this.form,
    this.userId,
    this.answers,
    this.description,
    this.files,
  });

  OpinionSubmitRequest.fromJson(Map<String, dynamic> json) {
    form = json['form'];
    userId = json['userId'];
    description = json['description'];
    files = json['files'];
    if (json['answers'] != null) {
      answers = <Answer>[];
      json['answers'].forEach((v) {
        answers!.add(Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['form'] = form;
    if (userId != null) {
      data['userId'] = userId;
    }
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['files'] = files;
    return data;
  }

  OpinionSubmitRequest copyWith({
    int? form,
    int? userId,
    List<Answer>? answers,
    String? description,
    String? files,
  }) =>
      OpinionSubmitRequest(
        form: form ?? this.form,
        userId: userId ?? this.userId,
        answers: answers ?? this.answers,
        description: description ?? this.description,
        files: files ?? this.files,
      );
}

class Answer {
  int? question;
  String? type;
  String? answer;

  Answer({
    this.question,
    this.type,
    this.answer,
  });

  Answer.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    type = json['type'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = question;
    data['type'] = type;
    data['answer'] = answer;
    return data;
  }

  Answer copyWith({
    int? question,
    String? type,
    String? answer,
  }) =>
      Answer(
        question: question ?? this.question,
        type: type ?? this.type,
        answer: answer ?? this.answer,
      );
}
