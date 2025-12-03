# Union Shop

A lightweight Flutter e‑commerce frontend used for coursework and demos. Union Shop demonstrates responsive product and collection listings, deep-linkable routes, a small in-memory product service, and a simple in-memory shopping cart.

## Project Overview

Union Shop is a front-end prototype for browsing collections and products, adding items to a cart, and completing a basic checkout flow. It is suitable for learning Flutter layout, routing, and simple state management without a backend.

## Features

- Collections overview and collection detail pages
- Product listing and product detail pages with attributes and quantity controls
- Pagination with previous/next chevrons and page buttons
- Sorting and basic filtering controls
- Responsive grid layout for desktop and mobile widths
- In-memory `ProductService` and `CartService` (no external backend required)
- Deep-linkable routes (e.g., `/product/<id>`, `/collection/<id>`)

## Installation

Clone the repository and install dependencies:

```powershell
git clone https://github.com/YOUR-USERNAME/union_shop.git
cd union_shop
flutter pub get
```

Run the app (web is recommended for quick UI checks):

```powershell
# Run on Chrome
flutter run -d chrome
# Or run on a device/emulator
flutter run
```

## Usage

- Home: shows a hero area and a selection of products.
- Collections: visit `/collections` to view all collections and navigate to `/collection/<id>` to browse a single collection.
- Product page: view details, select options, set quantity, and add to cart. The page accepts either a `Product` object (via `arguments`) or a `productId`.
- Cart/Checkout: view cart items, adjust quantities, and complete a simple checkout flow that shows a confirmation page.

Notes:

- Pagination and visible page size are layout-driven so the number of items per page adapts to viewport width.
- The app prefers a passed `Product` object to avoid redundant lookups, falling back to `ProductService.getProductById` when needed.

## Folder Structure

- `lib/main.dart` — App entry, routes and `onGenerateRoute`.
- `lib/screens/` — Page screens (home, collections, collection, product, cart, checkout).
- `lib/widgets/` — Reusable UI components (header, footer, product/collection cards, pagination widgets).
- `lib/models/` — Data models (`product.dart`, `collection.dart`, `cart_item.dart`).
- `lib/services/` — In-memory services (`product_service.dart`, `cart_service.dart`).
- `test/` — Unit and widget tests (if present).
- `integration_test/` — Integration tests (if present).

## Technologies

- Flutter & Dart
- Development/testing: `flutter_test`, `integration_test` (dev dependencies)
- No backend required — in-memory services provide sample data for development and testing.

## Contributing

- Fork the repository and create a feature branch.
- Keep changes focused and commit messages clear.
- Run analyzer and tests locally before opening a PR:

```powershell
flutter analyze
flutter test
```

- For history rewrites (rebase, filter-repo), create a backup branch before force-pushing to a shared remote.

## License

This project is licensed under the MIT License.

Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
---


