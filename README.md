# To-Do List SwiftUI App

A simple To-Do list app built using SwiftUI. The app allows users to add tasks, mark them as completed, and sort them based on their completion status. It also supports dark mode.

## Features

- **Add Tasks**: Users can add tasks to the to-do list using a text input field and a button.
- **Mark Tasks as Completed**: Each task has a checkbox that users can click to mark the task as completed.
- **Sort Tasks**: Tasks are sorted such that incomplete tasks appear at the top of the list, and completed tasks are at the bottom.
- **Dark Mode Support**: The app supports dark mode, and users can toggle between dark and light modes using a switch.

## How It Works

- The app uses a `List` to display tasks, which are stored in an array of `Task` structs. Each task has an `id`, `title`, and `isCompleted` status.
- Users can add new tasks via a `TextField`, and the tasks are displayed in a list. A checkbox button allows toggling the completion status of each task.
- The tasks are sorted so that incomplete tasks appear first, followed by completed ones.
- The app supports dark mode, and the user can toggle between light and dark modes using a `Toggle` in the app's toolbar.

## Screenshots
<img width="336" alt="Screenshot 1446-09-10 at 2 30 40 PM" src="https://github.com/user-attachments/assets/61d781fb-d79d-4f6e-98e9-e7806912e86f" />



