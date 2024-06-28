import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:python_basics/core/extensions/build_context_extension.dart';
import 'package:python_basics/features/certificate/presentation/preview_screen.dart';

import '../../../core/utils/security_utils.dart';
import '../../../core/widgets/custom_textfield.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 5/26/2024, Sunday

final userNameProvider = StateProvider((ref) => '');
final userDOBProvider = StateProvider((ref) => '');
final userCertificateIDProvider = StateProvider((ref) => '');

class CandidateNameSheet extends ConsumerStatefulWidget {
  const CandidateNameSheet({super.key});

  @override
  ConsumerState<CandidateNameSheet> createState() => _CandidateNameSheetState();
}

class _CandidateNameSheetState extends ConsumerState<CandidateNameSheet> {
  late final TextEditingController _userNameController;
  late final TextEditingController _userDOBController;

  @override
  void initState() {
    _userNameController = TextEditingController(
      text: ref.read(userNameProvider),
    );
    _userDOBController = TextEditingController(
      text: ref.read(userDOBProvider),
    );
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userDOBController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
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
          Row(
            children: [
              const Text(
                'Please fill the form',
                style: TextStyle(fontSize: 18),
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.close),
                  ))
            ],
          ),
          const Spacer(),
          CustomTextField(
            controller: _userNameController,
            labelText: 'UserName',
            isEnabled: false,
          ),
          const SizedBox(height: 2),
          InkWell(
            onTap: () async {
              var date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              );
              if (date != null && context.mounted) {
                ref.read(userDOBProvider.notifier).state =
                    DateFormat('yyyy-MM-dd').format(date);
                _userDOBController.text = DateFormat('yyyy-MM-dd').format(date);
              }
            },
            child: CustomTextField(
              controller: _userDOBController,
              isEnabled: false,
              labelText: 'Date of Birth',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    Navigator.pop(context, false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    await Future.delayed(const Duration(milliseconds: 300));
                    if (context.mounted) {
                      if (ref.read(userDOBProvider).isNotEmpty) {
                        Navigator.pop(context);
                        ref.read(userCertificateIDProvider.notifier).state =
                            SecurityUtils.encodeString(
                                'Basic${ref.read(userNameProvider)}@${ref.read(userDOBProvider)}');
                        await Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const PreviewScreen();
                        }));
                      } else {
                        Navigator.pop(context);
                        context.showSnackBar(
                          'Please enter your Date of Birth',
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
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
