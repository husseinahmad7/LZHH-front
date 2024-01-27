import 'package:flutter/material.dart';
import 'package:lzhh/api.dart';
import 'package:lzhh/article.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  http.Client client = http.Client();
  late Future<List<Article>> newsData;
  @override
  void initState() {
    super.initState();
    newsData = fetchArticles(client);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: FutureBuilder<List<Article>>(
        future: newsData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return NewsCard(
                    title: snapshot.data![index].title,
                    dateTime: snapshot.data![index].pub_date,
                    description: snapshot.data![index].description);
                // return ListTile(
                //   title: Text(
                //     snapshot.data![index].title,
                //     style: const TextStyle(fontSize: 20),
                //   ),
                //   subtitle: Text(snapshot.data![index].description,
                //       style: const TextStyle(fontSize: 16)),
                //   tileColor: Colors.grey[200],
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   hoverColor: const Color.fromARGB(0, 73, 175, 175),
                //   contentPadding: EdgeInsets.all(20),
                // );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class NewsCard extends StatefulWidget {
  const NewsCard(
      {super.key,
      required this.title,
      required this.dateTime,
      required this.description});
  final String title;
  final DateTime dateTime;
  final String description;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        // width: _isExpanded ? 400 : 200,
        // height: _isExpanded ? 400 : 200,
        child: Card(
          shadowColor: Colors.cyan,
          // margin: EdgeInsetsGeometry,
          child: Column(
            children: [
              Visibility(
                maintainState: true,
                maintainAnimation: true,
                visible: _isExpanded,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: _isExpanded ? 1.0 : 0.0,
                  child: Image.network(
                    'https://picsum.photos/200',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              AnimatedPadding(
                duration: const Duration(seconds: 1),
                padding: _isExpanded ? const EdgeInsets.all(20) : const EdgeInsets.all(5),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _isExpanded ? 1.0 : 0.0,
                child: Text(
                  widget.dateTime.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _isExpanded ? 1.0 : 0.0,
                child: Text(
                  widget.description,
                  maxLines: 4,
                  // overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    // overflow: TextOverflow.ellipsis
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
