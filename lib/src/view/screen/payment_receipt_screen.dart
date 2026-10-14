import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../core/app_color.dart';
import '../../data/database_helper.dart';
import 'fee_payment_screen.dart';
import 'menu_screen.dart';



class PaymentReceiptScreen extends StatefulWidget {
  final String transactionId;
  const PaymentReceiptScreen(this.transactionId, {Key? key}) : super(key: key);

  @override
  _PaymentReceiptScreenState createState() => _PaymentReceiptScreenState();
}

class _PaymentReceiptScreenState extends State<PaymentReceiptScreen> {
  Map<String, dynamic>? paymentDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDetails();
  }

  Future<void> _fetchDetails() async {
    final trx = await DatabaseHelper.instance.getTransactionById(widget.transactionId);
    setState(() {
      paymentDetails = trx;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("Fees Payments", style: TextStyle(color: Colors.white, fontSize: 18)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FeePaymentHistoryScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : paymentDetails == null
                ? Center(child: Text("No Receipt found."))
                : Column(
                    children: [
                      // Receipt Container
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Payment Receipt",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            // Show name as header, not as a detail
                            if ((paymentDetails!["full_name"] ?? '').isNotEmpty) ...[
                              Center(
                                child: Text(
                                  paymentDetails!["full_name"] ?? '',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 4),
                            ],
                            Center(
                              child: Text(
                                "-------------------------------",
                                style: TextStyle(fontFamily: 'monospace', color: Colors.grey[600], fontSize: 13),
                              ),
                            ),
                            SizedBox(height: 6),
                            ..._buildReceiptRows(paymentDetails!),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: OutlinedButton.icon(
                                icon: Icon(Icons.download, size: 20, color: AppColor.primaryColor),
                                style: OutlinedButton.styleFrom(side: BorderSide(color: AppColor.primaryColor)),
                                onPressed: _downloadReceipt,
                                label: Text('Download', style: TextStyle(color: AppColor.primaryColor)),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Payment Confirmed",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[800]),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  // Redesign for paper style and download
  List<Widget> _buildReceiptRows(Map<String, dynamic> trx) {
    final rows = <Map<String, String>>[{
      "Receipt No": trx["comments"] ?? '',
      "Bank Account": trx["account_number"] ?? '',
      "Amount Paid": "TZS " + (trx["amount"] != null ? NumberFormat('#,##0').format(double.tryParse(trx["amount"].toString()) ?? 0) : ''),
      // "Payment Method": trx["payment_gateway"]?.toString() ?? '',
      "Date Received": trx["date"]?.toString() ?? trx["created_at"]?.toString() ?? '',
      "Status": (trx["printed"] == 1) ? "Printed" : "Confirmed",
    }];
    List<Widget> widgetRows = [];
    rows.first.entries.forEach((entry) {
      widgetRows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(entry.key, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black87)),
              Flexible(child: Text(entry.value, textAlign: TextAlign.right, style: TextStyle(fontFamily: 'monospace', fontSize: 15, color: Colors.black))),
            ],
          ),
        ),
      );
      widgetRows.add(_dashedDivider());
    });
    return widgetRows;
  }

  Widget _dashedDivider() {
    return Row(
      children: List.generate(42, (i) => i.isEven ? Expanded(child: Divider(height: 1, color: Colors.grey[400])) : SizedBox(width: 2)),
    );
  }

  Future<void> _downloadReceipt() async {
    // Requires printing package and proper asset setup
    // import 'package:printing/printing.dart';
    // import 'package:flutter/services.dart' as s;
    if (paymentDetails == null) return;
    final logoBytes = await rootBundle.load('assets/images/stagret.PNG'); // Ensure this asset exists
    final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());
    await Printing.layoutPdf(onLayout: (format) async {
      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Image(logoImage, width: 80, height: 80),
                ),
                pw.SizedBox(height: 6),
                pw.Center(child: pw.Text('Payment Receipt', style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold))),
                pw.SizedBox(height: 8),
                pw.Text(paymentDetails!["full_name"] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13)),
                pw.SizedBox(height: 10),
                ..._buildPdfRows(paymentDetails!),
                pw.SizedBox(height: 15),
                pw.Divider(),
                pw.Center(
                  child: pw.Text('Payment Confirmed', style: pw.TextStyle(color: PdfColors.green, fontWeight: pw.FontWeight.bold)),
                ),
              ],
            );
          },
        ),
      );
      return pdf.save();
    });
  }

  List<pw.Widget> _buildPdfRows(Map<String, dynamic> trx) {
    final pdfRows = <Map<String, String>>[{
      "Receipt No": trx["transaction_id"] ?? '',
      "Bank Account": trx["account_number"] ?? '',
      "Amount Paid": "TZS " + (trx["amount"] != null ? NumberFormat('#,##0').format(double.tryParse(trx["amount"].toString()) ?? 0) : ''),
      // "Payment Method": trx["payment_gateway"]?.toString() ?? '',
      "Date Received": trx["date"]?.toString() ?? trx["created_at"]?.toString() ?? '',
      "Status": (trx["printed"] == 1) ? "Printed" : "Confirmed",
    }];
    List<pw.Widget> widgets = [];
    pdfRows.first.entries.forEach((entry) {
      widgets.add(
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(entry.key, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
            pw.Text(entry.value, style: pw.TextStyle(font: pw.Font.courier(), fontSize: 11)),
          ],
        ),
      );
      widgets.add(pw.Divider());
    });
    return widgets;
  }
}
