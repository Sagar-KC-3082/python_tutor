import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:flutter/cupertino.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 5/26/2024, Sunday

getUIForPdf(
  BuildContext context,
  String candidateName,
  String certificateId,
) async {
  final font = await rootBundle.load("assets/fonts/source-sarif.ttf");
  final font1 = await rootBundle.load("assets/fonts/sarif.ttf");
  final frameImage = await rootBundle.load("assets/boundary.png");
  final medalImage = await rootBundle.load("assets/medal.png");
  final signatureImage = await rootBundle.load("assets/signature.png");
  final ttf = pw.Font.ttf(font);
  final ttf1 = pw.Font.ttf(font1);

  final frameImageBytes = frameImage.buffer.asUint8List();
  final medalImageBytes = medalImage.buffer.asUint8List();
  final signatureImageBytes = signatureImage.buffer.asUint8List();

  return pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context _) {
        return pw.Align(
            alignment: pw.Alignment.topCenter,
            child: pw.Container(
                color: PdfColor.fromHex('#ffffff'),
                height: 500,
                width: MediaQuery.sizeOf(context).width,
                child: pw.Stack(
                  alignment: pw.Alignment.center,
                  children: [
                    pw.Image(
                      pw.MemoryImage(frameImageBytes),
                      height: 500,
                      width: MediaQuery.sizeOf(context).width,
                      fit: pw.BoxFit.fill,
                    ),
                    pw.Positioned(
                        top: 52,
                        left: 28,
                        right: 28,
                        child: pw.Column(
                          children: [
                            pw.Text(
                              'CERTIFICATE ',
                              textScaleFactor: 1,
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex('#000000'),
                                  fontSize: 30,
                                  fontWeight: pw.FontWeight.normal,
                                  font: ttf1),
                            ),
                            pw.Text(
                              'OF COMPLETION ',
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex('#000000'),
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.normal,
                                  font: ttf),
                            ),
                            pw.SizedBox(height: 16),
                            pw.Text(
                              'THIS CERTIFICATE IS \n PROUDLY PRESENTED TO  ',
                              textAlign: pw.TextAlign.center,
                              textScaleFactor: 1,
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex('#000000'),
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.normal,
                                  font: ttf),
                            ),
                            pw.SizedBox(height: 24),
                            pw.SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: pw.Text(
                                candidateName,
                                maxLines: 2,
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  color: PdfColor.fromHex('#000000'),
                                  fontSize: 32,
                                  fontWeight: pw.FontWeight.bold,
                                  font: ttf1,
                                ),
                              ),
                            ),
                            pw.Text(
                              'For completing Computer Basic Course by Technology Channel with an outstanding track record',
                              textAlign: pw.TextAlign.center,
                              textScaleFactor: 1,
                              style: pw.TextStyle(
                                  color: PdfColor.fromHex('#000000'),
                                  fontSize: 14,
                                  font: ttf),
                            ),
                            pw.SizedBox(height: 24),
                            pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Expanded(
                                  child: pw.Column(
                                    children: [
                                      pw.SizedBox(height: 16),
                                      pw.Text(
                                        DateFormat('yyyy-MM-dd')
                                            .format(DateTime.now()),
                                        textScaleFactor: 1,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(
                                          color: PdfColor.fromHex('#000000'),
                                          fontSize: 14,
                                          fontWeight: pw.FontWeight.bold,
                                          font: ttf,
                                        ),
                                      ),
                                      pw.Padding(
                                        padding: const pw.EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: pw.Divider(
                                          color: PdfColor.fromHex('#000000'),
                                          thickness: 0.7,
                                        ),
                                      ),
                                      pw.Text(
                                        'DATE OF ISSUE',
                                        textScaleFactor: 1,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          font: ttf,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                pw.SizedBox(width: 4),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.only(top: 16),
                                  child: pw.Image(
                                    pw.MemoryImage(medalImageBytes),
                                    height: 48,
                                    width: 48,
                                  ),
                                ),
                                pw.SizedBox(width: 4),
                                pw.Expanded(
                                  child: pw.Column(
                                    children: [
                                      pw.SizedBox(
                                        height: 48,
                                        width: 48,
                                        child: pw.Image(
                                          pw.MemoryImage(signatureImageBytes),
                                        ),
                                      ),
                                      pw.Padding(
                                        padding: const pw.EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: pw.Divider(
                                          color: PdfColor.fromHex('#000000'),
                                          thickness: 0.7,
                                        ),
                                      ),
                                      pw.Text(
                                        'Bishworaj Poudel',
                                        textAlign: pw.TextAlign.center,
                                        textScaleFactor: 1,
                                        style: pw.TextStyle(
                                            // color: Colors.grey,
                                            fontSize: 10,
                                            font: ttf),
                                      ),
                                      pw.Text(
                                        'Founder',
                                        textAlign: pw.TextAlign.center,
                                        textScaleFactor: 1,
                                        style: pw.TextStyle(
                                            // color: Colors.grey,
                                            fontSize: 8,
                                            font: ttf),
                                      ),
                                      pw.Text(
                                        'Technology Channel',
                                        textAlign: pw.TextAlign.center,
                                        textScaleFactor: 1,
                                        style: pw.TextStyle(
                                            // color: Colors.grey,
                                            fontSize: 8,
                                            font: ttf),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    pw.Positioned(
                      left: 0,
                      right: 0,
                      bottom: 40,
                      child: pw.Text(
                        certificateId,
                        textAlign: pw.TextAlign.center,
                        textScaleFactor: 1,
                        style: pw.TextStyle(
                          fontSize: 8,
                          font: ttf,
                        ),
                      ),
                    )
                  ],
                )));
      });
}
