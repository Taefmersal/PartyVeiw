import SwiftUI

struct StartLessonView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                // Greeting Text
                Text("استمع و كرّر لتتعلم")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .foregroundColor(.black)
                
                Text("مرحباً بك في رحلة تعلم التحايا بالصينية!")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.bottom, 60)
                
                Spacer(minLength: 50)

                // Image
                Image("StartMando")
                    .resizable()
                    .frame(width:344.13, height:402, alignment: .center)
                
                Spacer(minLength: 100)

                // Button to start lesson
                NavigationLink(destination:LessonOne()) {
                    Text("ابدأ الدرس")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 315, height: 50, alignment: .center)
                        .background(Color.bluem)
                        .cornerRadius(20)
                }

                Spacer()
            }
        }
    }
}

struct StartLessonView_Previews: PreviewProvider {
    static var previews: some View {
        StartLessonView()
    }
}
