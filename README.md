# Steps_UI

`Steps_UI` is organized around three clear layers inside `iOS`:
- `Core` for app-wide shared code
- `Features` for feature-owned UI and logic
- `Resources` for bundled assets and configuration

The current project is intentionally small. `Main` is the only implemented feature today, and the rest of the structure is in place so new work has a predictable home as the app grows.

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
App-wide shared code that should not belong to one feature.

- `Common`: reusable shared models and reusable shared SwiftUI components.
- `Controllers`: app entry, lifecycle, routing, and other app-level coordination.
- `Extensions`: focused extensions on system and standard library types.
- `Models`: broader shared domain models used across features.
- `Services`: long-lived services, managers, repositories, and integrations.
- `Theme`: theme structures and design tokens.
- `Utils`: lightweight helpers, constants, and utility types.

### `iOS/Features`
Feature-owned code. Each feature should keep its own views, view models, and local models together.

Current state:
- `Main` is the only feature currently implemented.
- `Main/Views` contains the current screen UI.
- `Main/ViewModels` contains feature state/presentation logic.
- `Main/Models` is reserved for `Main`-only model types.

### `iOS/Resources`
Bundled non-code assets and configuration.

- `Assets.xcassets`: app icons, colors, and image assets.
- `Entitlements`: target entitlement files.
- `Fonts`: bundled font files and families.
- `Localization`: localized string resources by locale.
- `Lottie`: animation JSON assets.

## Placement Guidelines

- Put new screens and feature flows in `iOS/Features/<Feature>/Views`.
- Put feature presentation logic and feature-owned state in `iOS/Features/<Feature>/ViewModels`.
- Put feature-only model types in `iOS/Features/<Feature>/Models`.
- Keep reusable shared UI in `iOS/Core/Common/Views`.
- Keep shared lightweight models in `iOS/Core/Common/Models`.
- Move broader cross-feature domain models to `iOS/Core/Models`.
- Move shared infrastructure and integrations to `iOS/Core/Services`.
- Keep app startup, app lifecycle, and navigation entrypoints in `iOS/Core/Controllers`.
- Put design tokens and theme definitions in `iOS/Core/Theme`.
- Put helpers and extensions in `iOS/Core/Utils` and `iOS/Core/Extensions` only when they are truly cross-cutting.
- Add bundled assets to the matching folder under `iOS/Resources`.

## Conventions

- Prefer feature ownership first. Move code into `Core` only when it is clearly shared.
- Keep folder names stable and responsibility-driven.
- Prefer one primary type per file.
- Do not mix views, models, services, and resources in the same folder when they have dedicated homes already.
- Keep the Xcode project filesystem-synchronized so the folder structure on disk stays the source of truth.
