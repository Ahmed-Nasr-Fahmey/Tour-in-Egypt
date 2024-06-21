import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/reels/presentation/views/widgets/video_player_card.dart';

class ReelsView extends StatefulWidget {
  const ReelsView({super.key});
  static const String routeName = 'ReelsView';

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    List<Widget> reels = [
      const VideoPlayerCard(
          videoUrl:
              'https://video-lhr8-2.xx.fbcdn.net/o1/v/t2/f1/m82/6541CD253F8BB3D1220492643DCF8A89_video_dashinit.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6Im9lcF9zZCJ9&_nc_ht=video-lhr8-2.xx.fbcdn.net&_nc_cat=108&vs=4ec4791edea17c07&_nc_vs=HBksFQIYT2lnX3hwdl9yZWVsc19wZXJtYW5lbnRfcHJvZC82NTQxQ0QyNTNGOEJCM0QxMjIwNDkyNjQzRENGOEE4OV92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dOVTNxaFJOQVIwS3lGNERBTGg5VTBsWl9mVlRicV9FQUFBRhUCAsgBAEsHiBJwcm9ncmVzc2l2ZV9yZWNpcGUBMQ1zdWJzYW1wbGVfZnBzABB2bWFmX2VuYWJsZV9uc3ViACBtZWFzdXJlX29yaWdpbmFsX3Jlc29sdXRpb25fc3NpbQAoY29tcHV0ZV9zc2ltX29ubHlfYXRfb3JpZ2luYWxfcmVzb2x1dGlvbgAddXNlX2xhbmN6b3NfZm9yX3ZxbV91cHNjYWxpbmcAEWRpc2FibGVfcG9zdF9wdnFzABUAJQAcjBdAAAAAAAAAABERAAAAJo6wqtzLongVAigCQzMYC3Z0c19wcmV2aWV3HBdAHIgxJul41RgSZGFzaF9iYXNlbGluZV8yX3YxEgAYGHZpZGVvcy52dHMuY2FsbGJhY2sucHJvZDgSVklERU9fVklFV19SRVFVRVNUGwqIFW9lbV90YXJnZXRfZW5jb2RlX3RhZwZvZXBfc2QTb2VtX3JlcXVlc3RfdGltZV9tcwEwDG9lbV9jZmdfcnVsZQ9zZF9pZ19yZWVsc194cHYTb2VtX3JvaV9yZWFjaF9jb3VudAEwEW9lbV9pc19leHBlcmltZW50AAxvZW1fdmlkZW9faWQQMTkzMzU4NzA4MzY4MTY3MBJvZW1fdmlkZW9fYXNzZXRfaWQQMjcxNzQzMzc3NTA2NTYwMxVvZW1fdmlkZW9fcmVzb3VyY2VfaWQPMjY0NDc3MDY5MzY0MjMxHG9lbV9zb3VyY2VfdmlkZW9fZW5jb2RpbmdfaWQQMTI2MjU2OTAwNzc5OTY5Ng52dHNfcmVxdWVzdF9pZAAlAhwAJcQBGwaIAXMEMzMyMAJjZAoyMDIzLTA1LTExA2FwcAlJbnN0YWdyYW0CY3QMSUdfUkVFTFNfWFBWE29yaWdpbmFsX2R1cmF0aW9uX3MINy4xMzMzMzMCdHMUcHJvZ3Jlc3NpdmVfb3JkZXJpbmcA&ccb=9-4&oh=00_AfBjAoR8mbhDrc5efxzer_jUSGF3XFDQI8ZfCfTLa9ps8g&oe=65E95D81&_nc_sid=1d576d&_nc_rid=006141184982322&_nc_store_type=1'),
      const VideoPlayerCard(
          videoUrl:
              'https://video-lhr8-1.xx.fbcdn.net/v/t42.1790-2/429147038_411927848010718_7418219349692400491_n.mp4?_nc_cat=107&ccb=1-7&_nc_sid=55d0d3&efg=eyJybHIiOjEwMDksInJsYSI6NjEzLCJ2ZW5jb2RlX3RhZyI6InN2ZV9zZCJ9&_nc_ohc=IxYA6zTxuIQAX_7yZpb&rl=1009&vabr=561&_nc_ht=video-lhr8-1.xx&edm=AGo2L-IEAAAA&oh=00_AfBpKOLcyQq-VWO2pbVs8pU75y3uWOA5ga_ozFkaBGU5nQ&oe=65EBA42A'),
      const VideoPlayerCard(
          videoUrl:
              'https://video-lhr8-2.xx.fbcdn.net/v/t42.1790-2/414851181_3828589980708810_3140198959121236244_n.mp4?_nc_cat=101&ccb=1-7&_nc_sid=55d0d3&efg=eyJybHIiOjgwNiwicmxhIjo3MjMsInZlbmNvZGVfdGFnIjoic3ZlX3NkIn0%3D&_nc_ohc=-7Cd8RblpUYAX96yB-q&rl=806&vabr=448&_nc_ht=video-lhr8-2.xx&edm=AGo2L-IEAAAA&oh=00_AfA3YX5MNLZFEibMPXoOCrNFVRhqW_nuAR_z2Nk7JQTMvg&oe=65EC4D21'),
      const VideoPlayerCard(
          videoUrl:
              'https://video-mia3-1.xx.fbcdn.net/o1/v/t2/f1/m69/GG7ATBIEOnVjtvgBABXCQC9QrMVKbq_EAAAF.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6Im9lcF9zZCJ9&_nc_ht=video-mia3-1.xx.fbcdn.net&_nc_cat=106&strext=1&vs=5550ce509e3fb21f&_nc_vs=HBksFQIYOnBhc3N0aHJvdWdoX2V2ZXJzdG9yZS9HRzdBVEJJRU9uVmp0dmdCQUJYQ1FDOVFyTVZLYnFfRUFBQUYVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dDTEhPUkk1dE1Mc2hUc0NBRUxXSUVWeHJGVk1icV9FQUFBRhUCAsgBAEsHiBJwcm9ncmVzc2l2ZV9yZWNpcGUBMQ1zdWJzYW1wbGVfZnBzABB2bWFmX2VuYWJsZV9uc3ViACBtZWFzdXJlX29yaWdpbmFsX3Jlc29sdXRpb25fc3NpbQAoY29tcHV0ZV9zc2ltX29ubHlfYXRfb3JpZ2luYWxfcmVzb2x1dGlvbgAddXNlX2xhbmN6b3NfZm9yX3ZxbV91cHNjYWxpbmcAEWRpc2FibGVfcG9zdF9wdnFzABUAJQAcjBdAAAAAAAAAABERAAAAJrqp5%2Bmm0a8BFQIoAkMzGAt2dHNfcHJldmlldxwXQCF3S8an754YEmRhc2hfYmFzZWxpbmVfMl92MRIAGBh2aWRlb3MudnRzLmNhbGxiYWNrLnByb2Q4ElZJREVPX1ZJRVdfUkVRVUVTVBsKiBVvZW1fdGFyZ2V0X2VuY29kZV90YWcGb2VwX3NkE29lbV9yZXF1ZXN0X3RpbWVfbXMBMAxvZW1fY2ZnX3J1bGUPc2RfaWdfcmVlbHNfeHB2E29lbV9yb2lfcmVhY2hfY291bnQBMBFvZW1faXNfZXhwZXJpbWVudAAMb2VtX3ZpZGVvX2lkEDMzNzQ2NDg0NTYxOTEwOTISb2VtX3ZpZGVvX2Fzc2V0X2lkDzYwMjA2NjA2NDkwMDQyNBVvZW1fdmlkZW9fcmVzb3VyY2VfaWQPMzg2MjI1ODUwMzQ2MDc3HG9lbV9zb3VyY2VfdmlkZW9fZW5jb2RpbmdfaWQPNzYxODAwNzg4NDE5MTY3DnZ0c19yZXF1ZXN0X2lkACUCHAAlxAEbBogBcwQ3ODYxAmNkCjIwMjItMDktMTQDYXBwCUluc3RhZ3JhbQJjdAxJR19SRUVMU19YUFYTb3JpZ2luYWxfZHVyYXRpb25fcwg4LjcyODM0NQJ0cxRwcm9ncmVzc2l2ZV9vcmRlcmluZwA%3D&ccb=9-4&oh=00_AfB86NVvIzK-2v3OF0X-M7I2Sl17QSDmhtZhucTyWpTdVg&oe=65E91432&_nc_sid=1d576d&_nc_rid=269340365125185&_nc_store_type=1'),
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.vertical,
            controller: controller,
            children: reels,
          ),
          const SizedBox(
            height: 60,
            child: CustomMainAppBar(
              hasBackgroundColor: false,
              hasBackIcon: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: ConstIcons.ellipsisIcon,
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
