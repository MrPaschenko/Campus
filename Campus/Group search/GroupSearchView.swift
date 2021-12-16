import SwiftUI

struct GroupSearchView: View {
    @State var groupName = "ІП-04"
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(text: $groupName, prompt: Text("Group")) {
                    Text("ІП-04")
                }
                .padding()
                .frame(width: 200)
                .background(.bar)
                .cornerRadius(15)
                
                NavigationLink(destination: GroupsList(groupName: groupName)) {
                    Text("Search")
                }
                .padding()
                .frame(width: 200)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            .navigationTitle("Group search")
        }
        
    }
}

struct GroupSearchView_Previews: PreviewProvider {
    static var previews: some View {
        GroupSearchView()
    }
}
