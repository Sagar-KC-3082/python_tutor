import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/core/constants/color_constants.dart';
import 'package:python_basics/core/local_repository/local_repository.dart';
import 'package:python_basics/core/static_data/chapter_list.dart';
import 'package:python_basics/features/homescreen/presentation/first_time_installed_sheet.dart';
import 'package:python_basics/features/homescreen/presentation/widgets/chapter_widget.dart';
import 'package:python_basics/features/quiz/presentation/candidate_name_sheet.dart';
import 'package:python_basics/features/quiz/presentation/final_quiz_screen.dart';

import '../../../core/widgets/custom_container.dart';
import '../../quiz/presentation/quit_quiz_sheet.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    fetchUserCurrentChapterLevel();
    super.initState();
  }

  Future<void> fetchUserCurrentChapterLevel() async {
    final isFirstTimeInstalled = await LocalRepository.fetchBoolean(
      LocalRepository.isFirstTimeInstalled,
    );
    if (isFirstTimeInstalled && context.mounted) {
      showModalBottomSheet(
          isScrollControlled: true,
          isDismissible: false,
          enableDrag: true,
          context: context,
          builder: (context) {
            return const FirstTimeInstalledSheet();
          });
    } else {
      final userName = await LocalRepository.fetchString(
        LocalRepository.userName,
      );
      ref.read(userNameProvider.notifier).state = userName;
    }

    final value = await LocalRepository.fetchInteger(
      LocalRepository.userCurrentChapterIndex,
    );
    ref.read(userCurrentChapterIndexProvider.notifier).state = value;
  }

  @override
  Widget build(BuildContext context) {
    final userCurrentChapterState = ref.watch(userCurrentChapterIndexProvider);
    return WillPopScope(
      onWillPop: () async {
        await showModalBottomSheet(
            scrollControlDisabledMaxHeightRatio: 0.18,
            isScrollControlled: false,
            enableDrag: false,
            context: context,
            builder: (context) {
              return const QuitQuizSheet(title: 'Do you to close the App ?');
            });
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConstant.scaffoldColor,
        appBar: AppBar(
          backgroundColor: ColorConstant.primaryColor,
          centerTitle: true,
          title: const Text(
            'Python Basics',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: StaticData.chapterList.length,
                  itemBuilder: (context, index) {
                    return ChapterWidget(
                      chapterResponse: StaticData.chapterList[index],
                      chapterIndex: index,
                      userChapterIndex: userCurrentChapterState,
                    );
                  }),
              InkWell(
                onTap: () {
                  if (userCurrentChapterState >=
                      StaticData.chapterList.length) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const FinalQuizScreen();
                    }));
                  }
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: CustomContainer(
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Get Certificate',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        userCurrentChapterState >= StaticData.chapterList.length
                            ? Icons.check_circle
                            : Icons.lock,
                        size: 20,
                        color: userCurrentChapterState >=
                                StaticData.chapterList.length
                            ? Colors.green
                            : Colors.black,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
