import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/core/models/post_model.dart';

import '../widgets/post_card.dart';

class PostCardBuilder extends StatelessWidget {
  const PostCardBuilder({
    super.key, required this.posts,
  });
  final List<PostModel> posts;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        // physics: const BouncingScrollPhysics(),
        childCount: posts.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: PostCard(
                postModel: posts[index]),
          );
        },
      ),
    );
  }
}
