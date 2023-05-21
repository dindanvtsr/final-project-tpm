import 'package:flutter/material.dart';
import 'package:finalproject_tpm/api_data_source.dart';
import 'package:finalproject_tpm/news_model.dart';
import 'package:image_network/image_network.dart';
import 'package:url_launcher/url_launcher.dart';

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
        margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0, bottom: 10.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: ImageNetwork(
                  width: 200,
                  height: 350,
                  image: newsData.imageUrl!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsData.title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: newsData.summary!,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      newsData.publishedAt!,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      newsData.newsSite!,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _launchUrl(newsData.url!);
                      },
                      child: const Text(
                        'View More',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $url');
    }
  }
}
