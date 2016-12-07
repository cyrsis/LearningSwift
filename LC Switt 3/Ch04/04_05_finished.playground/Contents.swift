
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

var schoolBusStudents: Set = ["Kayleigh", "Kayla", "Boz"]

schoolBusStudents.isSubset(of: students)

schoolBusStudents.isStrictSubset(of: students)

students.isSuperset(of: schoolBusStudents)

students.isStrictSuperset(of: schoolBusStudents)

schoolBusStudents.isDisjoint(with: students)

schoolBusStudents.insert("Lilli")

schoolBusStudents.insert("Carlee")

print(students.intersection(schoolBusStudents))

print(students.symmetricDifference(schoolBusStudents))

print(students.union(schoolBusStudents))

print(students.subtracting(schoolBusStudents))

print(students)

students.subtract(schoolBusStudents)

print(students)

students.formUnion(schoolBusStudents)
