/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/28/2024, Friday

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:python_basics/core/extensions/build_context_extension.dart';
import 'package:python_basics/core/local_repository/local_repository.dart';
import 'package:python_basics/features/certificate/presentation/preview_screen.dart';
import 'package:python_basics/features/quiz/presentation/candidate_name_sheet.dart';

import '../../../core/utils/security_utils.dart';
import '../../../core/widgets/custom_textfield.dart';

class FirstTimeInstalledSheet extends ConsumerStatefulWidget {
  const FirstTimeInstalledSheet({super.key});

  @override
  ConsumerState<FirstTimeInstalledSheet> createState() =>
      _FirstTimeInstalledSheetState();
}

class _FirstTimeInstalledSheetState
    extends ConsumerState<FirstTimeInstalledSheet> {
  late final TextEditingController _userNameController;

  @override
  void initState() {
    _userNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        height: 210,
        margin: MediaQuery.of(context).viewInsets,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  'Please fill the form',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
              ],
            ),
            const Spacer(),
            CustomTextField(
              controller: _userNameController,
              labelText: 'UserName',
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                FocusScope.of(context).unfocus();
                await Future.delayed(const Duration(milliseconds: 300));
                if (context.mounted) {
                  if (_userNameController.text.isNotEmpty) {
                    Navigator.pop(context);
                    ref.read(userNameProvider.notifier).state =
                        _userNameController.text.trim();
                    LocalRepository.saveBoolean(
                      LocalRepository.isFirstTimeInstalled,
                      false,
                    );
                    LocalRepository.saveString(
                      LocalRepository.userName,
                      _userNameController.text.trim(),
                    );
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
