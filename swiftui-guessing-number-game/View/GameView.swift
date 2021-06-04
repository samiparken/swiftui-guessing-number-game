import SwiftUI

struct GameView: View {

    //MARK: - PROPERTIES
    @ObservedObject var gameManager: GameManager
    @State var inputString: String = ""

    //MARK: - BODY
    var body: some View {
        
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15),
                                radius: 8, x: 6, y: 8)
                        .padding([.leading, .trailing, .bottom], 100)
                    
                    Text(gameManager.result)
                        .padding()
                        .font(.title)
                    
                    TextField("Input number between 0~99", text: $inputString)
                        .padding()
                        .background(Color.white.opacity(0.5).cornerRadius(10))
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.black)
                        .font(.headline)
                        .multilineTextAlignment(.center)

                    Button(action: {
                        gameManager.tryGuessing(numString: inputString)
                        inputString = ""
                    }, label: {
                        Text(gameManager.buttonText)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                    })
                    .padding([.leading, .trailing], 20)
                    
                    Text(gameManager.hearts)
                        .font(.title)
                    
                }//:VStack
                .navigationTitle("Guessing Game")
            }//:ZStack
        }//:NavigationView
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameManager: GameManager())
    }
}
