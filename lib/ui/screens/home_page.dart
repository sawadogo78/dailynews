// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:dailynews/ui/widgets/myappBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dailynews/repositories/data_repository.dart';
import 'package:dailynews/ui/widgets/blogTile.dart';
import 'package:dailynews/ui/widgets/categoryTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    final dataProvider =
        Provider.of<CategoryDataProvider>(context, listen: false);
    await dataProvider.initData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<CategoryDataProvider>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: MyappBar(
          text1: 'Flutter',
          text2: 'News',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataProvider.categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                      categoryModel: dataProvider.categories[index]);
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height - 110,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: dataProvider.articlesNews.length,
                itemBuilder: (context, index) {
                  final article = dataProvider.articlesNews[index];
                  return BlogTile(article: article);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
