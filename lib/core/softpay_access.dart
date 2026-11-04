/// SoftPay is limited to these app login phones while SoftPay is enabled
/// in the portal. Everyone else uses Malipo Mtandao.
class SoftPayAccess {
  SoftPayAccess._();

  static const List<String> allowedPhones = [
    '0754290550',
  ];

  /// National 9-digit key (e.g. 754290550) for 0754290550 / 255754290550 / +255754290550.
  static String nationalKey(String? phone) {
    final digits = (phone ?? '').replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return '';
    if (digits.startsWith('255') && digits.length >= 12) {
      return digits.substring(digits.length - 9);
    }
    if (digits.startsWith('0') && digits.length >= 10) {
      return digits.substring(digits.length - 9);
    }
    if (digits.length == 9) return digits;
    return digits.length >= 9 ? digits.substring(digits.length - 9) : digits;
  }

  static bool isAllowed(String? phone) {
    final needle = nationalKey(phone);
    if (needle.isEmpty) return false;
    for (final allowed in allowedPhones) {
      if (nationalKey(allowed) == needle) return true;
    }
    return false;
  }

  /// SoftPay UI / checkout only when the login phone is allowlisted.
  static bool canUseSoftPay(String? loginPhone, String? providerKey) {
    return providerKey == 'softepay' && isAllowed(loginPhone);
  }

  static String effectiveProvider(String? loginPhone, String? providerKey) {
    if (canUseSoftPay(loginPhone, providerKey)) return 'softepay';
    return 'malipo';
  }

  static String labelFor(String providerKey) {
    return providerKey == 'softepay' ? 'SoftPay' : 'Malipo Mtandao';
  }
}
