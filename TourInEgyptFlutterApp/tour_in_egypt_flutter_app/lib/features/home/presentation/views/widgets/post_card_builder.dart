import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';

import '../widgets/post_card.dart';

class PostCardBuilder extends StatelessWidget {
  const PostCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        // physics: const BouncingScrollPhysics(),
        childCount: BlocProvider.of<UserCubit>(context).posts.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: PostCard(
                postModel: BlocProvider.of<UserCubit>(context).posts[index]),
          );
        },
      ),
    );
  }
}
