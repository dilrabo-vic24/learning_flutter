import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:quran_app_revision/core/utils/app_colors.dart';
import 'package:quran_app_revision/core/utils/custom_text_style.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/all_ayah_model.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/ayah_entity.dart';
import 'package:quran_app_revision/feature/ayah/presentation/widgets/audio_helper.dart';

class AyahBySurahWidget extends StatefulWidget {
  final AyahEntity ayahEntity;
  final int index;
  final AllAyahEntity allAyahEntity;
  const AyahBySurahWidget({
    super.key,
    required this.ayahEntity,
    required this.index,
    required this.allAyahEntity,
  });

  @override
  State<AyahBySurahWidget> createState() => _AyahBySurahWidgetState();
}

class _AyahBySurahWidgetState extends State<AyahBySurahWidget> {
  late final AudioHelper audioHelper;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioHelper = AudioHelper();
  }

  @override
  void dispose() {
    audioHelper.dispose();
    super.dispose();
  }

  Future<void> togglePlayPause({required String audioUrl}) async {
    final isPlayingNew = await audioHelper.togglePlayPause(audioUrl: audioUrl);
    setState(() {
      isPlaying = isPlayingNew;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 7.h,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.blueDark, AppColors.blueLight],
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundColor: AppColors.mianTextColor,
                child: customTextStyle(
                    text: widget.index.toString(), textColor: AppColors.white),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, color: AppColors.mianTextColor)),
              IconButton(
                  onPressed: () {
                    togglePlayPause(audioUrl: widget.ayahEntity.audio!);
                  },
                  icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                      color: AppColors.mianTextColor)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_border,
                      color: AppColors.mianTextColor))
            ],
          ),
        ),
        customTextStyle(
            text: widget.ayahEntity.text!,
            textAlign: TextAlign.right,
            textColor: AppColors.white,
            fontSize: 30.sp),
        customTextStyle(
            text: widget.allAyahEntity.text!,
            fontSize: 18.sp,
            textColor: AppColors.white,
            textAlign: TextAlign.left),
        Divider(),
      ],
    );
  }
}
