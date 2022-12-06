import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String source;
  final String title;
  final String description;
  final String urlImage;
  final String publishedAt;

  const NewsCard({
    super.key,
    required this.source,
    required this.title,
    required this.description,
    required this.urlImage,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: (MediaQuery.of(context).size.height / 100) * 20,
              width: (MediaQuery.of(context).size.width / 100) * 10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(urlImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width / 100) * 2,
                right: (MediaQuery.of(context).size.width / 100) * 4,
                top: (MediaQuery.of(context).size.width / 100) * 2,
                bottom: (MediaQuery.of(context).size.width / 100) * 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height / 100) * 1,
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height / 100) * 1,
                  ),
                  Text(
                    // format 8601 iso to string
                    DateTime.parse(publishedAt).toString().substring(0, 16),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
