import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

/// Web: embed SoftPay's execution URL in an iframe.
class SoftPayCheckoutFrame extends StatefulWidget {
  final String url;

  const SoftPayCheckoutFrame({super.key, required this.url});

  @override
  State<SoftPayCheckoutFrame> createState() => _SoftPayCheckoutFrameState();
}

class _SoftPayCheckoutFrameState extends State<SoftPayCheckoutFrame> {
  late final String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType = 'softpay-frame-${widget.url.hashCode}-${DateTime.now().microsecondsSinceEpoch}';
    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final iframe = web.HTMLIFrameElement()
        ..src = widget.url
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allow = 'payment *';
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }
}
