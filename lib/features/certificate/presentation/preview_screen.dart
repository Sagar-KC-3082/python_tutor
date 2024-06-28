import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:python_basics/features/quiz/presentation/candidate_name_sheet.dart';

import '../../../core/constants/color_constants.dart';
import 'download_pdf_widget.dart';
import 'download_sheet.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 5/24/2024, Friday

final isLoadingProvider = StateProvider((ref) => false);

class PreviewScreen extends ConsumerStatefulWidget {
  const PreviewScreen({
    super.key,
  });

  @override
  ConsumerState<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends ConsumerState<PreviewScreen> {
  GlobalKey globalKey = GlobalKey();
  late ui.Image image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.scaffoldColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        centerTitle: true,
        title: const Text(
          'Preview Certificate',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Spacer(),
            RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                height: 530,
                width: MediaQuery.sizeOf(context).width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/boundary.png',
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        top: 40,
                        left: 28,
                        right: 28,
                        child: Column(
                          children: [
                            const Text(
                              'CERTIFICATE ',
                              textScaler: TextScaler.linear(1),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontFamily: 'Sarif'),
                            ),
                            const Text(
                              'OF COMPLETION ',
                              textScaler: TextScaler.linear(1),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'SourceSarif'),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'THIS CERTIFICATE IS \n PROUDLY PRESENTED TO  ',
                              textAlign: TextAlign.center,
                              textScaler: TextScaler.linear(1),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'SourceSarif'),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: Text(
                                ref.read(userNameProvider),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontFamily: 'Sarif',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'For completing Computer Basic Course by Technology Channel with an outstanding track record',
                              textAlign: TextAlign.center,
                              textScaler: TextScaler.linear(1),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'SourceSarif'),
                            ),
                            const SizedBox(height: 36),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 48,
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            DateFormat('yyyy-MM-dd')
                                                .format(DateTime.now()),
                                            textScaler:
                                                const TextScaler.linear(1),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'SourceSarif'),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: Divider(
                                          color: Colors.black,
                                          thickness: 0.7,
                                        ),
                                      ),
                                      const Text(
                                        'DATE OF ISSUE',
                                        textAlign: TextAlign.center,
                                        textScaler: TextScaler.linear(1),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                            fontFamily: 'SourceSarif'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Image.asset(
                                    'assets/medal.png',
                                    height: 48,
                                    width: 48,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 48,
                                        width: 48,
                                        child: Image.asset(
                                          'assets/signature.png',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: Divider(
                                          color: Colors.black,
                                          thickness: 0.7,
                                        ),
                                      ),
                                      const Text(
                                        'Bishworaj Poudel',
                                        textAlign: TextAlign.left,
                                        textScaler: TextScaler.linear(1),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                            fontFamily: 'SourceSarif'),
                                      ),
                                      const Text(
                                        'Founder',
                                        textScaler: TextScaler.linear(1),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 8,
                                            fontFamily: 'SourceSarif'),
                                      ),
                                      const Text(
                                        'Technology Channel',
                                        textAlign: TextAlign.left,
                                        textScaler: TextScaler.linear(1),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 8,
                                            fontFamily: 'SourceSarif'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 40,
                      child: Text(
                        ref.read(userCertificateIDProvider),
                        textAlign: TextAlign.center,
                        textScaler: const TextScaler.linear(1),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 8,
                          fontFamily: 'SourceSarif',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Consumer(builder: (context, _, __) {
              final isLoading = ref.watch(isLoadingProvider);
              return InkWell(
                onTap: () async {
                  if (isLoading) {
                    return;
                  }
                  var result = await showModalBottomSheet(
                      scrollControlDisabledMaxHeightRatio: 0.18,
                      isScrollControlled: false,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return const DownloadSheet();
                      });
                  if (result == true) {
                    _saveImage();
                  } else if (result == false && context.mounted) {
                    if (context.mounted) {
                      await _savePdf(context);
                    }
                  }
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 48,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Text(
                      isLoading ? 'Saving ...' : 'Save',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 32)
          ],
        ),
      ),
    );
  }

  Future<void> _saveImage() async {
    try {
      ref.read(isLoadingProvider.notifier).state = true;
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      await Future.delayed(const Duration(milliseconds: 200));
      ui.Image image = await boundary.toImage(pixelRatio: 2);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      Uint8List pngBytes = byteData!.buffer.asUint8List();
      Directory root = await getApplicationDocumentsDirectory();
      var file =
          await File('${root.path}/certificate-${Random().nextInt(1000)}.png')
              .writeAsBytes(pngBytes);
      await Gal.putImage(file.path);

      if (context.mounted) {
        ref.read(isLoadingProvider.notifier).state = false;
        _showSuccessSnackBar(context, false);
      }
    } catch (e) {
      ref.read(isLoadingProvider.notifier).state = false;

      if (context.mounted) {
        _showFailureSnackBar(context, false);
      }
    }
  }

  Future<int> _getDeviceSdkVersion() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final androidInfo = await deviceInfoPlugin.androidInfo;
    return androidInfo.version.sdkInt;
  }

  Future<void> _savePdf(BuildContext context) async {
    ref.read(isLoadingProvider.notifier).state = true;

    try {
      int deviceSdkVersion =
          Platform.isAndroid ? await _getDeviceSdkVersion() : 0;

      var permission = Platform.isAndroid
          ? (deviceSdkVersion > 32 ? Permission.photos : Permission.storage)
          : Permission.photos;

      PermissionStatus permissionStatus = await permission.status;
      if (!permissionStatus.isGranted) {
        permissionStatus = await permission.request();
      }
      if (!permissionStatus.isGranted && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Please grant storage permission for saving the Certificate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )));
      } else {
        final pdf = pw.Document();
        await Future.delayed(const Duration(milliseconds: 200));
        if (context.mounted) {
          var pdfData = await getUIForPdf(
            context,
            ref.read(userNameProvider),
            ref.read(userCertificateIDProvider),
          );
          pdf.addPage(pdfData);
        }
        String downloadPath = await _getDownloadDirectory();
        final file = File(downloadPath);
        await file.writeAsBytes(await pdf.save());

        ref.read(isLoadingProvider.notifier).state = false;

        if (context.mounted) {
          _showSuccessSnackBar(context, true);
        }
      }
    } catch (e) {
      ref.read(isLoadingProvider.notifier).state = false;
      if (context.mounted) {
        _showFailureSnackBar(context, true);
      }
    }
  }

  Future<String> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      final tempDir = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS,
      );
      return '$tempDir/Certificate-${Random().nextInt(1000)}.pdf';
    } else {
      final documents = await getApplicationDocumentsDirectory();
      return '${documents.path}/Certificate-${Random().nextInt(1000)}.pdf';
    }
  }
}

void _showSuccessSnackBar(BuildContext context, bool isForPdf) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      margin: const EdgeInsets.only(
        bottom: 16,
        right: 8,
        left: 8,
      ),
      content: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.green),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${isForPdf ? 'PDF' : 'Image'} has been saved to Download Folder. Please check your storage',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ))));
}

void _showFailureSnackBar(
  BuildContext context,
  bool isForPdf,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: const EdgeInsets.only(
        bottom: 16,
        right: 8,
        left: 8,
      ),
      content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.warning,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'There was some error while saving the ${isForPdf ? 'PDF' : 'image'}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ))));
}
