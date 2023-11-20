# User Management Project

This project is a basic user management system implemented in Swift using SwiftUI and SQLite for data storage.

## Features

- View a list of users with their details.
- Add new users with user ID, first name, last name, email, phone number, and address.
- Edit existing user details.
- Delete users from the database.

## Installation

1. Clone or download the repository.
2. Open the project in Xcode.
3. Build and run the application on your iOS device or simulator.

## Usage

### EntryView

- The `EntryView` serves as the initial screen with a navigation link to the `UserListView`.

### UserListView

- Displays a list of users fetched from the SQLite database.
- Each user item provides a navigation link to the `EditUserView`.

### NewUserProfileView

- Allows the addition of a new user with various details.
- Validates user input for proper formatting and uniqueness of user ID.

### EditUserView

- Provides a form to edit the details of an existing user.
- Validates user input for proper formatting.

## Database Management

- The `DatabaseManager` class handles the SQLite database setup, user table creation, insertion, deletion, and updating user records.

## View Models

- `UserListViewModel`, `NewUserProfileViewModel`, `EditUserViewModel`, and `UserListItemViewModel` manage data flow and user interactions for their respective views.

## Dependencies

- Swift 5
- SwiftUI
- SQLite

## Contribution

Contributions and suggestions are welcome. Feel free to open an issue or create a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

