import SwiftUI

struct TeacherSearchView: View {
    @State var teacherName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(text: $teacherName, prompt: Text("Teacher")) {
                    Text("Ткаченко")
                }
                .padding()
                .frame(width: 200)
                .background(.bar)
                .cornerRadius(15)
                
                NavigationLink(destination: TeachersList(teacherName: teacherName)) {
                    Text("Search")
                }
                .padding()
                .frame(width: 200)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            .navigationTitle("Teacher search")
        }
        
    }
}

struct TeacherSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherSearchView()
    }
}
