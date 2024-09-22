import 'package:oopquiz/shared/progress_bar.dart';
import 'package:oopquiz/Models/topic_model.dart';
import 'package:flutter/material.dart';
import 'package:oopquiz/shared/topic_screen.dart';
import 'package:oopquiz/utils/constants.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;

  const TopicItem({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: topic.imagePath,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => TopicScreen(topic: topic),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  color: charcoalColor,
                  child: SizedBox(
                    height: 140,
                    child: Center(
                      child: Image.asset(
                        "assets/topics/${topic.imagePath}",
                        height: 50,
                        width: 100,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 14, right: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            topic.name,
                            style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.clip,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child:
                                  AnimatedProgressbar(value: topic.progress)),
                          Text(
                            "${(topic.progress * 100).round()}%",
                            style: TextStyle(
                                color: Colors.deepOrange
                                    .withGreen((topic.progress * 255).toInt())
                                    .withRed(
                                        255 - (topic.progress * 255).toInt())),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
