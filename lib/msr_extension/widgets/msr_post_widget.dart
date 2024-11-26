import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_uikit_beta_service/amity_uikit.dart';
import 'package:amity_uikit_beta_service/components/alert_dialog.dart';
import 'package:amity_uikit_beta_service/components/custom_user_avatar.dart';
import 'package:amity_uikit_beta_service/view/UIKit/social/community_setting/posts/edit_post_page.dart';
import 'package:amity_uikit_beta_service/view/UIKit/social/general_component.dart';
import 'package:amity_uikit_beta_service/view/social/comments.dart';
import 'package:amity_uikit_beta_service/view/social/global_feed.dart';
import 'package:amity_uikit_beta_service/view/user/user_profile_v2.dart';
import 'package:amity_uikit_beta_service/viewmodel/community_feed_viewmodel.dart';
import 'package:amity_uikit_beta_service/viewmodel/configuration_viewmodel.dart';
import 'package:amity_uikit_beta_service/viewmodel/edit_post_viewmodel.dart';
import 'package:amity_uikit_beta_service/viewmodel/feed_viewmodel.dart';
import 'package:amity_uikit_beta_service/viewmodel/post_viewmodel.dart';
import 'package:amity_uikit_beta_service/viewmodel/user_feed_viewmodel.dart';
import 'package:amity_uikit_beta_service/viewmodel/user_viewmodel.dart';
import 'package:animation_wrappers/animations/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MsrPostWidget extends StatelessWidget {
  const MsrPostWidget({
    Key? key,
    required this.post,
    required this.theme,
    required this.postIndex,
    this.isFromFeed = false,
    required this.showlatestComment,
    required this.feedType,
    required this.showCommunity,
    this.showAcceptOrRejectButton = false,
    required this.isPostDetail,
  }) : super(key: key);

  final FeedType feedType;
  final AmityPost post;
  final ThemeData theme;
  final int postIndex;
  final bool isFromFeed;
  final bool showlatestComment;
  final bool showCommunity;
  final bool showAcceptOrRejectButton;
  final bool isPostDetail;

  // @override
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.isDarkModeExt
          ? context.msrMaterialColorScheme.surfaceContainerLowest
          : context.msrMaterialColorScheme.surfaceContainerHighest,
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _onPostTap(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _MsrPostCardHeader(
                    post: post,
                    feedType: feedType,
                    postIndex: postIndex,
                    isPostDetail: isPostDetail,
                  ),
                  _MsrPostCardContent(
                    post: post,
                    feedType: feedType,
                  ),
                  _MsrPostStatistics(
                    feedType: feedType,
                    post: post,
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          _PostActions(
            post: post,
            feedType: feedType,
            showAcceptOrRejectButton: showAcceptOrRejectButton,
            isFromFeed: isFromFeed,
          ),
        ],
      ),
    );
  }

  void _onPostTap(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (isFromFeed) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CommentScreen(
            amityPost: post,
            theme: theme,
            isFromFeed: true,
            feedType: feedType,
          ),
        ),
      );
    }
  }
}

class _AddCommentButton extends StatelessWidget {
  const _AddCommentButton({
    required this.isFromFeed,
    required this.post,
    required this.feedType,
  });

  final bool isFromFeed;
  final AmityPost post;
  final FeedType feedType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isFromFeed) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CommentScreen(
                amityPost: post,
                theme: Theme.of(context),
                isFromFeed: true,
                feedType: feedType,
              ),
            ),
          );
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            MsrAmityIcon.comment,
            size: 16,
            color: context.msrMaterialTheme.disabledColor,
          ),
          const SizedBox(width: 4),
          Text(
            'Comment',
            style: context.msrMaterialTheme.textTheme.labelLarge?.copyWith(
              color: context.msrMaterialTheme.disabledColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _MsrPostCardContent extends StatelessWidget {
  const _MsrPostCardContent({
    required this.post,
    required this.feedType,
  });

  final AmityPost post;
  final FeedType feedType;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (post.data != null) {
      widgets.add(
        MsrAmityPostContentWidget(
          [post],
          false,
          false,
          feedType,
        ),
      );
    }
    final childrenPosts = post.children;
    if (childrenPosts != null && childrenPosts.isNotEmpty) {
      widgets.add(
        MsrAmityPostContentWidget(
          childrenPosts,
          true,
          true,
          feedType,
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widgets,
    );
  }
}

class _MsrPostCardHeader extends StatelessWidget {
  const _MsrPostCardHeader({
    required this.post,
    required this.feedType,
    required this.postIndex,
    required this.isPostDetail,
  });
  final AmityPost post;
  final FeedType feedType;
  final int postIndex;
  final bool isPostDetail;

  void showDeleteConfirmationDialog(BuildContext context) {
    ConfirmationDialog().show(
      context: context,
      title: 'Delete Post?',
      detailText: 'Do you want to Delete your post?',
      leftButtonText: 'Cancel',
      rightButtonText: 'Delete',
      onConfirm: () {
        if (feedType == FeedType.global) {
          Provider.of<FeedVM>(context, listen: false).deletePost(post, postIndex, (isSuccess, error) {
            if (isSuccess && isPostDetail) {
              Navigator.of(context).pop();
            }
          });
        } else if (feedType == FeedType.community) {
          Provider.of<CommuFeedVM>(context, listen: false).deletePost(post, postIndex, (isSuccess, error) {
            if (isSuccess && isPostDetail) {
              Navigator.of(context).pop();
            }
          });
        } else if (feedType == FeedType.user) {
          Provider.of<UserFeedVM>(context, listen: false).deletePost(post, (isSuccess, error) {
            if (isSuccess && isPostDetail) {
              Navigator.of(context).pop();
            }
          });
        } else if (feedType == FeedType.pending) {
          Provider.of<CommuFeedVM>(context, listen: false).deletePendingPost(post, postIndex);
        } else {
          print("unhandled postType");
        }
      },
    );
  }

  void handleMenuOption(context, String option, bool isFlaggedByMe) {
    switch (option) {
      case 'Report Post':
      case 'Unreport Post':
        if (isFlaggedByMe) {
          Provider.of<PostVM>(context, listen: false).unflagPost(post);
        } else {
          Provider.of<PostVM>(context, listen: false).flagPost(post);
        }
        break;
      case 'Edit Post':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<EditPostVM>(
              create: (context) => EditPostVM(),
              child: AmityEditPostScreen(
                amityPost: post,
              ),
            ),
          ),
        );
        break;
      case 'Delete Post':
        showDeleteConfirmationDialog(context);
        break;
      case 'Block User':
        Provider.of<UserVM>(context, listen: false).blockUser(post.postedUserId!, () {
          if (feedType == FeedType.global) {
            Provider.of<FeedVM>(context, listen: false).reload();
          } else if (feedType == FeedType.community) {
            Provider.of<CommuFeedVM>(context, listen: false)
                .initAmityCommunityFeed((post.target as CommunityTarget).targetCommunityId!);
          }
        });
        break;
      default:
    }
  }

  Widget postOptions(BuildContext context) {
    bool isPostOwner = post.postedUserId == AmityCoreClient.getCurrentUser().userId;
    final isFlaggedByMe = post.isFlaggedByMe;
    List<String> postOwnerMenu = ['Edit Post', 'Delete Post'];
    List<String> otherPostMenu = [
      isFlaggedByMe ? 'Unreport Post' : 'Report Post',
    ];

    return IconButton(
      visualDensity: VisualDensity.compact,
      icon: Icon(
        Icons.more_horiz_rounded,
        color: context.msrMaterialColorScheme.onSurface,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                color: context.msrMaterialColorScheme.surfaceContainer,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 32,
              ),
              child: Wrap(
                children: [
                  if (isPostOwner)
                    ...postOwnerMenu.map((option) => ListTile(
                          title: Text(
                            option,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            handleMenuOption(
                              context,
                              option,
                              isFlaggedByMe,
                            );
                          },
                        )),
                  if (!isPostOwner)
                    ...otherPostMenu.map((option) => ListTile(
                          title: Text(
                            option,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            handleMenuOption(
                              context,
                              option,
                              isFlaggedByMe,
                            );
                          },
                        )),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: FadeAnimation(
        child: GestureDetector(
          onTap: () {
            //TODO: Navigate to MSR user profile
          },
          child: getAvatarImage(
            post.postedUser!.userId != AmityCoreClient.getCurrentUser().userId
                ? post.postedUser?.avatarUrl
                : AmityCoreClient.getCurrentUser().avatarUrl,
          ),
        ),
      ),
      title: Wrap(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (context) => UserFeedVM(),
                    child: UserProfileScreen(amityUser: post.postedUser!, amityUserId: post.postedUser!.userId!),
                  ),
                ),
              );
            },
            child: Text(
              post.postedUser!.userId != AmityCoreClient.getCurrentUser().userId
                  ? post.postedUser?.displayName ?? "Display name"
                  : AmityCoreClient.getCurrentUser().displayName ?? "",
              style: context.msrMaterialTheme.textTheme.bodyLarge?.copyWith(
                color: context.msrMaterialColorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          TimeAgoWidget(
            createdAt: post.createdAt!,
            textColor: context.msrMaterialColorScheme.onSurface,
          ),
          post.editedAt != post.createdAt
              ? Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: feedType == FeedType.user
                          ? Provider.of<AmityUIConfiguration>(context).appColors.userProfileTextColor
                          : Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("Edited",
                        style: TextStyle(
                          color: feedType == FeedType.user
                              ? Provider.of<AmityUIConfiguration>(context).appColors.userProfileTextColor
                              : Colors.grey,
                        )),
                  ],
                )
              : const SizedBox()
        ],
      ),
      trailing: feedType == FeedType.pending && post.postedUser!.userId != AmityCoreClient.getCurrentUser().userId
          ? null
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                postOptions(context),
              ],
            ),
    );
  }
}

class _MsrPostStatistics extends StatelessWidget {
  const _MsrPostStatistics({
    required this.feedType,
    required this.post,
  });
  final FeedType feedType;
  final AmityPost post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(
          height: 20,
        ),
        child: feedType == FeedType.pending
            ? const SizedBox.shrink()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    return post.reactionCount! > 0
                        ? Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: context.msrMaterialColorScheme.tertiaryContainer,
                                child: Icon(
                                  MsrAmityIcon.thumbUpFilled,
                                  color: context.msrMaterialColorScheme.onTertiaryContainer,
                                  size: 12,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                post.reactionCount.toString(),
                                style: context.msrMaterialTheme.textTheme.labelMedium?.copyWith(
                                  color: context.msrMaterialColorScheme.onSurface,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink();
                  }),
                  Builder(builder: (context) {
                    if (post.commentCount! > 1) {
                      return Text(
                        '${post.commentCount} comments',
                        style: context.msrMaterialTheme.textTheme.labelMedium?.copyWith(
                          color: context.msrMaterialColorScheme.onSurface,
                        ),
                      );
                    } else if (post.commentCount! == 0) {
                      return const SizedBox.shrink();
                    } else {
                      return Text(
                        '${post.commentCount} comment',
                        style: context.msrMaterialTheme.textTheme.labelMedium?.copyWith(
                          color: context.msrMaterialColorScheme.onSurface,
                        ),
                      );
                    }
                  })
                ],
              ),
      ),
    );
  }
}

class _PostActions extends StatelessWidget {
  const _PostActions({
    required this.post,
    required this.feedType,
    required this.showAcceptOrRejectButton,
    required this.isFromFeed,
  });
  final AmityPost post;
  final FeedType feedType;
  final bool showAcceptOrRejectButton;
  final bool isFromFeed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: feedType == FeedType.pending
          ? showAcceptOrRejectButton
              ? PendingSectionButton(
                  postId: post.postId!,
                  communityId: (post.target as CommunityTarget).targetCommunityId!,
                )
              : const SizedBox()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MsrReactionWidget(
                  post: post,
                  feedType: feedType,
                ),
                _AddCommentButton(
                  isFromFeed: isFromFeed,
                  post: post,
                  feedType: feedType,
                ),
              ],
            ),
    );
  }
}
