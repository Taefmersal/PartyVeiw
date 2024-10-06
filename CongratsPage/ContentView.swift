import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.949, green: 0.949, blue: 0.949) // F2F2F2 in RGB
                .ignoresSafeArea()
            
            VStack {
                Spacer() // Pushes content down
                
                Image("Welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fit) // Maintain aspect ratio
                    .frame(width:246.72, height: 330) // Adjust size here
                
                Text("مرحبا")
                    .font(.largeTitle)
                    .foregroundColor(.blackm) // Change to black for contrast
                
                Text("هل انت مستعد للتعلم مع ماندو ؟")
                    .font(.title)
                    .foregroundColor(.blackm) // Change to black for contrast
                
                Spacer() // Pushes button to the bottom
                
                Button(action: {
                    // Button action here
                }) {
                    Text("ابدا")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity) // Make the button full width
                        .background(Color.bluem) // Set button background color
                        .foregroundColor(.whitem) // Button text color
                        .cornerRadius(10) // Rounded corners
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.whitem) // Border color
                        )
                }
                .padding(.bottom, 20) // Add padding at the bottom
            }
            .padding() // Optional padding for better spacing
        }
    }
}

#Preview {
    ContentView()
}

