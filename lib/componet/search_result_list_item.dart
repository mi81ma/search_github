import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchResultListItem extends StatelessWidget {
  const SearchResultListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Image.network(
                    'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png'),
              ),
              const SizedBox(width: 8),
              const Text(
                "flutter",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "flutter",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto'),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.star_border,
                color: Colors.black38,
              ),
              Text(
                "16,530",
                style: TextStyle(
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
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Container(width: 5),
              Text(
                "16,530",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Divider(
            color: Colors.black38,
            thickness: 0.5,
            height: 8,
          )
        ],
      ),
    );
  }
}
