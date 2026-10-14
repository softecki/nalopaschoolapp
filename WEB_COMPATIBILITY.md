# Web Compatibility Guide

## Changes Made for Web Support

### 1. Database (sqflite → sqflite_common_ffi_web)
- **File**: `lib/src/data/database_helper.dart`
- **Changes**: 
  - Added platform check using `kIsWeb`
  - For web: Uses `sqflite_common_ffi_web` with `databaseFactoryWeb`
  - For mobile: Uses standard `sqflite` with file system paths
- **Package Added**: `sqflite_common_ffi_web: ^1.0.4` in `pubspec.yaml`

### 2. File Handling (dart:io → Conditional Import)
- **File**: `lib/src/view/screen/register_product.dart`
- **Changes**:
  - Replaced `import 'dart:io'` with conditional import
  - Uses `XFile` for web, `File` for mobile
  - Image display and upload handle both platforms

### 3. Platform Checks
- Added `kIsWeb` checks throughout the codebase
- Conditional imports for platform-specific code

## Running on Web

### Prerequisites
1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Enable web support (if not already):
   ```bash
   flutter config --enable-web
   ```

### Run on Web
```bash
flutter run -d chrome
# or
flutter run -d web-server
```

## Notes
- Database operations work on web using IndexedDB (via sqflite_common_ffi_web)
- File picker works on web but uses browser's file picker
- All database insertions and queries are platform-agnostic
- Platform checks ensure proper behavior on both web and mobile

## Testing
- Test database operations on web
- Test file uploads on web
- Test QR code scanning (may need web camera permissions)
- Test all CRUD operations

