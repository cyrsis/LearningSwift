
var teachers = Set<String>()

var staff: Set<String> = []

var students: Set = ["Charlotte", "Laura", "Kayleigh", "Kayla", "Nathan", "Boz", "Charlotte"]

print(students)

students.count

teachers.isEmpty

students.contains("Charlotte")

let indexOfCharlotte = students.index(of: "Charlotte")

students[indexOfCharlotte!]

students.insert("Bob")

let result = students.insert("Bob")

let removed = students.remove("Bob")

let arrayOfStudents = Array(students).sorted()

