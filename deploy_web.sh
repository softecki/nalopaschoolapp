#!/bin/bash

# Nalopa School App Web Deployment Script with Cache Busting
# This script helps deploy Flutter web with proper cache busting

echo "🚀 Nalopa School App Web Deployment Script"
echo "==========================================="

# Get current version
CURRENT_VERSION=$(grep -o '"version": "[^"]*"' web/manifest.json | cut -d'"' -f4)
echo "Current version: $CURRENT_VERSION"

# Prompt for new version
read -p "Enter new version (current: $CURRENT_VERSION): " NEW_VERSION

if [ -z "$NEW_VERSION" ]; then
    NEW_VERSION=$CURRENT_VERSION
fi

echo "📝 Updating version to: $NEW_VERSION"

# Update version in manifest.json
sed -i "s/\"version\": \"[^\"]*\"/\"version\": \"$NEW_VERSION\"/" web/manifest.json

# Update version in index.html if it exists
if grep -q "const APP_VERSION" web/index.html 2>/dev/null; then
    sed -i "s/const APP_VERSION = '[^']*'/const APP_VERSION = '$NEW_VERSION'/" web/index.html
fi

echo "🔨 Building Flutter web..."

# Build Flutter web
flutter build web --release --no-tree-shake-icons

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"

    # Drift (sql.js) and PWA files must ship with every deploy, or the app fails with
    # "Could not access the sql.js javascript library".
    REQUIRED_FILES="index.html main.dart.js flutter.js flutter_bootstrap.js manifest.json favicon.png sql-wasm.js sql-wasm.wasm sqlite3.wasm .htaccess icons/Icon-192.png icons/Icon-512.png icons/Icon-maskable-192.png icons/Icon-maskable-512.png icons/apple-touch-icon.png"
    for f in $REQUIRED_FILES; do
        if [ ! -f "build/web/$f" ] && [ -f "web/$f" ]; then
            echo "⚠️  build/web/$f missing - copying from web/"
            mkdir -p "build/web/$(dirname "$f")"
            cp "web/$f" "build/web/$f"
        fi
    done
    MISSING=""
    for f in $REQUIRED_FILES; do
        [ -f "build/web/$f" ] || MISSING="$MISSING $f"
    done
    if [ -n "$MISSING" ]; then
        echo "❌ Build output is missing required files:$MISSING"
        exit 1
    fi
    echo "✅ Database (sql.js) and PWA files present"
    
    # Create deployment package with timestamp
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    DEPLOY_DIR="deploy_web_v${NEW_VERSION}_${TIMESTAMP}"
    
    echo "📦 Creating deployment package: $DEPLOY_DIR"
    
    # Copy build files
    mkdir -p "$DEPLOY_DIR"
    cp -r build/web/. "$DEPLOY_DIR/"

    # Cache busting: index.html is never cached, so versioned URLs force Cloudflare/browsers
    # to fetch the new flutter_bootstrap.js and main.dart.js instead of serving stale copies.
    sed -i "s#\"mainJsPath\":\"main.dart.js\"#\"mainJsPath\":\"main.dart.js?v=$TIMESTAMP\"#" "$DEPLOY_DIR/flutter_bootstrap.js"
    sed -i "s#src=\"flutter_bootstrap.js\"#src=\"flutter_bootstrap.js?v=$TIMESTAMP\"#" "$DEPLOY_DIR/index.html"
    if ! grep -q "main.dart.js?v=$TIMESTAMP" "$DEPLOY_DIR/flutter_bootstrap.js"; then
        echo "❌ Could not version main.dart.js in flutter_bootstrap.js"
        exit 1
    fi
    
    # Create deployment info file
    cat > "$DEPLOY_DIR/deployment_info.txt" << EOF
Nalopa School App Web Deployment
=================================
Version: $NEW_VERSION
Deployed: $(date)
Build: $TIMESTAMP
Flutter Version: $(flutter --version | head -n 1)
EOF
    
    echo "📋 Deployment package created: $DEPLOY_DIR"
    echo "📁 Contents:"
    ls -la "$DEPLOY_DIR"
    
    echo ""
    echo "🎯 Next Steps:"
    echo "1. Upload the contents of '$DEPLOY_DIR' to your web server"
    echo "2. Ensure your server has proper cache headers configured"
    echo "3. Test the deployment in different browsers"
    echo "4. Monitor for update notifications"
    
    echo ""
    echo "🔧 Server Configuration Tips:"
    echo "- Set Cache-Control headers for HTML files: no-cache, no-store, must-revalidate"
    echo "- Set Cache-Control headers for JS/CSS files: max-age=31536000 (1 year)"
    echo "- Use ETags for better cache management"
    echo "- Enable gzip compression"
    
else
    echo "❌ Build failed!"
    exit 1
fi

echo ""
echo "✨ Deployment script completed!"
