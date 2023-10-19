import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/network/api_constance..dart';
import '../../../data/models/movies.dart';
import '../screens/movie_detail_screen.dart';

class SearchedMovieItem extends StatelessWidget {
  const SearchedMovieItem({super.key, required this.movies});

  final Movies movies;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailScreen(
                  id: movies.id!,
                ),
              )),
          child: Row(
            children: [
              SizedBox(width: size.width * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  height: size.height * 0.08,
                  width: size.width * 0.15,
                  fit: BoxFit.cover,
                  imageUrl: ApiConstance.imageUrl(movies.backdropPath ?? ''),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 170,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.redAccent),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                constraints: BoxConstraints(maxWidth: size.width * 0.7),
                child: Text(
                  movies.originalTitle!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 6, thickness: 0.5)
      ],
    );
  }
}
