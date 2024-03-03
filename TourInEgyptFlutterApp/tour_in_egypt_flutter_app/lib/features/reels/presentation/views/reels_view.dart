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
              'https://scontent-iad3-2.xx.fbcdn.net/v/t50.33967-16/421131280_417868190666339_1737204495941361716_n.mp4?_nc_cat=109&ccb=1-7&_nc_sid=55d0d3&efg=eyJybHIiOjEzNzMsInJsYSI6NTEyLCJ2ZW5jb2RlX3RhZyI6ImFzaWNfaHExX3NkX3Byb2dyZXNzaXZlIn0%3D&_nc_ohc=uTOWkCURNIwAX96sNEN&rl=1373&vabr=763&_nc_ht=scontent-iad3-2.xx&edm=AGo2L-IEAAAA&oh=00_AfCVA4E4Ws8meYCIIc7lEJgTMqowSoTPLPF--QdUXuQq9A&oe=65E8C0D5'),
      const VideoPlayerCard(
          videoUrl:
              'https://video-lax3-2.xx.fbcdn.net/v/t42.1790-2/429147038_411927848010718_7418219349692400491_n.mp4?_nc_cat=107&ccb=1-7&_nc_sid=55d0d3&efg=eyJybHIiOjEwMDksInJsYSI6NjEzLCJ2ZW5jb2RlX3RhZyI6InN2ZV9zZCJ9&_nc_ohc=LHc9XllwVuwAX9vgURW&rl=1009&vabr=561&_nc_ht=video-lax3-2.xx&edm=AGo2L-IEAAAA&oh=00_AfDBlLk6QWHzw_1Pupa_Qknr2API5pxPGomoHPPJZPW_mg&oe=65E7AFAA'),
      const VideoPlayerCard(
          videoUrl:
              'https://video-atl3-2.xx.fbcdn.net/v/t42.1790-2/371038910_326632659899192_3802790204730119249_n.mp4?_nc_cat=102&ccb=1-7&_nc_sid=55d0d3&efg=eyJybHIiOjEzNTAsInJsYSI6MTI0MSwidmVuY29kZV90YWciOiJzdmVfc2QifQ%3D%3D&_nc_ohc=7-xsdMWtOEgAX8GqSbM&rl=1350&vabr=750&_nc_ht=video-atl3-2.xx&edm=AGo2L-IEAAAA&oh=00_AfDHEjlFtYYS1iCe4_VDaMPa_WyaY6SxDDVG9hYv0jI6hg&oe=65E8436D'),
      const VideoPlayerCard(
          videoUrl:
              'https://video-lga3-1.xx.fbcdn.net/o1/v/t2/f1/m82/AD4DBF6616B7C3CDA9F7DFAB2CEC92AE_video_dashinit.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6Im9lcF9zZCJ9&_nc_ht=video-lga3-1.xx.fbcdn.net&_nc_cat=101&vs=979ca5961a2ac0b7&_nc_vs=HBksFQIYT2lnX3hwdl9yZWVsc19wZXJtYW5lbnRfcHJvZC9BRDREQkY2NjE2QjdDM0NEQTlGN0RGQUIyQ0VDOTJBRV92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dPVjB3UktHam9KZzhPd0NBSGFaeHl1NGt1b2NicV9FQUFBRhUCAsgBAEsHiBJwcm9ncmVzc2l2ZV9yZWNpcGUBMQ1zdWJzYW1wbGVfZnBzABB2bWFmX2VuYWJsZV9uc3ViACBtZWFzdXJlX29yaWdpbmFsX3Jlc29sdXRpb25fc3NpbQAoY29tcHV0ZV9zc2ltX29ubHlfYXRfb3JpZ2luYWxfcmVzb2x1dGlvbgAddXNlX2xhbmN6b3NfZm9yX3ZxbV91cHNjYWxpbmcAEWRpc2FibGVfcG9zdF9wdnFzABUAJQAcjBdAAAAAAAAAABERAAAAJsbghqjhzrEEFQIoAkMzGAt2dHNfcHJldmlldxwXQDzEGJN0vGoYEmRhc2hfYmFzZWxpbmVfMl92MRIAGBh2aWRlb3MudnRzLmNhbGxiYWNrLnByb2Q4ElZJREVPX1ZJRVdfUkVRVUVTVBsKiBVvZW1fdGFyZ2V0X2VuY29kZV90YWcGb2VwX3NkE29lbV9yZXF1ZXN0X3RpbWVfbXMBMAxvZW1fY2ZnX3J1bGUPc2RfaWdfcmVlbHNfeHB2E29lbV9yb2lfcmVhY2hfY291bnQBMBFvZW1faXNfZXhwZXJpbWVudAAMb2VtX3ZpZGVvX2lkEDEzNDI5NTE0OTY0NDQwMzQSb2VtX3ZpZGVvX2Fzc2V0X2lkEDE2NDA4NjA5NDk2NDM5OTkVb2VtX3ZpZGVvX3Jlc291cmNlX2lkEDEyMzUwMDUxMzcyNzkwMTEcb2VtX3NvdXJjZV92aWRlb19lbmNvZGluZ19pZA82ODAxMzIwMDY3NTk0NDAOdnRzX3JlcXVlc3RfaWQAJQIcACXEARsGiAFzBDQxMzICY2QKMjAyMi0xMS0wNQNhcHAJSW5zdGFncmFtAmN0DElHX1JFRUxTX1hQVhNvcmlnaW5hbF9kdXJhdGlvbl9zBjI4Ljg4NgJ0cxRwcm9ncmVzc2l2ZV9vcmRlcmluZwA%3D&ccb=9-4&oh=00_AfCLOo9D_w_hz9laJsDG9-YODB4oWMjMqm7LxvVm2Ksn6w&oe=65E4D174&_nc_sid=1d576d&_nc_rid=996854434696717&_nc_store_type=1'),
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
