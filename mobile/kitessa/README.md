# E-Commerce Mobile App

## Overview

The **E-Commerce Mobile App** is a feature-rich application built with Clean Architecture principles. It provides a seamless shopping experience with efficient data handling, offline support, and a well-structured codebase for maintainability and scalability.

## Architecture

The app follows **Clean Architecture**, dividing responsibilities into three main layers:

1. **Presentation Layer**:
   - Contains UI components and state management using **BLoC (Business Logic Component)**
   - Handles user interactions and updates UI based on state changes
2. **Domain Layer**:
   - Defines core business logic, entities, and use cases
   - Acts as an intermediary between presentation and data layers
3. **Data Layer**:
   - Manages repositories and data sources (local and remote)
   - Implements caching mechanisms for offline support

## Data Flow

1. **User Interaction**: UI triggers an event (e.g., loading products)
2. **State Management**: BLoC processes the event and invokes the appropriate use case
3. **Business Logic Execution**: Use case coordinates data retrieval or modification via repository
4. **Data Handling**: Repository determines data source (remote API or local database)
5. **Response Delivery**: Data flows back through the chain to update the UI

## Key Features

- **Product Management**: Create, Read, Update, and Delete (CRUD) operations for products
- **Network Awareness**: Detects network status and fetches data accordingly
- **State Management with BLoC**: Ensures predictable UI behavior and event-driven data flow

## Testing Strategy

- **Unit Testing**: Covers models, use cases, and repositories
- **Mock Implementations**: Utilizes mock data for isolated testing
- **Integration Testing**: Ensures seamless interaction between layers
- **Test Coverage**: Focuses on all critical paths to ensure reliability

## Getting Started

### Prerequisites

- Install **Flutter SDK** and set up development environment
- Ensure **Dart** is installed
- Set up **Android Emulator** or **iOS Simulator**

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/kitessafikadu/2024-project-phase-mobile-tasks.git
   cd 2024-project-phase-mobile-tasks/mobile/kitessa
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```
