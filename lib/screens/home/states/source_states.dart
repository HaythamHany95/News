import 'package:news_app/models/sources_response.dart';

abstract class SourceStates {}

class SourceLoadingState extends SourceStates {
  /// Add any `Data` you gonna use instead of ProgressIndicator Widget
}

class SourceErrorState extends SourceStates {
  String? errorMessage;
  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends SourceStates {
  List<Source>? sources;
  SourceSuccessState({required this.sources});
}
