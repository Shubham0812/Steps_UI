# Steps_UI

`Steps_UI` follows the same high-level iOS project organization used in `apps/WordGame_UI/WordGame_UI`: shared code lives in `iOS/Core`, feature-owned code lives in `iOS/Features`, and bundled assets/configuration live in `iOS/Resources`. The goal is a structure that stays easy to navigate as the app grows without mixing unrelated concerns.

## Folder Hierarchy

```text
Steps_UI/
├── iOS/
│   ├── Core/
│   │   ├── Common/
│   │   │   ├── Models/
│   │   │   └── Views/
│   │   ├── Controllers/
│   │   ├── Extensions/
│   │   ├── Models/
│   │   ├── Services/
│   │   ├── Theme/
│   │   └── Utils/
│   ├── Features/
│   │   └── Main/
│   │       ├── Models/
│   │       ├── ViewModels/
│   │       └── Views/
│   └── Resources/
│       ├── Assets.xcassets/
│       ├── Entitlements/
│       ├── Fonts/
│       ├── Localization/
│       └── Lottie/
└── Steps_UI.xcodeproj
```

## Top-Level Groups

### `iOS/Core`
App-wide code shared across multiple features.

- `Common`: reusable UI building blocks and shared models used by more than one feature.
- `Controllers`: app lifecycle, routing, scene/app entry, and other app-level coordinators/controllers.
- `Extensions`: focused type extensions for Foundation, SwiftUI, and system types.
- `Models`: cross-feature domain models that should not belong to a single feature.
- `Services`: shared managers, clients, persistence layers, and other long-lived app services.
- `Theme`: design tokens, theme definitions, and styling primitives shared across the app.
- `Utils`: lightweight helpers, constants, and utility types that are broadly reusable.

### `iOS/Features`
Feature-owned code. Each feature gets its own folder and should contain only the code required for that feature unless reuse across features is proven.

Current feature structure:
- `Models`: feature-specific data structures.
- `ViewModels`: feature state and presentation logic.
- `Views`: SwiftUI views/screens for that feature.

### `iOS/Resources`
Bundled app resources such as asset catalogs, font files, localization files, entitlement files, animations, plist/config files, sample data, and other static assets required at runtime.

## Placement Guidelines

- Put new screens and feature flows in `iOS/Features/<Feature>/Views`.
- Put feature presentation logic and screen state in `iOS/Features/<Feature>/ViewModels`.
- Put feature-specific models and helper types in `iOS/Features/<Feature>/Models`.
- Keep feature-specific services inside the feature first; move them to `iOS/Core/Services` only when they are reused across features or clearly app-wide.
- Move reusable shared UI to `iOS/Core/Common/Views`.
- Move shared models used by multiple features to `iOS/Core/Common/Models` or `iOS/Core/Models`, depending on whether they are UI-facing shared models or broader domain models.
- Put app lifecycle and navigation entrypoints in `iOS/Core/Controllers`.
- Keep extensions in `iOS/Core/Extensions` and utilities in `iOS/Core/Utils` only when they are truly cross-cutting.
- Add new bundled files to `iOS/Resources` in a subfolder that matches their type or purpose.

## Conventions

- Mirror the `WordGame_UI` architectural pattern, not its game-specific feature naming.
- Use singular, stable folder names that describe responsibility clearly.
- Prefer one primary type per file.
- Default to feature ownership first; promote code to `Core` only when reuse or app-wide responsibility is clear.
- Do not mix views, models, services, and resources in the same folder unless the structure already establishes that convention.
- Keep the Xcode project filesystem-synchronized so the on-disk structure remains the source of truth.
