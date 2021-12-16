import SwiftUI

struct TeachersList: View {
    @State var teacherName = ""
    @State var teachers: [Teacher] = []
    
    var body: some View {
        if teachers.isEmpty {
            Text("Searching...")
                .onAppear {
                    TeachersApi().getTeachers(name: teacherName) { TeacherData in
                        self.teachers = TeacherData.Data
                        print(teachers)
                    }
                }
        } else {
            List(teachers) { teacher in
                HStack {
                    let url: String = (teacher.Photo)!
                    Image(uiImage: url.load())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)

                    VStack(alignment: .leading) {
                        let teacherName = teacher.FullName ?? ""
                        Text(teacherName)
                            .font(.headline)
                        
                        ForEach(teacher.Positions!) { position in
                            Text("\((position.Subdivision?.Name) ?? "Кафедра") — \((position.Name) ?? "Викладач")")
                                .font(.subheadline)
                        }
                        
                        let link = teacher.Profile!
                        Link(destination: URL(string: link)!) {
                            Text(link)
                        }
                    }
                }
            }
            .navigationTitle("Teachers")
        }
    }
}

struct TeachersList_Previews: PreviewProvider {
    static var previews: some View {
        TeachersList()
    }
}
