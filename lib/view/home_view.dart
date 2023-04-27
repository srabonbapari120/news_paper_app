import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/news_bloc.dart';
import 'package:news/constant/constant.dart';
import 'package:news/view/news_details_view.dart';
import '../widget/home_view_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBloc>().add(GetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "N E W S",style: TextStyle(color: Colors.deepPurple),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is DataLoadedState) {
          return ListView.builder(
            itemCount: state.article?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>
                          NewsDetailsView(index: index,article: state.article,)));
                },
                child:homeViewWidget(context,state.article,index),
              );
            },
          );
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
          return Constant.gettoast(state.message.toString());
        } else {
          return Container();
        }
      }),
    );
  }
}
