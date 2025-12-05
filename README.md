# Union Shop

A Flutter web application for the University of Portsmouth Students' Union shop. Built as part of coursework to demonstrate modern Flutter development practices including responsive design, client-side routing, and state management.

## Features

**Shopping Experience**
- Browse products by collection (Clothing, Accessories, Stationery, etc.)
- Product detail pages with size/colour selection and quantity controls
- Persistent shopping cart with real-time updates
- Checkout flow with order confirmation

**Navigation & Search**
- GoRouter-based navigation with full browser history support
- Deep-linkable URLs for products and collections
- Unified search across products and collections
- Responsive layout adapting to desktop and mobile viewports

**The Print Shack**
- Custom merchandise personalisation feature
- Text customisation with font selection, sizing, and colour options
- Live preview of personalised items

## Getting Started

```powershell
# Clone and install dependencies
git clone <repository-url>
cd union_shop
flutter pub get

# Run on Chrome (recommended for web features)
flutter run -d chrome --web-port=8080
```

## Project Structure

```
lib/
├── main.dart              # App entry point and GoRouter configuration
├── models/                # Data models (Product, Collection, CartItem)
├── screens/               # Page-level widgets
├── services/              # Business logic (CartService, ProductService)
└── widgets/               # Reusable UI components

test/
├── widget_test.dart       # Widget integration tests
└── unit/                  # Unit tests for services
```

## Testing

The project includes 24 tests covering core functionality:

```powershell
flutter test
```

- **Cart Service Tests**: Adding items, quantity management, totals calculation
- **Product Service Tests**: Collection/product retrieval, search functionality
- **Widget Tests**: Header rendering, cart integration

## Tech Stack

- **Framework**: Flutter 3.x with Dart
- **Routing**: GoRouter for declarative, URL-based navigation
- **State Management**: Singleton services with ChangeNotifier
- **Testing**: flutter_test with custom HTTP overrides for image mocking

## Acknowledgements

Developed for the University of Portsmouth as part of coursework assessment.


