import SwiftUI

struct Curator: Codable, Identifiable {
    var userIdentifier: String?
    var fullName: String?
    var photo: String?
    var credo: String?
    var profile: String?
    var id: Int
}

struct Cathedra: Codable, Identifiable {
    var name: String?
    var id: Int
}

struct Group: Codable, Identifiable {
    var curator: Curator?
    var cathedra: Cathedra?
    var name: String?
    var id: Int
}

class GroupsApi {
    func getGroups(name: String, completion: @escaping ([Group]) -> ()) {
        let escapedName = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        guard let url = URL(string: "https://api.campus.kpi.ua/group/find?name=\(escapedName!)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let groups = try! JSONDecoder().decode([Group].self, from: data!)
            
            DispatchQueue.main.async {
                completion(groups)
            }
        }
        .resume()
    }
}
