# Union Shop — Flutter Coursework

This repository contains the coursework project for students enrolled in the **Programming Applications and Programming Languages (M30235)** and **User Experience Design and Implementation (M32605)** modules at the University of Portsmouth.

## Overview

The Student Union has an e-commerce website, which you can access via this link: [shop.upsu.net](https://shop.upsu.net)

In short, your task is to recreate the same website using Flutter. You must not start from scratch, as you need to begin by forking the GitHub repository that contains the incomplete code. [The getting started section of this document](#getting-started) will explain more. Once you have completed the application, you will submit the link to your forked repository on Moodle for assessment and demonstrate your application in a practical session. See the [submission](#submission) and [demonstration](#demonstration) sections for more information.

⚠️ The UPSU.net link on the navbar of the union website is a link to an external site. This is not part of the application that you need to develop. So ignore the link highlighted below:

![Union Shop Header](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_union_site_header.png)

## Getting Started

### Prerequisites

You have three options for your development environment:

1. **Firebase Studio** (browser-based, no installation required)
2. **University Windows computers** (via AppsAnywhere)
3. **Personal computer** (Windows or macOS)

Below is a quick guide for each option. For more information, you can refer to [Worksheet 0 — Introduction to Dart, Git and GitHub](https://manighahrmani.github.io/sandwich_shop/worksheet-0.html) and [Worksheet 1 — Introduction to Flutter](https://manighahrmani.github.io/sandwich_shop/worksheet-1.html).

**Firebase Studio:**

- Access [idx.google.com](https://idx.google.com) with a personal Google account
- Create a new Flutter Workspace (choose the Flutter template in the "Start coding an app" section)
- Once the Flutter Workspace is created, open the integrated terminal (View → Terminal) and link this project to your forked GitHub repository by running the following commands (replace `YOUR-USERNAME` in the URL):

  ```bash
  rm -rf .git && git init && git remote add origin https://github.com/YOUR-USERNAME/union_shop.git && git fetch origin && git reset --hard origin/main
  ```

  This command should remove the existing Git history, initialize a new Git repository, add your forked repository as the remote named `origin`, fetch the data from it, and reset the local files to match the `main` branch of your forked repository. After running the above commands, open the Source Control view in Visual Studio Code and commit any local changes. This will create a commit that points to your forked repository. In the terminal you can push the commit to GitHub with:

  ```bash
  git push -u origin main
  ```

  If you're unsure that you're connected to the correct repository, check the remote with:

  ```bash
  git remote -v
  ```

  This should show the URL of your forked repository (`https://github.com/YOUR-USERNAME/union_shop.git` where `YOUR-USERNAME` is your GitHub username).

**University Computers:**

- Open [AppsAnywhere](https://appsanywhere.port.ac.uk/sso) and launch the following in the given order:
  - Git
  - Flutter And Dart SDK
  - Visual Studio Code

**Personal Windows Computer:**

- Install [Chocolatey package manager](https://chocolatey.org/install)
- Run in PowerShell (as Administrator):

  ```bash
  choco install git vscode flutter -y
  ```

**Personal macOS Computer:**

- Install [Homebrew package manager](https://brew.sh/)
- Run in Terminal:

  ```bash
  brew install --cask visual-studio-code flutter
  ```

After installation, verify your setup by running:

```bash
flutter doctor
```

This command checks your environment and displays a report of the status of your Flutter installation.

For detailed step-by-step instructions, refer to [Worksheet 1 — Introduction to Flutter](https://manighahrmani.github.io/sandwich_shop/worksheet-1.html), which covers the complete setup process for all three options.

### Fork the Repository

Go to the repository containing the code for the coursework and click on the fork button as shown in the screenshot: [github.com/manighahrmani/union_shop/fork](https://github.com/manighahrmani/union_shop/fork) (Alternatively, just use this link: [github.com/manighahrmani/union_shop/fork](https://github.com/manighahrmani/union_shop/fork).)

![Fork Button](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_fork_button.png)

Do not change anything and click on the Create fork button. You should then have a public fork of my repository with a URL like (YOUR-USERNAME replaced with your username): [github.com/YOUR-USERNAME/union_shop](https://github.com/YOUR-USERNAME/union_shop)

![Fork Settings](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_fork_settings.png)

Note that the name of this created fork must be “union_shop”. If you already have a repository with this name, you need to rename it beforehand.

### Clone Your Forked Repository

If you are using Firebase, access idx.google.com with a personal Google account. Create a new Flutter Workspace named `union_shop` (choose the Flutter template in the “Start coding an app” section). Once the Flutter Workspace is created, open the integrated terminal (View → Terminal) and link this project to your forked GitHub repository by running the following commands (replace YOUR-USERNAME in the URL): 

```bash
rm -rf .git && git init && git remote add origin https://github.com/YOUR-USERNAME/union_shop.git && git fetch origin && git reset --hard origin/main 
```

This command should remove the existing Git history, initialize a new Git repository, add your forked repository as the remote named origin, fetch the data from it. It should also reset the local files to match the main branch of your forked repository. After running the above commands, open the Source Control view and commit any local changes.  

Otherwise, open a terminal, change to your desired directory, and run the following commands:

```bash
git clone https://github.com/YOUR-USERNAME/union_shop.git
cd union_shop
```

Replace `YOUR-USERNAME` with your actual GitHub username.

### Install Dependencies

Your editor should automatically prompt you to install the required dependencies when you open the project. If not, open the integrated terminal (open the Command Palette with `Ctrl+Shift+P` or `Cmd+Shift+P` and type "Terminal: Create New Terminal") and run the following command:

```bash
flutter pub get
```

### Run the Application

This application is primarily designed to run on the **web** and should be viewed in **mobile view** using your browser's developer tools. We recommend using Google Chrome.

Select Chrome as the target device and run the application either from the `main.dart` file or by entering the following command in the terminal:

```bash
flutter run -d chrome
```

Once the app is running in Chrome, open Chrome DevTools by right-clicking on the page and selecting "Inspect" (or use the shortcut `F12`). Click the "Toggle device toolbar" button as shown in the screenshot below.

![Chrome DevTools Mobile View](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_chrome_devtools.png)

From the Dimensions menu, select a mobile device preset (e.g., iPhone 12 Pro, Pixel 5):

![Device Selection](https://raw.githubusercontent.com/manighahrmani/sandwich_shop/refs/heads/main/images/screenshot_chrome_devtools_device_selection.png)

## Marking Criteria

This assessment is worth 55% of the marks for the module's assessment item 1 (the remaining 45% comes from the weekly sign-offs). The mark for the assessment is divided into two components:

# Union Shop (Flutter)

A simple, educational Flutter e‑commerce frontend used for coursework and demos. The app demonstrates responsive layouts, routing (including deep links), a small in-memory product service, and a basic in-memory shopping cart.

This README replaces the original course README and focuses on practical setup, running, testing, and developer notes specific to this codebase.

## Quick Start

- Prerequisites: Flutter SDK (stable channel), Git, and an editor (VS Code or Android Studio). Verify with:

```powershell
flutter --version
flutter doctor
```

- Install dependencies and run on Chrome (recommended for quick development):

```powershell
flutter pub get
flutter run -d chrome
```

Note: The project targets the web for rapid UI iteration and responsive checks; it also runs on device simulators/emulators.

## Project Structure (important files)

- `lib/main.dart` — App entry, route table and `onGenerateRoute` (dynamic `/product/<id>` and `/collection/<id>` support), and a small `RouteLogger` observer used during development.
- `lib/screens/` — Screens (pages):
  - `home_screen.dart` — Home page with product grid.
  - `collections_page.dart` / `collection_page.dart` — Collections list and single collection pages.
  - `product_page.dart` — Product detail page; accepts either a `Product` object or a `productId` to load.
  - `cart_page.dart` — Shopping cart UI and checkout flow.
  - `checkout_success_page.dart` — Order confirmation page.
- `lib/widgets/` — Reusable widgets: `header.dart`, `footer.dart`, `product_card.dart`.
- `lib/models/` — Data models: `product.dart`, `cart_item.dart`, `collection.dart`.
- `lib/services/` — Lightweight in-memory services:
  - `product_service.dart` — supplies collections and products and supports `getProductById` (with a fallback for legacy hash ids).
  - `cart_service.dart` — singleton `ChangeNotifier` that manages cart items.
- `test/` — Widget tests (if present).

## Routing and Deep Links

This app uses a combination of static `routes` and `onGenerateRoute` to support both named and dynamic routes. Important routes:

- `/` — Home
- `/collections` — Collections overview
- `/collection/<id>` — Single collection (dynamic)
- `/product/<id>` — Product detail (dynamic)
- `/cart` — Cart page

When navigating from a product tile we push a named URL like `/product/<id>` and also pass the `Product` object via `arguments` to avoid a redundant lookup. The `onGenerateRoute` logic prefers the provided `Product` argument and falls back to loading by id from `ProductService`.

If you need to add or change routes, update `lib/main.dart`'s `routes` map and `onGenerateRoute` accordingly.

## Product IDs and Compatibility

Products in the in-memory `ProductService` have stable `id` values (e.g., `new-1`, `summer-2`). Some parts of the app historically created temporary `Product` objects with `id = title.hashCode.toString()` (used by `ProductCard` in legacy code). To support both cases the `ProductService.getProductById` includes a fallback that matches `title.hashCode.toString()` against known product titles. For production code you should normalize IDs so all pages use the canonical `product.id`.

## Cart Behavior

`CartService` is a singleton `ChangeNotifier` used throughout the app. Key notes:

- `addItem(Product product, {int qty = 1, Map<String, String>? attributes})` records items using `product.id` as the `productId` key and merges items that share the same `productId` and attributes.
- `items` is exposed as an unmodifiable `List<CartItem>` and the service provides `totalItems` and `totalPrice` convenience getters.

The cart is in-memory only; persistence (local storage or backend) is a reasonable next step.

## Development Tips

- Use the browser address bar to test deep links (e.g., `http://localhost:xxxxx/#/product/new-1`).
- The app includes a `RouteLogger` navigator observer; check the terminal logs for `onGenerateRoute` and push/pop messages when debugging navigation issues.
- When making changes to routing, remove any static route entry for a dynamic path (e.g., avoid having a `/product` static route and also handling `/product/<id>` in `onGenerateRoute`) to prevent unexpected routing fallbacks.

## Testing

If there are widget tests in `test/`, run them with:

```powershell
flutter test
```

Add tests for new functionality as you implement it (especially for services and routing behavior).

## Code Hygiene and Git

- Commit often with small messages. Example:

```bash
git add .
git commit -m "Implement dynamic product routing and product lookup by id"
git push
```

- If you rewrite history (e.g., with `git filter-repo`), work on a backup branch and verify the rewritten repository locally before force-pushing to any shared remote.

## Troubleshooting

- If Add-to-cart does nothing, confirm the `ProductPage` has a resolved `Product` instance (either passed via `arguments` or loaded by `productId`). Check terminal logs for `onGenerateRoute` and `RouteLogger` output.
- If the browser URL does not update when navigating, make sure no static `routes` entry handles the same path and that `onGenerateRoute` returns a `Route` with `RouteSettings(name: settings.name, ...)` so the route name is used in browser history.

## Next Improvements (suggested)

- Persist cart to `shared_preferences` or a lightweight backend.
- Replace transient `title.hashCode` ids by canonical ids everywhere.
- Add authentication, server-backed products, and hosted deployment (e.g., GitHub Pages or Firebase Hosting) for live demo.

## License & Attribution

This project is provided for coursework and learning. If you fork or reuse parts of it, keep attribution to the original repository author where appropriate.

---

If you'd like, I can also add a short CONTRIBUTING section, suggested git branching workflow, or a one‑page developer quickstart to the repo. Let me know which you prefer.
