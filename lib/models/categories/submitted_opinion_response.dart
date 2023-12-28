class SecondOpinionSubmittedResponse {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  SecondOpinionSubmittedResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  SecondOpinionSubmittedResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Result>[];
      json['results'].forEach((v) {
        results!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  SecondOpinionSubmittedResponse copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    List<Result>? results,
  }) {
    return SecondOpinionSubmittedResponse(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}

class Result {
  int? id;
  Request? request;
  String? status;
  String? chatRoom;
  String? totalPrice;
  int? totalNo;
  String? paymentTransactionNo;
  String? createdDate;
  bool? isPending;
  bool? isApproved;
  bool? isRunning;
  bool? isComplete;
  bool? isOpened;
  bool? paymentCompleted;
  List<int>? doctors;

  Result({
    this.id,
    this.request,
    this.status,
    this.chatRoom,
    this.totalPrice,
    this.totalNo,
    this.paymentTransactionNo,
    this.createdDate,
    this.isPending,
    this.isApproved,
    this.isRunning,
    this.isComplete,
    this.isOpened,
    this.paymentCompleted,
    this.doctors,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    request = json['request'] != null ? Request.fromJson(json['request']) : null;
    status = json['status'];
    chatRoom = json['chat_room'];
    totalPrice = json['total_price'];
    totalNo = json['total_no'];
    paymentTransactionNo = json['payment_transaction_no'];
    createdDate = json['created_date'];
    isPending = json['is_pending'];
    isApproved = json['is_approved'];
    isRunning = json['is_running'];
    isComplete = json['is_complete'];
    isOpened = json['is_opened'];
    paymentCompleted = json['payment_completed'];
    doctors = json['doctors'] != null ? List<int>.from(json['doctors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    if (request != null) {
      data['request'] = request!.toJson();
    }
    data['status'] = status;
    data['chat_room'] = chatRoom;
    data['total_price'] = totalPrice;
    data['total_no'] = totalNo;
    data['payment_transaction_no'] = paymentTransactionNo;
    data['created_date'] = createdDate;
    data['is_pending'] = isPending;
    data['is_approved'] = isApproved;
    data['is_running'] = isRunning;
    data['is_complete'] = isComplete;
    data['is_opened'] = isOpened;
    data['payment_completed'] = paymentCompleted;
    data['doctors'] = doctors;
    return data;
  }

  Result copyWith({
    int? id,
    Request? request,
    String? status,
    String? chatRoom,
    String? totalPrice,
    int? totalNo,
    String? paymentTransactionNo,
    String? createdDate,
    bool? isPending,
    bool? isApproved,
    bool? isRunning,
    bool? isComplete,
    bool? isOpened,
    bool? paymentCompleted,
    List<int>? doctors,
  }) {
    return Result(
      id: id ?? this.id,
      request: request ?? this.request,
      status: status ?? this.status,
      chatRoom: chatRoom ?? this.chatRoom,
      totalPrice: totalPrice ?? this.totalPrice,
      totalNo: totalNo ?? this.totalNo,
      paymentTransactionNo: paymentTransactionNo ?? this.paymentTransactionNo,
      createdDate: createdDate ?? this.createdDate,
      isPending: isPending ?? this.isPending,
      isApproved: isApproved ?? this.isApproved,
      isRunning: isRunning ?? this.isRunning,
      isComplete: isComplete ?? this.isComplete,
      isOpened: isOpened ?? this.isOpened,
      paymentCompleted: paymentCompleted ?? this.paymentCompleted,
      doctors: doctors ?? this.doctors,
    );
  }
}

class Request {
  int? id;
  Form? form;
  bool? isSubUser;
  int? mainUser;
  dynamic user;

  Request({
    this.id,
    this.form,
    this.isSubUser,
    this.mainUser,
    this.user,
  });

  Request.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    form = json['form'] != null ? Form.fromJson(json['form']) : null;
    isSubUser = json['is_sub_user'];
    mainUser = json['mainuser'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    if (form != null) {
      data['form'] = form!.toJson();
    }
    data['is_sub_user'] = isSubUser;
    data['mainuser'] = mainUser;
    data['user'] = user;
    return data;
  }

  Request copyWith({
    int? id,
    Form? form,
    bool? isSubUser,
    int? mainUser,
    dynamic user,
  }) {
    return Request(
      id: id ?? this.id,
      form: form ?? this.form,
      isSubUser: isSubUser ?? this.isSubUser,
      mainUser: mainUser ?? this.mainUser,
      user: user ?? this.user,
    );
  }
}

class Form {
  int? id;
  Category? category;
  String? title;

  Form({
    this.id,
    this.category,
    this.title,
  });

  Form.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['title'] = title;
    return data;
  }

  Form copyWith({
    int? id,
    Category? category,
    String? title,
  }) {
    return Form(
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
    );
  }
}

class Category {
  int? id;
  String? title;
  int? price;
  String? image;

  Category({
    this.id,
    this.title,
    this.price,
    this.image,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['image'] = image;
    return data;
  }

  Category copyWith({
    int? id,
    String? title,
    int? price,
    String? image,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }
}
