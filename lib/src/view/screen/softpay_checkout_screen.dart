import 'dart:async';
import 'dart:convert';

import 'package:dodomaapp/core/app_color.dart';
import 'package:dodomaapp/core/app_data.dart';
import 'package:dodomaapp/src/view/screen/menu_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

/// SoftPay Gate sets X-Frame-Options: deny, so checkout cannot run in an
/// iframe. Open the hosted page in a new browser tab and poll status here.
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

class _SoftPayCheckoutScreenState extends State<SoftPayCheckoutScreen>
    with WidgetsBindingObserver {
  bool checking = false;
  bool opening = false;
  String? statusNote;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openCheckout();
    });
    _timer = Timer.periodic(const Duration(seconds: 8), (_) {
      _checkStatus(silent: true);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkStatus(silent: true);
    }
  }

  Future<void> _openCheckout() async {
    final uri = Uri.tryParse(widget.executionUrl);
    if (uri == null) {
      if (mounted) {
        setState(() => statusNote = 'Invalid payment page link.');
      }
      return;
    }
    if (opening) return;
    setState(() => opening = true);
    try {
      final opened = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
      if (!opened && mounted) {
        setState(() {
          statusNote =
              'Could not open the payment page. Tap “Open payment page” to try again.';
        });
      } else if (mounted) {
        setState(() {
          statusNote = kIsWeb
              ? 'Complete payment in the new tab, then return here. This screen checks status automatically.'
              : 'Complete payment in your browser, then return here. This screen checks status automatically.';
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => statusNote = 'Could not open payment page: $e');
      }
    } finally {
      if (mounted) setState(() => opening = false);
    }
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
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('SoftPay checkout', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.open_in_new, size: 48, color: AppColor.primaryColor),
              const SizedBox(height: 16),
              Text(
                'Finish payment in your browser',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Gate blocks payment pages inside the app, so SoftPay opens in a new tab. After you pay, come back and tap Check status if the app has not updated yet.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black54,
                      height: 1.4,
                    ),
              ),
              const SizedBox(height: 20),
              if (statusNote != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber.shade200),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.info_outline, size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text(statusNote!)),
                    ],
                  ),
                ),
              const Spacer(),
              Text(
                'Reference: ${widget.reference}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: Colors.black45),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: opening ? null : _openCheckout,
                icon: opening
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.open_in_browser),
                label: Text(opening ? 'Opening…' : 'Open payment page'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: checking ? null : () => _checkStatus(),
                child: checking
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Check status'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: _done,
                child: const Text('Back to menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
