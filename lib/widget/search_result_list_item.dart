import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchResultListItem extends StatelessWidget {
  const SearchResultListItem({
    super.key,
    required this.fullName,
    required this.description,
    required this.stargazersCount,
    required this.language,
  });

  final String fullName;
  final String description;
  final String stargazersCount;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(height: 8),
              const Icon(
                Icons.book_outlined,
                key: Key("book_icon"),
              ),
              const SizedBox(width: 8),
              AutoSizeText(
                // "flutter/flutter",
                fullName,
                key: const Key('full_name'),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: AutoSizeText(
              // "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
              description,
              textAlign: TextAlign.left,
              key: const Key("description"),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto'),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.star_border,
                key: Key("star_icon"),
                color: Colors.black38,
              ),
              AutoSizeText(
                // "16,530",
                stargazersCount,
                key: const Key("stargazers_count"),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'),
              ),
              const SizedBox(width: 15),
              // programming langage color circle
              Row(
                children: [
                  Container(
                    width: 13,
                    height: 13,
                    key: const Key("circle_icon"),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Container(width: 5),
              AutoSizeText(
                // "Dart",
                language,
                key: const Key("language"),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            key: Key("divider"),
            color: Colors.black38,
            thickness: 0.5,
            height: 8,
          )
        ],
      ),
    );
  }
}
