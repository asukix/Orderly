# Orderly
UIKit food ordering app — programmatic UI, no Storyboards.

## Architecture
Coordinator pattern with closure-based navigation, MVVM + Clean Architecture layers (ViewModel → UseCase → Repository), DIContainer for dependency wiring.

SceneDelegate → AppCoordinator:
Login (UIKit) → Menu (UIKit + UITableView) → Detail (SwiftUI)

### Key Features
- Programmatic UIKit with Auto Layout
- Combine binding in UIKit (@Published + sink)
- SwiftUI bridge via UIHostingController — detail screen is SwiftUI, pushed by UIKit Coordinator
- UseCase pattern with async/await
- CoreData configured (integration TODO)

---
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-03-23 at 09 46 58" src="https://github.com/user-attachments/assets/ef3457a5-4ae5-4862-babf-f715e40b711a" /> 
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-03-23 at 09 47 02" src="https://github.com/user-attachments/assets/8336b2ce-b75d-4d52-b9a2-62ffb3d1f5cf" /> 
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-03-23 at 09 48 43" src="https://github.com/user-attachments/assets/3dc0f409-5cb7-4417-b141-b5c082e033d1" />
