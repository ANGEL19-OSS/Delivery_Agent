# 🚚 Delivery Agent App

[![Flutter](https://img.shields.io/badge/Flutter-^3.9.0-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-^3.9.0-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![GetX](https://img.shields.io/badge/GetX-^4.6.6-8A2BE2?style=for-the-badge&logo=flutter&logoColor=white)](https://pub.dev/packages/get)
[![License](https://img.shields.io/badge/License-MIT-green.style=for-the-badge)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-blue?style=for-the-badge)](https://flutter.dev)

A modern, high-performance **Flutter** application designed for delivery partners and agents. Built with **GetX** architecture, the app provides real-time GPS tracking, geofenced store check-ins, weather updates, order lifecycle management, turn-by-turn map navigation, and instant QR-code customer payment confirmation.

---

## 📑 Table of Contents

- [Features](#-features)
- [Tech Stack & Architecture](#-tech-stack--architecture)
- [Project Structure](#-project-structure)
- [Screen Flow & Navigation](#-screen-flow--navigation)
- [Prerequisites](#-prerequisites)
- [Getting Started](#-getting-started)
- [Configuration & Permissions](#-configuration--permissions)
- [Build & Run Commands](#-build--run-commands)
- [License](#-license)

---

## ✨ Features

### 🔐 Authentication & Onboarding
- **Splash Screen**: Seamless splash transition on app startup.
- **Agent Login**: Secure authentication flow with real-time form validation (email format, password security checks, and customized error feedback).

### 📍 Geofenced Store Check-In & Location Verification
- **Real-Time GPS Tracking**: Precise agent coordinate resolution powered by `Geolocator`.
- **Geocoding & Locality Detection**: Reverse geocoding to resolve human-readable city and area names using `Geocoding`.
- **Store Proximity Check**: Geofenced radius verification ensuring agents are within 200m of assigned store locations for check-in validation.

### 🌤️ Live Weather Integration
- **Open-Meteo API**: Automatic fetching of live weather data (temperature, relative humidity, wind speed, weather conditions) based on the agent's exact location coordinates.
- **Dynamic Weather UI**: Custom weather icons and status translation (Clear, Rain, Foggy, Thunderstorm, etc.).

### 📦 Order Lifecycle & Management
- **Assigned Orders Listing**: Overview of active, pending, accepted, and completed orders.
- **Filtered Tabs**: Quick filtering across `All`, `Accepted`, and `Completed` delivery categories.
- **Order Details**: Comprehensive breakdown of pickup and delivery addresses, customer contact info, timestamps, and order values.
- **Order Acceptance Flow**: One-tap order acceptance with instant UI state synchronization.

### 🗺️ Turn-by-Turn Map & Navigation
- **Interactive Navigation View**: Map view showing route trajectories from store pickup to customer drop-off.
- **Distance & ETA Calculation**: Real-time remaining distance and estimated time of arrival display.
- **Recenter & Compass Controls**: Quick location reset and map orientation tools.

### 💳 Customer Reached & QR Payment Confirmation
- **"Reached Customer" Action**: Step-by-step arrival confirmation flow.
- **Customer Payment QR Code**: Instant QR code display for scan-and-pay transactions at the doorstep.
- **Delivery Completion Dialog**: Confirmation modal with order summary and instant earnings tracking update.

---

## 🛠️ Tech Stack & Architecture

### Tech Stack

| Technology | Package / Version | Description |
| :--- | :--- | :--- |
| **Framework** | Flutter (`^3.9.0`) | Cross-platform mobile development |
| **Language** | Dart (`^3.9.0`) | Type-safe, high-performance programming language |
| **State & Routing** | `get: ^4.6.6` | Reactive state management, dependency injection, and routing |
| **Location Services** | `geolocator: ^14.0.2` | Native GPS position handling and distance calculations |
| **Geocoding** | `geocoding: ^5.0.0` | Coordinate-to-address and address-to-coordinate translation |
| **Mapping** | `google_maps: ^8.3.0` | Map view & navigation rendering |
| **Preview Tool** | `device_preview: ^1.2.0` | Multi-device layout preview during development |

### Architecture Pattern: GetX (MVC / Clean Pattern)

The application follows the **GetX Pattern**, enforcing clean separation between UI components, business logic, state models, and external services:

```
┌─────────────────────────────────────────────────────────┐
│                      Views (UI)                         │
│   (HomeView, LoginView, DashboardView, MapView, etc.)   │
└────────────────────────────┬────────────────────────────┘
                             │ Obx / GetView
┌────────────────────────────▼────────────────────────────┐
│                    Controllers (State)                  │
│  (HomeController, LoginController, MapController, etc.) │
└──────────────┬───────────────────────────┬──────────────┘
               │                           │
┌──────────────▼─────────────┐   ┌─────────▼──────────────┐
│       Services (API/GPS)   │   │     Data Models        │
│(LocationService, Weather)  │   │(OrdersModel, Weather)  │
└────────────────────────────┘   └────────────────────────┘
```

- **Views**: Pure UI widgets extending `GetView<Controller>` or using `Obx` observers.
- **Controllers**: Handle UI state logic, form validation, and event handlers extending `GetxController`.
- **Services**: Encapsulate external HTTP calls (Weather API) and hardware APIs (Geolocator/Geocoding).
- **Models**: Strongly typed Dart representations of JSON payloads.

---

## 📁 Project Structure

```
deliveryagent/
├── android/                        # Android native configurations & permissions
├── assets/                         # Image assets, splash graphics, map backgrounds
│   ├── splash_background.png
│   ├── welcome_background.png
│   ├── welcome_component1.png
│   ├── map_background.png
│   └── reached_customer.png
├── ios/                            # iOS native platform configurations
├── lib/
│   ├── main.dart                   # Application entry point & GetMaterialApp setup
│   └── app/
│       ├── modules/                # Feature Modules (GetX Pattern)
│       │   ├── dashboard/          # Store check-in & agent stats module
│       │   │   ├── controllers/    # DashboardController
│       │   │   └── views/          # DashboardView
│       │   ├── home/               # Home feed & weather module
│       │   │   ├── controllers/    # HomeController
│       │   │   ├── models/         # OrdersModel.dart, WeatherModel.dart
│       │   │   ├── services/       # location_service.dart, weather_service.dart
│       │   │   └── views/          # HomeView
│       │   ├── login/              # Authentication module
│       │   │   ├── controllers/    # LoginController
│       │   │   └── views/          # LoginView
│       │   ├── map_view/           # Map navigation module
│       │   │   ├── controllers/    # MapController
│       │   │   └── views/          # MapView, ReachedCustomerScreen
│       │   ├── order_detail/       # Order details & action module
│       │   │   ├── controllers/    # OrderDetailController
│       │   │   └── views/          # OrderDetailView
│       │   └── splash/             # Splash module
│       │       └── splash_screen.dart
│       ├── routes/                 # Routing configuration
│       │   ├── app_pages.dart      # GetPage route definitions & bindings
│       │   └── app_routes.dart     # Route name constants
│       ├── utils/                  # Styling & constants design system
│       │   └── constants/          # AppColors, AppStrings, AppTextStyles
│       └── widgets/                # Reusable custom UI components
│           ├── locating_card.dart  # Agent location loading card
│           ├── order_card.dart     # Order card item layout
│           └── stat_card.dart      # Summary & earnings card widget
├── pubspec.yaml                    # Dependencies & asset declarations
└── analysis_options.yaml           # Code analysis rules
```

---

## 🗺️ Screen Flow & Navigation

| Route | View | Description |
| :--- | :--- | :--- |
| `/splash` | `SplashScreen` | Initial branding animation & auto-redirection |
| `/login` | `LoginView` | Agent email & password login screen |
| `/home` | `HomeView` | Primary hub featuring weather summary, location status, and order listings |
| `/dashboard` | `DashboardView` | Store check-in interface with 200m radius verification |
| `/order-detail` | `OrderDetailView` | Full order specifics with pickup/drop locations & accept button |
| `/map-view` | `MapView` | Real-time map navigation to customer destination |
| Custom Route | `ReachedCustomerScreen` | Customer arrival screen displaying payment QR code & delivery completion |

---

## ⚙️ Prerequisites

Before getting started, ensure you have installed:

- **Flutter SDK**: `>= 3.9.0` ([Download Flutter](https://docs.flutter.dev/get-started/install))
- **Dart SDK**: Included with Flutter SDK
- **IDE**: [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- **Flutter & Dart Plugins**: Installed in your IDE
- **Device / Emulator**: Android Emulator, iOS Simulator, or a physical mobile device with USB debugging enabled.

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/deliveryagent.git
cd deliveryagent
```

### 2. Install Dependencies

Fetch all required packages listed in `pubspec.yaml`:

```bash
flutter pub get
```

### 3. Run the Application

Connect a physical device or launch an emulator, then execute:

```bash
flutter run
```

---

## 🔒 Configuration & Permissions

### Android Configuration (`android/app/src/main/AndroidManifest.xml`)

Location permissions are required for GPS tracking, store locality verification, and local weather updates:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```

### iOS Configuration (`ios/Runner/Info.plist`)

Ensure the following location permission usage descriptions are included in `Info.plist`:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Delivery Agent requires location access to verify store check-in and guide order navigation.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>Delivery Agent requires background location tracking for live order updates.</string>
```

---

## 🔨 Build & Run Commands

### Debug Mode

```bash
flutter run --debug
```

### Release Mode

```bash
flutter run --release
```

### Build Android APK

```bash
flutter build apk --release
```
The output APK file will be generated at `build/app/outputs/flutter-apk/app-release.apk`.

### Build Android App Bundle (AAB)

```bash
flutter build appbundle --release
```

### Build iOS IPA

```bash
flutter build ipa --release
```

---

## 📄 License

This project is proprietary software for delivery agent operations. All rights reserved.

---

<p center>Made with ❤️ using <b>Flutter & GetX</b></p>

