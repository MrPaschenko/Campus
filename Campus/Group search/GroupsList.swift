import SwiftUI

extension String {
    func load() -> UIImage {
        
        do {
            guard let url = URL(string: self) else { return UIImage() }
            
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        
        return UIImage()
    }
}

struct GroupsList: View {
    @State var groupName = "ІП-04"
    @State var groups: [Group] = []
    
    var body: some View {
        if groups.isEmpty {
            Text("Searching...")
                .onAppear {
                    GroupsApi().getGroups(name: groupName) { groups in
                        self.groups = groups
                    }
                }
        } else {
            List(groups) { group in
                HStack {
                    let url: String = (group.curator?.photo)!
                    Image(uiImage: url.load())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    VStack(alignment: .leading) {
                        let groupName = group.name ?? ""
                        Text(groupName)
                            .font(.headline)
                        
                        let cathedraName = group.cathedra?.name ?? ""
                        Text(cathedraName)
                            .font(.subheadline)

                        let curatorName = group.curator?.fullName ?? ""
                        Text(curatorName)
                        
                        let curatorLink = group.curator?.profile ?? ""
                        if (curatorLink != "") {
                            Link(destination: URL(string: curatorLink)!) {
                                Text((group.curator?.profile)!)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Groups")
        }
    }
}

struct GroupsList_Previews: PreviewProvider {
    static var previews: some View {
        GroupsList()
    }
}
