import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/comment_card.dart';

class CommentsCardBuilder extends StatelessWidget {
  const CommentsCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        // scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: SizedBox(
              width: 160,
              child: CommentCard(),
            ),
          );
        },
      ),
    );
  }
}
