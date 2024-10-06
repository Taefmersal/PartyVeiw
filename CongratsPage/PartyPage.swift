
import SwiftUI

// Ensure you have your GIFImage implementation

struct PartyPageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Overlay the GIF on top of everything
                GIFImage(name: "Celebrate")
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
    
                    .scaleEffect(1.30)// Move the GIF up by 50 points
                    //.clipped() // This ensures it stays within bounds if needed
                    
                // Main content
                VStack {
                    // Top bar with cancel button on the right
                    HStack {
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "x.circle")
                                .foregroundColor(Color.bluem)

                                .font(.title)
                                .bold()
                        }
                        .padding(.trailing, -100)
                        .padding(.top,-50)
                    }
                    .padding(.top, geometry.safeAreaInsets.top)
                    .padding()

                    // Main content texts
                    Text("تهانينا")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.blackm)
                    
                    Text("لقد انتهيت من المستوى الثاني ")
                        .font(.title2)
                        .foregroundColor(.blackm)
                        .padding(.bottom, 30)

                    // Image in the center
                    Image("Party")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 246.72, height: 330)
                        .padding(.bottom, 130)

                    // Buttons at the bottom
                    HStack {
                        Button(action: {
                            // Previous button action
                        }) {
                            VStack {
                                Image(systemName: "arrow.circlepath")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.bluem)
                                    .bold()
                                
                                
                                Text("مراجعة الدرس")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.bluem)
                            }
                            .padding()
                            .frame(width: 140, height: 60)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.bluem, lineWidth: 3)
                            )
                            .cornerRadius(10)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Next button action
                        }) {
                            VStack {
                                Image(systemName: "play.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.whitem)
                                
                                Text("ابدا الدرس التالي")
                                    .font(.system(size: 14))
                                    .foregroundColor(.whitem)
                            }
                            .padding()
                            .frame(width: 140, height: 60)
                            .background(Color.bluem)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.top, -20) // Optional: add some space between the buttons and the texts
                }
                .padding(.horizontal, geometry.size.width * 0.1) // Dynamic padding for better fit
            }
        }
        .padding()
        .edgesIgnoringSafeArea(.all) // To handle safe area insets on iPhones with notches
    }
}

// Preview struct for SwiftUI Preview
struct PartyPageView_Previews: PreviewProvider {
    static var previews: some View {
        PartyPageView()
    }
}
