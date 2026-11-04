import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Mobile / non-web: open SoftPay in the system browser pane.
class SoftPayCheckoutFrame extends StatefulWidget {
  final String url;

  const SoftPayCheckoutFrame({super.key, required this.url});

  @override
  State<SoftPayCheckoutFrame> createState() => _SoftPayCheckoutFrameState();
}

class _SoftPayCheckoutFrameState extends State<SoftPayCheckoutFrame> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _open());
  }

  Future<void> _open() async {
    final uri = Uri.tryParse(widget.url);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Complete the payment on the SoftPay page.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _open,
              child: const Text('Open payment page'),
            ),
          ],
        ),
      ),
    );
  }
}
