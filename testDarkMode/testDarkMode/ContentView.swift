import SwiftUI

// Task model with unique ID, title, and completion status
struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}

struct ContentView: View {
    @State private var tasks: [Task] = [] // List of tasks
    @State private var newTask: String = "" // Text field input
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false // Persist dark mode setting

    // Sort tasks so completed ones appear at the bottom
    var sortedTasks: [Task] {
        tasks.sorted { !$0.isCompleted && $1.isCompleted }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Input field and add button
                HStack {
                    TextField("Enter new task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: addTask) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .disabled(newTask.trimmingCharacters(in: .whitespaces).isEmpty) // Prevent empty task addition
                }

                // Task list
                List {
                    ForEach(sortedTasks) { task in
                        HStack {
                            // Completion button (toggle)
                            Button(action: { toggleTaskCompletion(task) }) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompleted ? .green : .gray)
                            }
                            .buttonStyle(BorderlessButtonStyle())

                            // Task title (strikethrough if completed)
                            Text(task.title)
                                .strikethrough(task.isCompleted, color: .gray)
                                .foregroundColor(task.isCompleted ? .gray : .primary)
                        }
                    }
                    .onDelete(perform: deleteTask) // Enable swipe-to-delete
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("To-Do List") // Navigation bar title
            .toolbar {
                // Dark mode toggle button in the navigation bar
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isDarkMode.toggle() // Toggle dark mode state
                    }) {
                        Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                            .foregroundColor(isDarkMode ? .yellow : .blue)
                    }
                }
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light) // Apply dark mode preference
    }

    // Function to add a new task
    func addTask() {
        if !newTask.isEmpty {
            tasks.append(Task(title: newTask, isCompleted: false))
            newTask = "" // Clear input field after adding
        }
    }

    // Function to toggle task completion status
    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    // Function to delete tasks
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

// Preview provider for SwiftUI previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
