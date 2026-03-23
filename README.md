# Orderly
UIKit food ordering app — programmatic UI, no Storyboards.

## Architecture
Coordinator pattern with closure-based navigation, MVVM + Clean Architecture layers (ViewModel → UseCase → Repository), DIContainer for dependency wiring.
SceneDelegate → AppCoordinator
├── Login (UIKit) → Menu (UIKit + UITableView) → Detail (SwiftUI)
Key Features

Programmatic UIKit with Auto Layout
Combine binding in UIKit (@Published + sink)
SwiftUI bridge via UIHostingController — detail screen is SwiftUI, pushed by UIKit Coordinator
UseCase pattern with async/await
CoreData configured (integration TODO)
