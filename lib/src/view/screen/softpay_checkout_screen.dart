import 'dart:async';
import 'dart:convert';

import 'package:dodomaapp/core/app_color.dart';
import 'package:dodomaapp/core/app_data.dart';
import 'package:dodomaapp/src/view/screen/menu_screen.dart';
import 'package:dodomaapp/src/view/screen/softpay_checkout_frame.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

/// Loads SoftPay checkout_url so the parent can finish the payment.
class SoftPayCheckoutScreen extends StatefulWidget {
  final String executionUrl;
  final String reference;

  const SoftPayCheckoutScreen({
    super.key,
    required this.executionUrl,
    required this.reference,
  });

  String get checkoutUrl => executionUrl;

  @override
  State<SoftPayCheckoutScreen> createState() => _SoftPayCheckoutScreenState();
}

class _SoftPayCheckoutScreenState extends State<SoftPayCheckoutScreen> {
  bool checking = false;
  String? statusNote;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 8), (_) {
      _checkStatus(silent: true);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _openExternal() async {
    final uri = Uri.tryParse(widget.executionUrl);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _checkStatus({bool silent = false}) async {
    if (checking) return;
    if (!silent) {
      setState(() {
        checking = true;
        statusNote = null;
      });
    }
    try {
      final response = await http
          .post(
            Uri.parse('${AppData.url}/payment/status'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({'reference': widget.reference}),
          )
          .timeout(const Duration(seconds: 20));
      final body = jsonDecode(response.body);
      final data = body is Map ? body['data'] : null;
      if (data is Map && data['settled'] == true) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Payment received. Fees have been updated.'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => DashboardScreen()),
          (_) => false,
        );
        return;
      }
      if (!silent && mounted) {
        setState(() {
          statusNote = data is Map
              ? (data['message']?.toString() ?? 'Payment is still pending')
              : 'Payment is still pending';
        });
      }
    } catch (e) {
      if (!silent && mounted) {
        setState(() => statusNote = e.toString());
      }
    } finally {
      if (mounted && !silent) setState(() => checking = false);
    }
  }

  void _done() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => DashboardScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Checkout', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: checking ? null : () => _checkStatus(),
            child: checking
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Text('Check status', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          if (statusNote != null)
            Material(
              color: Colors.amber.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, size: 18),
                    const SizedBox(width: 8),
                    Expanded(child: Text(statusNote!)),
                  ],
                ),
              ),
            ),
          Expanded(
            child: SoftPayCheckoutFrame(url: widget.executionUrl),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _openExternal,
                      child: const Text('Open in browser'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _done,
                      child: const Text('Done'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
