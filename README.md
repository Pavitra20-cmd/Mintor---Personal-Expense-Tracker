
# 💸 Flutter Finance Tracker App

A modern and elegant expense tracking application built with Flutter. This app allows users to add, view, and analyze their monthly expenses through clean UI and insightful charts — all while keeping data locally stored on the device.

## 📱 Features

- 📊 **Statistics Screen**: Visual representation of spending using charts
- ➕ **Add Expenses**: Simple form to input and categorize expenses
- 🏠 **Home Screen**: Overview of total expenses and categories
- 🔄 **Bottom Navigation Bar**: Smooth screen switching
- 🎨 **Custom Theme**: Clean and consistent UI using custom theming
- 📁 **Local Storage**: Data is stored on the device using Hive (or similar)

## 🖼️ Screens

- **Home** – Displays a summary of recent expenses
- **Add Expense** – Add a new transaction with amount, date, and category
- **Statistics** – Visualize spending habits using a pie chart

## 📂 Project Structure

```
lib/
├── main.dart                  # Entry point
├── Screens/                   # All app screens
│   ├── add.dart
│   ├── home.dart
│   └── statistics.dart
├── data/                      # Models and helpers
│   ├── model/
│   │   ├── add_date.dart
│   │   └── add_date.g.dart
│   ├── 1.dart
│   ├── listdata.dart
│   └── utlity.dart
├── widgets/                   # Reusable UI components
│   ├── bottomnavigationbar.dart
│   └── chart.dart
├── theme/
│   └── theme.dart             # Custom app theme
```

## 📦 Dependencies

These are a few notable dependencies defined in `pubspec.yaml`:

- `flutter`
- `hive` / `hive_flutter` (for local data storage)
- `fl_chart` or similar (for pie chart visualization)
- `intl` (for date formatting)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- A device or emulator set up

### Run Locally

```bash
git clone https://github.com/yourusername/flutter-finance-tracker.git
cd flutter-finance-tracker
flutter pub get
flutter run
```

## 📸 Screenshots

*Add screenshots in the `/screenshots` folder and link them here.*

| Home Screen | Add Expense | Statistics |
|-------------|-------------|------------|
| ![home](screenshots/home.png) | ![add](screenshots/add.png) | ![stats](screenshots/statistics.png) |

## 🔮 Future Enhancements

- Budget setting and alerts
- Monthly report generation (PDF)
- Dark/light mode toggle
- Cloud sync and login

## 👨‍💻 Author

**Your Name** – [@yourgithub](https://github.com/yourgithub)

## 📃 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.
