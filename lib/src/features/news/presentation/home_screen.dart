import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kompas_app_clone/src/common_widgets/heading_news_widget.dart';
import 'package:flutter_kompas_app_clone/src/common_widgets/news_card.dart';
import 'package:flutter_kompas_app_clone/src/constants/app_sizes.dart';
import 'package:flutter_kompas_app_clone/src/constants/theme.dart';
import 'package:flutter_kompas_app_clone/src/features/news/data/bloc/news_bloc.dart';
import 'package:flutter_kompas_app_clone/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/ic_kompas_title.png',
          fit: BoxFit.cover,
          height: 30,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.search.name);
            },
            icon: const Icon(
              Icons.search,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.profile.name);
            },
            icon: const Icon(
              Icons.account_circle,
              size: 30.0,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          Column(
            children: [
              gapH32,
              Text(
                'Editorial Top Stories',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              gapH20,
              HeadingNewsWidget(
                category: 'Regional',
                title:
                    'Hasil Indonesia Masters 2023: Selamat Datang Kembali,Praveen/Melati!',
                image: 'assets/img_news_one.png',
                onTap: () {
                  context.pushNamed(AppRoute.detailNews.name);
                },
                onPressedMore: () {},
              ),
              gapH40,
            ],
          ),
          BlocProvider(
            create: (context) => NewsBloc()..add(NewsGet()),
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                print(state);
                if (state is NewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is NewsSuccess) {
                  return Column(
                    children: state.news.map((news) {
                      return NewsCard(news: news);
                    }).toList(),
                  );
                }
                if (state is NewsFailed) {
                  print('failed');
                  return const Center(
                    child: Text("Error Load Data"),
                  );
                }
                return const Center(
                  child: Text('Try Again'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
