# Dev Test Project

A Flutter web application for testing search functionality.

## Prerequisites

- Flutter 3.27.4 (stable channel)
- Dart 3.6.2
- Chrome browser for debugging

## Development Environment Setup

### 1. Install Flutter

Follow the official Flutter installation guide at [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)

Verify your installation meets these requirements:
```
Flutter 3.27.4 • channel stable
Framework • revision d8a9f9a52e (2025-01-31)
Engine • revision 82bd5b7209
Tools • Dart 3.6.2 • DevTools 2.40.3
```

### 2. Install Chrome Debug Extension

Install the Dart Debug Extension for Chrome from the [Chrome Web Store](https://chromewebstore.google.com/detail/dart-debug-extension/eljbmlghnomdjgdjmbdekegdkbabckhm)

![image](https://github.com/user-attachments/assets/6139f760-d61d-487d-924e-bc806a7a2db3)


### 3. Project Setup

1. Clone the repository:
   ```bash
   git clone git@github.com:cmoscosoz/flutter_test_search.git
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

## Running the Project

You can run the project using either VS Code or the terminal.

### Option 1: Using VS Code

1. Open the project in VS Code
2. Navigate to the Debug tab
3. Select `dev_test_2degrees` from the available devices
4. Click the "Start Debugging" button or press F5

![image](https://github.com/user-attachments/assets/41be3daf-8cfe-4f1a-a9d5-318e46a41c4c)

### Option 2: Using Terminal

1. Run the following command:
   ```bash
   flutter run --hot -d web-server --web-port 8080
   ```
   Note: If port 8080 is unavailable, you can specify a different port number.

2. The application will automatically open in your default browser

## Debugging

1. Once the application is running in Chrome, click the Dart Debug Extension icon in your browser
2. Select "Open DevTools" to begin debugging
3. Use the Chrome Developer Tools with the Dart debugging features enabled

![image](https://github.com/user-attachments/assets/61ea8bfb-1c7c-44a0-a0f6-0ab1be52e605)

## Support

If you encounter any issues or have questions, please open an issue in the repository. 👀

Happy coding! 🚀
