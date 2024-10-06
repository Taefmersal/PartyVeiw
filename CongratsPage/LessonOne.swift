import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "goodmorning", withExtension: ".m4a") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

struct LessonOne: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var audioPlayer: AVAudioPlayer?
    
    // State variable to track progress
    @State private var currentStep: Int = 1
    @State private var navigateToNextView = true  // Variable to manage navigation
    
    let totalSteps = 9
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    // Top bar with cancel button
                    HStack {
                        Spacer()
                        Button(action: {
                            // Dismiss the view
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .foregroundColor(.bluem)
                        }
                        .padding(.trailing)
                    }
                    .padding(.top, geometry.safeAreaInsets.top)
                    
                    // Custom Progress Bar with moving image
                    ZStack(alignment: .leading) {
                        ProgressView(value: Double(currentStep), total: Double(totalSteps))
                            .progressViewStyle(LinearProgressViewStyle(tint: Color.redm))
                            .scaleEffect(x:1,y:2,anchor: .center)
                            .frame(width: geometry.size.width * 0.7)
                        
                        // Calculating image position based on progress
                        Image("mando")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .offset(x: geometry.size.width * 0.6 * CGFloat(currentStep - 1) / CGFloat(totalSteps - 1))  // Dynamic horizontal movement
                    }
                    .padding()

                    
                    // Progress counter (current step/total steps)
                    Text("\(currentStep)/\(totalSteps)")
                        .padding(.bottom)
                    
                    // Square with image and text inside
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.bluem, lineWidth: 3)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.7)
                            
                        
                        VStack {
                            Text("早上好")
                                .font(.largeTitle)
                                .padding(.bottom, 10)
                            
                            Image(systemName: "sun.max.fill")
                                .font(.system(size: geometry.size.width * 0.3))
                                .foregroundColor(.yellow)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    // Arabic pronunciation and translation
                    Text("(زاو شانغ هاو)")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding(.bottom, 2)
                    
                    Text("صباح الخير")
                        .font(.title)
                     
                    // Speaker button for audio
                    Button(action: {
                        // Play sound
                        SoundManager.instance.playSound()
                    }) {
                        Image(systemName: "speaker.wave.2.circle.fill")
                                                .resizable()
                                                .foregroundColor(.bluem)
                                                .frame(width:73, height:73 )
                                                .padding()
                                                .bold()
                                                .offset(y:-2)
                    }

                    // Navigation buttons
                    HStack {
                        Spacer()
                        
                        // Next button with right arrow
                        Button(action: {
                            // Increment progress and navigate to next view
                            if currentStep < totalSteps {
                                currentStep += 1
                                navigateToNextView = true
                            }
                        }) {
                            HStack {
                                
                                Text("التالي")
                                    .font(.title2)
                                Image(systemName: "chevron.right")  // Right arrow
                            }
                            .padding()
                            .foregroundColor(.white)
                            .frame(minWidth: geometry.size.width * 0.3)
                            .background(Color.bluem)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, geometry.size.width * 0.1)
                    
//                    // NavigationLink to next view
//                    NavigationLink(destination: lessontwo(), isActive: $navigateToNextView) {
//                        EmptyView()
//                    }
                }
                .padding()
                .navigationBarBackButtonHidden(false)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct LessonOne_Previews: PreviewProvider {
    static var previews: some View {
        LessonOne()
            .previewDevice("iPhone 15 Pro")
    }
}
