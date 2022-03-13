import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:word_break_text/word_break_text.dart';

class FeedListHeader extends StatelessWidget {
  final String title;
  final String description;

  const FeedListHeader(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Column(children: [
        Row(
          children: [
            Flexible(
              child: WordBreakText(
                title,
                crossAxisAlignment: WrapCrossAlignment.center,
                style: const TextStyle(
                    height: 1.3,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              width: 40,
            )
          ],
        ),
        Container(
            height: 200,
            child: Html(
              data: description,
              // tagsList: const ['p'],
            )),
        // RichText(
        //   overflow: TextOverflow.ellipsis,
        //   strutStyle: const StrutStyle(fontSize: 12),
        //   maxLines: 3,
        //   text: TextSpan(
        //       style: ,
        //       text: ),
        // ),
      ]),
    );
  }
}
