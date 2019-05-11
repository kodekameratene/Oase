import 'package:flutter/material.dart';
import 'package:jonah/src/ContentPost.dart';

class ProgramPage extends StatelessWidget {
  final List<ContentPost> _events = events;

  Widget build(context) {
    return ListView(
      children: _events
          .map(
            (post) => ListTile(
                  leading: Text(
                    "${post.startTime.month.toString().padLeft(2, '0')}/"
                        "${post.startTime.day.toString().padLeft(2, '0')}"
                        "\n${post.startTime.hour}:${post.startTime.minute}",
                  ),
                  title: Text(post.title),
                  subtitle: Text(
                    post.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Image.network(
                    post.img,
                    height: 100,
                    width: 100,
                  ),
                  onTap: () => showDialog(
                        context: context,
                        child: Dialog(
                          child: Column(
                            children: <Widget>[
                              Text(
                                post.title,
                                textScaleFactor: 2,
                              ),
                              Text(
                                post.content,
                                textScaleFactor: 1.8,
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        ),
                        barrierDismissible: true,
                      ),
                ),
          )
          .toList(),
    );
  }
}
