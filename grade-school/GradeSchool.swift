import Foundation

typealias School = [Int:[String]]

class GradeSchool {
    var db: School
    
    init() {
        db = School()
    }
    
    
    func addStudent(student: String, grade: Int) {
        if db[grade] != nil {
            db[grade]!.append(student)
        } else {
            db[grade] = [student]
        }
    }
    
    func studentsInGrade(grade: Int) -> [String] {
        return ((db[grade] != nil) ? db[grade]! : [])
    }
    
    func sortedRoster() -> School {
        var sorted = School()
        for k in db.keys.sort() {
            sorted[k] = db[k]!.sort()
        }
        return sorted
    }
}