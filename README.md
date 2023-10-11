## What is this?

A solution to the Floww Coding Tests

### Highlights

- Uses the View, Identifiable, Observable pattern (V.I.O)
  - Views represent what the user see
  - Identifiables represent the domain specific data
  - Observables excapsulate identifiables & react/bind to the View
- Swift Package Manager to import my networking framework [Poppify](https://github.com/OccamsCode/Poppify/)
- File structure 
  - `Core` - The Core functionalities of the app such as; Domain & Remote Models, Remote Object Mapper, Networking, Repository & Loading States
  - `Features` - The major screens of the app
  - `Shared` - Resources shared accross all features, such as Navigation
  - `Sources` - The App entry point & AppIcons
- App Icons, small but means no more default app icon

### Improvements

 - App Router to use `NavigationStack`
 - Refactor number/currency formatting to testable objects, would most likely end up in `Shared` folder
 - Removal of magic strings & numbers, would most likely end up in `Shared` folder
