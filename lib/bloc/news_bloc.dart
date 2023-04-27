import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/service/api_service.dart';
import '../model/news_model.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  ApiService apiService = ApiService();
  NewsBloc() : super(NewsInitial()) {
    on<GetDataEvent>((event, emit)async{
      emit(LoadingState());
      try{
        var data= await apiService.getNews();
        List<Articles>? articles= data?.articles;
        emit(DataLoadedState(articles));
      }catch(e){
        emit(ErrorState(e.toString()));
      }
    });
  }
}
