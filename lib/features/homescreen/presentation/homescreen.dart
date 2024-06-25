import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/core/constants/color_constants.dart';
import 'package:python_basics/core/static_data/chapter_list.dart';
import 'package:python_basics/features/homescreen/presentation/widgets/chapter_widget.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        centerTitle: true,
        title: const Text(
          'Python Basics',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: StaticData.chapterList.length,
            itemBuilder: (context, index) {
              return ChapterWidget(
                chapterResponse: StaticData.chapterList[index],
                index: index,
              );
            }),
      ),
    );
  }
}
