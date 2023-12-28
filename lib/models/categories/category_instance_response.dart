class CategoryInstanceResponse {
  int? id;
  int? category;
  String? title;
  List<Question>? questions;

  CategoryInstanceResponse({
    this.id,
    this.category,
    this.title,
    this.questions,
  });

  CategoryInstanceResponse.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    category = data['category'];
    questions = (data['questions'] as List<dynamic>).map((item) => Question.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['category'] = this.category;
    data['questions'] = this.questions;
    return data;
  }

  CategoryInstanceResponse copyWith({
    int? id,
    int? category,
    String? title,
    List<Question>? questions,
  }) =>
      CategoryInstanceResponse(
        id: id ?? this.id,
        category: category ?? this.category,
        title: title ?? this.title,
        questions: questions ?? this.questions,
      );
}

enum QuestionType {
  MCQ,
  EditText,
  Document
}

class Question {
  int? id;
  QuestionType? type; // Updated type to use enum
  String? question;
  List<Option>? options;

  Question({
    this.id,
    this.type,
    this.question,
    this.options,
  });

  Question.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    type = parseQuestionType(data['type']); // Parse string to enum
    options = (data['options'] as List<dynamic>).map((item) => Option.fromJson(item)).toList();
    question = data['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['type'] = getQuestionTypeString(this.type); // Convert enum to string
    data['options'] = this.options;
    data['question'] = this.question;
    return data;
  }

  Question copyWith({
    int? id,
    QuestionType? type,
    String? question,
    List<Option>? options,
  }) =>
      Question(
        id: id ?? this.id,
        type: type ?? this.type,
        question: question ?? this.question,
        options: options ?? this.options,
      );

  // Helper function to parse string to enum
    QuestionType? parseQuestionType(String? type) {
    if (type == 'MCQ') {
      return QuestionType.MCQ;
    } else if (type == 'EditText') {
      return QuestionType.EditText;
    }else if((type == 'Document')){
      return QuestionType.Document;

    }
    return null; // Handle unrecognized types
  }

  // Helper function to convert enum to string
    String? getQuestionTypeString(QuestionType? type) {
    switch (type) {
      case QuestionType.MCQ:
        return 'MCQ';
      case QuestionType.EditText:
        return 'EditText';
      case QuestionType.Document:
        return 'Document';
      default:
        return null; // Handle unrecognized types
    }
  }
}


class Option {
  String? option;
  int? question;

  Option({
    this.option,
    this.question,
  });

  Option.fromJson(Map<String, dynamic> data) {
    option = data['option'];
    question = data['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['option'] = this.option;
    data['question'] = this.question;
    return data;
  }

  Option copyWith({
    String? option,
    int? question,
  }) =>
      Option(
        option: option ?? this.option,
        question: question ?? this.question,
      );
}
