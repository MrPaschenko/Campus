import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GroupSearchView()
                .tabItem {
                    Image(systemName: "person.3.sequence")
                    Text("Group curator search")
                }
            
            TeacherSearchView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Teacher search")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
