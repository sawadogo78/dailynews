// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailynews/ui/screens/article_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dailynews/models/news_models.dart';

class BlogTile extends StatelessWidget {
  final ArticleModel article;

  const BlogTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ArticleView(article: article);
                },
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: article.urlToImage == null
                  ? Center(
                      child: Text(
                        'No image for thi article',
                        style: GoogleFonts.pacifico(
                            color: Colors.red, fontSize: 20),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: article.urlToImage!,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) {
                        return Text(
                          'No image fund for this article',
                          style: GoogleFonts.abel(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            article.title,
            style: GoogleFonts.poppins(
              color: Colors.pink,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            article.description == null
                ? 'No description fund'
                : article.description!,
            style: GoogleFonts.poppins(color: Colors.black54),
          )
        ],
      ),
    );
  }
}
