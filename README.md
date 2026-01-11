# Flutter Todo App 📝

A simple and beginner-friendly **Flutter Todo App**, built as part of my **silent speed-coding YouTube series**.

This project focuses on understanding **form handling, list management, and basic CRUD operations** in Flutter using `StatefulWidget`, without adding unnecessary complexity.

---

## 📌 About the App

The Todo app allows users to:

* Add new todos
* Edit existing todos
* Delete todos
* Validate empty input using `Form` and `TextFormField`
* View an empty state when no todos are available

The UI updates dynamically based on user actions.

---

## 🎯 Learning Goals

This project helps beginners understand:

* Flutter project structure
* `StatefulWidget` and state management
* Using `TextEditingController` and `FocusNode`
* Form validation with `Form` and `GlobalKey`
* Managing lists in Flutter
* Add, edit, and delete logic
* Conditional UI rendering
* Basic layouts using `Column`, `Row`, `Expanded`, and `ListView`
* Clean and readable UI without animations

---

## 📱 App Preview

> Clean and minimal UI focused on logic and clarity rather than visual effects.

---

## 🛠 Tech Stack

* **Flutter**
* **Dart**
* **Material UI**

---

## 🚀 Getting Started

### Prerequisites

Make sure you have:

* Flutter SDK installed
* Android Studio or VS Code
* Android Emulator or a physical device

Check Flutter setup:

```bash
flutter doctor
```

---

### Run the App

Clone the repository:

```bash
git clone https://github.com/gokulsundar188/flutter-todo-app.git
```

Navigate into the project:

```bash
cd flutter-todo-app
```

Install dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

---

## 📂 Project Structure

```
lib/
 └── main.dart   # Complete Todo app logic and UI
```

---

## 🧠 How the App Works

* Todos are stored in a simple `List<String>`
* User input is handled using `TextEditingController`
* Form validation prevents empty todos
* Editing is handled using an index-based update
* `setState` updates the UI instantly
* Focus is managed using `FocusNode`
* Conditional UI shows an empty state when no todos exist

---

## 🎥 YouTube Video

This project is part of my **silent Flutter speed-coding series**.

📺 Channel:
👉 [https://youtube.com/@gokul-coder](https://youtube.com/@gokul-coder)

No voice.
No face cam.
Just clean Flutter coding.

---

<!--
## 📄 License
This project is open-source and intended for learning and practice.
-->
