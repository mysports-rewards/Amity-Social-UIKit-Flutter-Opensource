import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_uikit_beta_service/amity_uikit.dart';
import 'package:amity_uikit_beta_service/view/social/global_feed.dart';
import 'package:amity_uikit_beta_service/viewmodel/post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MsrReactionWidget extends StatelessWidget {
  final AmityPost post;
  final FeedType feedType;

  const MsrReactionWidget({
    Key? key,
    required this.post,
    required this.feedType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(
          horizontal: 8,
        ),
      ),
      minimumSize: WidgetStateProperty.all<Size>(Size.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
    return GestureDetector(
      onTap: () {
        if (post.myReactions!.contains("like")) {
          HapticFeedback.lightImpact();
          Provider.of<PostVM>(context, listen: false).removePostReaction(post);
        } else {
          HapticFeedback.lightImpact();
          Provider.of<PostVM>(context, listen: false).addPostReaction(post);
        }
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 6, top: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                post.myReactions!.contains("like")
                    ? TextButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          Provider.of<PostVM>(context, listen: false).removePostReaction(post);
                        },
                        style: buttonStyle,
                        child: Row(
                          children: [
                            Icon(
                              MsrAmityIcon.thumbUpFilled,
                              size: 16,
                              color: context.msrMaterialColorScheme.onSurface,
                            ),
                            Text(
                              ' Liked',
                              style: context.msrMaterialTheme.textTheme.labelLarge?.copyWith(
                                color: context.msrMaterialColorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          Provider.of<PostVM>(context, listen: false).addPostReaction(post);
                        },
                        style: buttonStyle,
                        child: Row(
                          children: [
                            Icon(
                              MsrAmityIcon.thumbUpOutlined,
                              size: 16,
                              color: context.msrMaterialTheme.disabledColor,
                            ),
                            Text(
                              ' Like',
                              style: context.msrMaterialTheme.textTheme.labelLarge?.copyWith(
                                color: context.msrMaterialTheme.disabledColor,
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
