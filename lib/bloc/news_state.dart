part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends NewsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DataLoadedState extends NewsState {
  final List<Articles>? article;

  const DataLoadedState(this.article);

  @override
  // TODO: implement props
  List<Object?> get props => [article];
}

class ErrorState extends NewsState {
  final String message;

  const ErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
