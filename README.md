# YeJing (叶镜)

**AI-Powered Plant Disease Diagnosis App**

YeJing is a cross-platform Flutter application that uses AI-powered image recognition to deliver instant plant disease diagnosis. Users can capture or upload a photo of a plant leaf and receive an on-device-friendly diagnosis, including disease identification, severity classification, and treatment recommendations — all backed by generative AI.

> ⚠️ Results are indicative only and are not a substitute for professional agronomic advice.

---

## ✨ Features

- **AI Plant Scanning** — Capture a photo via camera or select one from the gallery, then analyze it using Google's Gemini model through Firebase AI to detect plant diseases.
- **Diagnosis Results** — Get a disease name, severity rating (Mild / Moderate / Severe / Healthy), description, and suggested treatment.
- **Scan History** — All scans are saved locally and can be searched by title or filtered by date range.
- **Local-First Storage** — Scan results persist on-device using Hive, so history is available offline.
- **Bilingual Support** — Fully localized in **English** and **Chinese (中文)**, with a one-tap language toggle.
- **Connectivity Awareness** — Detects internet connectivity changes and notifies the user when offline (required for AI analysis).
- **Clean, Responsive UI** — A custom design system with a responsive scaling utility that adapts layouts across phone and tablet form factors.
- **App Check Integration** — Firebase App Check is used to protect backend AI resources from abuse.

---

## 🏗️ Architecture

The app follows a **feature-based, state-management-driven architecture** using the BLoC pattern (`flutter_bloc`), split into:

- **Blocs** — Used for more complex, event-driven flows (e.g. the scanning pipeline: idle → image selected → processing → result/error).
- **Cubits** — Used for simpler, direct-state flows (e.g. bottom navigation, history filtering, locale switching, connectivity status).

### Project Structure

```
lib/
├── blocs/                # Event-driven state management (e.g. Scan flow)
│   └── scan/
├── cubits/               # Simple state management (nav, history, locale, connectivity)
│   ├── bottom_nav/
│   ├── connectivity/
│   ├── history/
│   └── locale/
├── models/               # Data models (ScanResult, DiseaseLabel)
├── services/
│   ├── firebase/         # Firebase AI (Gemini) integration
│   └── storage/          # Hive local persistence
├── presentation/
│   ├── interfaces/       # Top-level screens (Scan, History, Settings, Main)
│   └── widgets/          # Reusable UI components
├── l10n/                 # Localization (ARB files, generated localizations)
├── utils/                # Design tokens, constants, responsive scaling
└── main.dart             # App entry point & bootstrapping
```

### State Management Flow (Scan Feature)

```
ScanInitialState
      │  (pick image)
      ▼
ScanImageSelectedState
      │  (tap analyze)
      ▼
ScanProcessingState  ──▶  FirebaseAIService.analyzePlantImage()
      │
      ├── success ──▶ ScanResultState (saved to Hive)
      └── failure ──▶ ScanErrorState
```

---

## 🧰 Tech Stack

| Category            | Technology                                  |
|----------------------|----------------------------------------------|
| Framework            | Flutter (Dart SDK ^3.13.2)                   |
| State Management     | `flutter_bloc`, `hydrated_bloc`, `equatable` |
| AI / ML              | `firebase_ai` (Gemini `2.5-flash`)           |
| Backend Services     | `firebase_core`, `firebase_app_check`        |
| Local Storage        | `hive`, `hive_flutter`                       |
| Image Handling       | `image_picker`, `mime`                       |
| Localization         | `flutter_localizations`, `intl`, ARB files   |
| Connectivity         | `internet_connection_checker`                |
| UI / Assets          | `flutter_svg`, `google_fonts`                |
| Splash Screen        | `flutter_native_splash`                      |
| Utilities            | `path_provider`, `uuid`                      |

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart ^3.13.2)
- A Firebase project with:
  - **Firebase AI (Gemini API)** enabled
  - **Firebase App Check** configured
- Platform-specific Firebase config files:
  - `android/app/google-services.json`
  - `ios/Runner/GoogleService-Info.plist`

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd yejing
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**

   This project uses FlutterFire CLI to generate `lib/firebase_options.dart`:
   ```bash
   flutterfire configure
   ```
   This will regenerate `firebase_options.dart` and the platform config files referenced in `firebase.json`.

4. **Add AI prompt configuration**

   Create `lib/utils/ai_prompts.dart` (excluded from version control) with your diagnosis prompt, e.g.:
   ```dart
   class AIPrompts {
     static const String plantDiseaseDetectionPrompt = '''
       Analyze the provided plant leaf image and return a JSON object with:
       disease_name, severity (mild|moderate|severe|healthy), description, treatment.
     ''';
   }
   ```

5. **Generate localization files** (if modifying `.arb` files)
   ```bash
   flutter pub get
   ```

6. **Run the app**
   ```bash
   flutter run
   ```

---

## 🌐 Localization

Localization is managed via `l10n.yaml` and ARB files in `lib/l10n/`:

- `app_en.arb` — English (template/source of truth)
- `app_zh.arb` — Chinese (中文)

To add a new string, add the key to `app_en.arb` (and translations to `app_zh.arb`), then run:
```bash
flutter pub get
```

Access localized strings anywhere via the `BuildContext` extension:
```dart
context.l10n.scanTitle
```

---

## 🎨 Design System
All colors, typography, image, and icon references are centralized in `lib/utils/constants.dart`:
- `YeJingColors` — Brand palette (primary red, secondary yellow, severity colors, etc.)
- `YeJingTextStyles` — Nunito-based typography scale (`n10` – `n34`)
- `YeJingImages` / `YeJingIcons` — Asset path constants
- `ResponsiveScaler` — A `BuildContext` extension (`context.s()`, `context.sp()`) providing proportional scaling across phone and tablet breakpoints

---

## 💾 Data Persistence
Scan results are persisted locally using **Hive**, keyed by a UUID, and stored as JSON-encoded strings. `HistoryCubit` handles CRUD operations, search-by-title, and date-range filtering over the stored scans.

---

## 📱 App Sections
| Tab       | Description                                                        |
|-----------|----------------------------------------------------------------------|
| **Scan**     | Capture/select a leaf photo and run AI-based disease diagnosis.   |
| **History**  | Browse, search, and filter previously saved scan results.         |
| **Settings** | Switch language, clear scan history, and view app/about info.     |

---

## 📄 License
This project currently has no license specified. All rights are reserved.
