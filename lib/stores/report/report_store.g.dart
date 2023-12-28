// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReportStore on _ReportStore, Store {
  Computed<bool>? _$isUploadInProcessComputed;

  @override
  bool get isUploadInProcess => (_$isUploadInProcessComputed ??= Computed<bool>(
          () => super.isUploadInProcess,
          name: '_ReportStore.isUploadInProcess'))
      .value;
  Computed<bool>? _$isDeletedInProcessComputed;

  @override
  bool get isDeletedInProcess => (_$isDeletedInProcessComputed ??=
          Computed<bool>(() => super.isDeletedInProcess,
              name: '_ReportStore.isDeletedInProcess'))
      .value;
  Computed<bool>? _$isFetchDocumentInProcessComputed;

  @override
  bool get isFetchDocumentInProcess => (_$isFetchDocumentInProcessComputed ??=
          Computed<bool>(() => super.isFetchDocumentInProcess,
              name: '_ReportStore.isFetchDocumentInProcess'))
      .value;

  late final _$reportFutureAtom =
      Atom(name: '_ReportStore.reportFuture', context: context);

  @override
  ObservableFuture<UploadReportResponse> get reportFuture {
    _$reportFutureAtom.reportRead();
    return super.reportFuture;
  }

  @override
  set reportFuture(ObservableFuture<UploadReportResponse> value) {
    _$reportFutureAtom.reportWrite(value, super.reportFuture, () {
      super.reportFuture = value;
    });
  }

  late final _$deleteDocumentFutureAtom =
      Atom(name: '_ReportStore.deleteDocumentFuture', context: context);

  @override
  ObservableFuture<bool> get deleteDocumentFuture {
    _$deleteDocumentFutureAtom.reportRead();
    return super.deleteDocumentFuture;
  }

  @override
  set deleteDocumentFuture(ObservableFuture<bool> value) {
    _$deleteDocumentFutureAtom.reportWrite(value, super.deleteDocumentFuture,
        () {
      super.deleteDocumentFuture = value;
    });
  }

  late final _$getAllDocumentResponseFutureAtom =
      Atom(name: '_ReportStore.getAllDocumentResponseFuture', context: context);

  @override
  ObservableFuture<GetAllDocumentResponse> get getAllDocumentResponseFuture {
    _$getAllDocumentResponseFutureAtom.reportRead();
    return super.getAllDocumentResponseFuture;
  }

  @override
  set getAllDocumentResponseFuture(
      ObservableFuture<GetAllDocumentResponse> value) {
    _$getAllDocumentResponseFutureAtom
        .reportWrite(value, super.getAllDocumentResponseFuture, () {
      super.getAllDocumentResponseFuture = value;
    });
  }

  late final _$getAllDocumentTypeResponseFutureAtom = Atom(
      name: '_ReportStore.getAllDocumentTypeResponseFuture', context: context);

  @override
  ObservableFuture<AllReportTypeResponse> get getAllDocumentTypeResponseFuture {
    _$getAllDocumentTypeResponseFutureAtom.reportRead();
    return super.getAllDocumentTypeResponseFuture;
  }

  @override
  set getAllDocumentTypeResponseFuture(
      ObservableFuture<AllReportTypeResponse> value) {
    _$getAllDocumentTypeResponseFutureAtom
        .reportWrite(value, super.getAllDocumentTypeResponseFuture, () {
      super.getAllDocumentTypeResponseFuture = value;
    });
  }

  late final _$currentReportResponseAtom =
      Atom(name: '_ReportStore.currentReportResponse', context: context);

  @override
  UploadReportResponse? get currentReportResponse {
    _$currentReportResponseAtom.reportRead();
    return super.currentReportResponse;
  }

  @override
  set currentReportResponse(UploadReportResponse? value) {
    _$currentReportResponseAtom.reportWrite(value, super.currentReportResponse,
        () {
      super.currentReportResponse = value;
    });
  }

  late final _$getAllDocumentResponseListAtom =
      Atom(name: '_ReportStore.getAllDocumentResponseList', context: context);

  @override
  GetAllDocumentResponse? get getAllDocumentResponseList {
    _$getAllDocumentResponseListAtom.reportRead();
    return super.getAllDocumentResponseList;
  }

  @override
  set getAllDocumentResponseList(GetAllDocumentResponse? value) {
    _$getAllDocumentResponseListAtom
        .reportWrite(value, super.getAllDocumentResponseList, () {
      super.getAllDocumentResponseList = value;
    });
  }

  late final _$getAllDocumentTypeResponseListAtom = Atom(
      name: '_ReportStore.getAllDocumentTypeResponseList', context: context);

  @override
  AllReportTypeResponse? get getAllDocumentTypeResponseList {
    _$getAllDocumentTypeResponseListAtom.reportRead();
    return super.getAllDocumentTypeResponseList;
  }

  @override
  set getAllDocumentTypeResponseList(AllReportTypeResponse? value) {
    _$getAllDocumentTypeResponseListAtom
        .reportWrite(value, super.getAllDocumentTypeResponseList, () {
      super.getAllDocumentTypeResponseList = value;
    });
  }

  late final _$currentDocumentToDeleteAtom =
      Atom(name: '_ReportStore.currentDocumentToDelete', context: context);

  @override
  int? get currentDocumentToDelete {
    _$currentDocumentToDeleteAtom.reportRead();
    return super.currentDocumentToDelete;
  }

  @override
  set currentDocumentToDelete(int? value) {
    _$currentDocumentToDeleteAtom
        .reportWrite(value, super.currentDocumentToDelete, () {
      super.currentDocumentToDelete = value;
    });
  }

  late final _$isDocumentDeletedAtom =
      Atom(name: '_ReportStore.isDocumentDeleted', context: context);

  @override
  bool? get isDocumentDeleted {
    _$isDocumentDeletedAtom.reportRead();
    return super.isDocumentDeleted;
  }

  @override
  set isDocumentDeleted(bool? value) {
    _$isDocumentDeletedAtom.reportWrite(value, super.isDocumentDeleted, () {
      super.isDocumentDeleted = value;
    });
  }

  late final _$fileNameAtom =
      Atom(name: '_ReportStore.fileName', context: context);

  @override
  String? get fileName {
    _$fileNameAtom.reportRead();
    return super.fileName;
  }

  @override
  set fileName(String? value) {
    _$fileNameAtom.reportWrite(value, super.fileName, () {
      super.fileName = value;
    });
  }

  late final _$fileTypeAtom =
      Atom(name: '_ReportStore.fileType', context: context);

  @override
  String? get fileType {
    _$fileTypeAtom.reportRead();
    return super.fileType;
  }

  @override
  set fileType(String? value) {
    _$fileTypeAtom.reportWrite(value, super.fileType, () {
      super.fileType = value;
    });
  }

  late final _$documentFileAtom =
      Atom(name: '_ReportStore.documentFile', context: context);

  @override
  File? get documentFile {
    _$documentFileAtom.reportRead();
    return super.documentFile;
  }

  @override
  set documentFile(File? value) {
    _$documentFileAtom.reportWrite(value, super.documentFile, () {
      super.documentFile = value;
    });
  }

  late final _$userIdAtom = Atom(name: '_ReportStore.userId', context: context);

  @override
  int? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$uploadReportAsyncAction =
      AsyncAction('_ReportStore.uploadReport', context: context);

  @override
  Future<dynamic> uploadReport() {
    return _$uploadReportAsyncAction.run(() => super.uploadReport());
  }

  late final _$getAllDocumentListAsyncAction =
      AsyncAction('_ReportStore.getAllDocumentList', context: context);

  @override
  Future<dynamic> getAllDocumentList() {
    return _$getAllDocumentListAsyncAction
        .run(() => super.getAllDocumentList());
  }

  late final _$getFilteredDocumentListAsyncAction =
      AsyncAction('_ReportStore.getFilteredDocumentList', context: context);

  @override
  Future<dynamic> getFilteredDocumentList(String sortFilter, String userName,
      String reportType, String searchText) {
    return _$getFilteredDocumentListAsyncAction.run(() => super
        .getFilteredDocumentList(sortFilter, userName, reportType, searchText));
  }

  late final _$getAllDocumentTypesAsyncAction =
      AsyncAction('_ReportStore.getAllDocumentTypes', context: context);

  @override
  Future<dynamic> getAllDocumentTypes() {
    return _$getAllDocumentTypesAsyncAction
        .run(() => super.getAllDocumentTypes());
  }

  late final _$deleteDocumentAsyncAction =
      AsyncAction('_ReportStore.deleteDocument', context: context);

  @override
  Future<dynamic> deleteDocument() {
    return _$deleteDocumentAsyncAction.run(() => super.deleteDocument());
  }

  @override
  String toString() {
    return '''
reportFuture: ${reportFuture},
deleteDocumentFuture: ${deleteDocumentFuture},
getAllDocumentResponseFuture: ${getAllDocumentResponseFuture},
getAllDocumentTypeResponseFuture: ${getAllDocumentTypeResponseFuture},
currentReportResponse: ${currentReportResponse},
getAllDocumentResponseList: ${getAllDocumentResponseList},
getAllDocumentTypeResponseList: ${getAllDocumentTypeResponseList},
currentDocumentToDelete: ${currentDocumentToDelete},
isDocumentDeleted: ${isDocumentDeleted},
fileName: ${fileName},
fileType: ${fileType},
documentFile: ${documentFile},
userId: ${userId},
isUploadInProcess: ${isUploadInProcess},
isDeletedInProcess: ${isDeletedInProcess},
isFetchDocumentInProcess: ${isFetchDocumentInProcess}
    ''';
  }
}
