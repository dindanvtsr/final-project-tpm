import 'package:flutter/material.dart';
import 'package:finalproject_tpm/api_data_source.dart';
import 'package:finalproject_tpm/news_model.dart';

class ListNews extends StatefulWidget {
  const ListNews({Key? key}) : super(key: key);

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spaceflight News"),
      ),
      body: _buildListNewsBody(),
    );
  }

  Widget _buildListNewsBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadNews(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            NewsModel newsModel = NewsModel.fromJson(snapshot.data);
            return _buildSuccessSection(newsModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(NewsModel news) {
    return ListView.builder(
      itemCount: news.results!.length,
      itemBuilder: (context, index) {
        return _buildItemNews(news.results![index]);
      },
    );
  }

  Widget _buildItemNews(Results newsData) {
    return InkWell(
      child: Card(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newsData.title!)
              ],
            )
          ],
        ),
      ),
    );
  }

}
