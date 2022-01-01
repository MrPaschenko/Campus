import SwiftUI

struct Paging: Codable {
    let PageCount: Int?
    let TotalItemCount: Int?
    let PageNumber: Int?
    let PageSize: Int?
    let HasPreviousPage: Bool?
    let HasNextPage: Bool?
    let IsFirstPage: Bool?
    let IsLastPage: Bool?
    let FirstItemOnPage: Int?
    let LastItemOnPage: Int?
}

struct Subdivision: Codable, Identifiable {
    let Url: String?
    let Logo: String?
    let Address: String?
    let Name: String?
    let Id: Int
    
    var id: Int { Id }
}

struct Position: Codable, Identifiable {
    let Name: String?
    let Subdivision: Subdivision?
    let Employment: Int?
    
    var id: Int { Subdivision!.id }
}

//TODO: find out what it is
struct Field: Codable {}

//TODO: find out what it is
struct Item: Codable {}

struct Teacher: Codable, Identifiable {
    let Positions: [Position]?
    let Fields: Field?
    let Status: String?
    let Items: [Item]?
    let ScientificInterest: String?
    let AcademicDegree: String?
    let AcademicStatus: String?
    let ContactRecords: String? //may not be String
    let IsConfirmed: Bool?
    let UserIdentifier: String
    let FullName: String?
    let Photo: String?
    let Credo: String?
    let Profile: String?
    let Id: Int?
    
    var id: String { UserIdentifier } //use UserIdentifier instead of id because id is sometimes 0
}

struct TeacherData: Codable {
    let Paging: Paging?
    let Data: [Teacher]
}

class TeachersApi {
    func getTeachers(name: String, completion: @escaping (TeacherData) -> ()) {
        let escapedName = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let pageNumber = 1
        let pageSize = 10 + 1
        
        guard let url = URL(
            string: "https://api.campus.kpi.ua/Intellect/Find?value=\(escapedName!)&pageNumber=\(pageNumber)&pageSize=\(pageSize)"
        ) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let teacherData = try! JSONDecoder().decode(TeacherData.self, from: data!)
            DispatchQueue.main.async {
                completion(teacherData)
            }
        }
        .resume()
    }
}
