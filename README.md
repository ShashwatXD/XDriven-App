XDriven - Server-Driven UI Flutter App
XDriven is a powerful Flutter application built around a Server-Driven UI (SDUI) architecture. Unlike traditional applications where UI components are hardcoded, XDriven dynamically renders its entire interface from JSON data fetched from your backend.
Features

Dynamic UI from JSON - Render entire screens and UI components from server-provided JSON
Zero-update UI Changes - Update layouts, content, and designs without pushing app updates
Custom Widget System - Extensive library of customizable widgets controlled through JSON properties
Backend-driven Navigation - Control app flow and navigation directly from your server
Animation Support - Add fade-ins, transitions, and other animations through JSON configuration
Full Routing System - Define and control routes without hardcoding screens

How It Works
XDriven follows a server-driven architecture where:

The app requests UI data from your backend API
The server responds with JSON describing screens, widgets, and actions
XDriven's renderer system translates this JSON into native Flutter widgets
User interactions trigger actions defined in the JSON (navigation, API calls, etc.)

Quick Start
# Clone the repository
git clone https://github.com/yourusername/xdriven.git

# Navigate to project directory
cd xdriven

# Install dependencies
flutter pub get

# Run the app
flutter run
