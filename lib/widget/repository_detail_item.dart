import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:search_github/utils/size_config.dart';

class RepositoryDetailItem extends StatelessWidget {
  const RepositoryDetailItem({
    super.key,
    this.ownerIconUrl,
    this.repositoryName,
    this.stargazersCount,
    this.projectLanguage,
    this.watchersCount,
    this.forksCount,
    this.openIssuesCount,
  });

  final String? ownerIconUrl; // オーナーアイコン URL (avatar_url)
  final String? repositoryName; // リポジトリ名 (full_name)
  final int? stargazersCount; // Star 数 (stargazers_count)
  final String? projectLanguage; // プロジェクト言語 (language)
  final int? watchersCount; // Watcher 数 (watchers)
  final int? forksCount; // Fork 数 (forks_count)
  final int? openIssuesCount; // Issue 数 (open_issues_count)

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: ownerIconUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(300.0),
                    child: Image(
                        key: const Key('owner_icon'),
                        width: 128,
                        height: 128,
                        image: NetworkImage(ownerIconUrl!)
                        // image: NetworkImage(ownerIconUrl!),
                        ))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(300.0),
                    child: const Image(
                      key: Key('owner_icon'),
                      width: 128,
                      height: 128,
                      image: AssetImage('assets/images/no_image.png'),
                      // image: NetworkImage(ownerIconUrl!),
                    ))),
        const SizedBox(height: 8),

        // Repository Name
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 100 - 150,
              child: Center(
                child: AutoSizeText(
                  repositoryName ?? "",
                  key: const Key('repository_name'),
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        SizedBox(
          width: SizeConfig.screenWidth! - 64,
          child: Center(
            child: SizedBox(
              height: 200,
              width: 250,
              child: Column(
                children: [
                  // Star 数 (stargazers_count)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const AutoSizeText(
                        "Stargazers Count:",
                        key: Key("stargazers_count_title"),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                      const SizedBox(width: 15),
                      const Icon(
                        Icons.star_border,
                        key: Key("star_icon"),
                        color: Colors.black38,
                      ),
                      const SizedBox(width: 2),
                      AutoSizeText(
                        // "16,530",
                        stargazersCount != null
                            ? "$stargazersCount"
                            : "No Data",
                        key: const Key("stargazers_count"),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const AutoSizeText(
                        "Project Language:",
                        key: Key("project_language_title"),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                      const SizedBox(width: 18),
                      // programming langage color circle
                      Container(
                        width: 13,
                        height: 13,
                        key: const Key("circle_icon"),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(width: 8),
                      Expanded(
                        child: AutoSizeText(
                          // "Dart",
                          projectLanguage ?? "",
                          key: const Key("language"),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto'),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Watcher 数 (watchers)
                  Row(
                    children: [
                      const AutoSizeText(
                        "Watchers Count:",
                        key: Key("watchers_title"),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                      const SizedBox(width: 22),
                      const Icon(
                        Icons.visibility_outlined,
                        key: Key("watchers_icon"),
                        color: Colors.black38,
                      ),
                      const SizedBox(width: 4),
                      AutoSizeText(
                        // "16,530",
                        watchersCount != null ? "$watchersCount" : "No Data",
                        key: const Key("watchers_count"),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Fork 数 (forks_count)
                  Row(
                    children: [
                      const AutoSizeText(
                        "Fork Count:",
                        key: Key("fork_count_title"),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                      const SizedBox(width: 56),
                      const Icon(
                        Icons.fork_left,
                        key: Key("fork_icon"),
                        color: Colors.black38,
                      ),
                      const SizedBox(width: 6),
                      AutoSizeText(
                        // "16,530",
                        forksCount != null ? "$forksCount" : "No Data",
                        key: const Key("forks_count"),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // Issue 数 (open_issues_count)
                  Row(
                    children: [
                      const AutoSizeText(
                        "Issue Count:",
                        key: Key("issue_title"),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                      const SizedBox(width: 50),
                      const Icon(
                        Icons.adjust,
                        key: Key("issue_icon"),
                        color: Colors.black38,
                      ),
                      const SizedBox(width: 6),
                      AutoSizeText(
                        // "16,530",
                        openIssuesCount != null
                            ? "$openIssuesCount"
                            : "No Data",
                        key: const Key("open_issues_count"),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
