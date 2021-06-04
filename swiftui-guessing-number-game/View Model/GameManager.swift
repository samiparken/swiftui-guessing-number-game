import Foundation

class GameManager: ObservableObject {
    
    @Published var gameModel: GameModel = GameModel(
        id: UUID(),
        answerNumber: 0,
        life: 10)
    
    @Published var result: String = ""
    @Published var hearts: String = ""
    @Published var buttonText: String = "TRY"
    
    init() {
        initAnswerNumber()
        refreshHearts()
    }
    
    func initAnswerNumber() {
        let ranNum = Int.random(in: 0...99)
        gameModel.answerNumber = ranNum
    }
    
    func refreshHearts() {
        hearts = ""
        if (gameModel.life <= 0) {return}
        
        for _ in 1...gameModel.life {
            hearts += "❤️"
        }
    }
    
    func tryGuessing(numString: String) {
        let num = Int(numString) ?? 0
        
        if (buttonText == "Restart") {
            buttonText = "TRY"
            resetGame()
            return
        }
        
        if (num == gameModel.answerNumber) {
            result = "🎉🎉🎉🎉"
            buttonText = "Restart"
        } else {
            result = (num < gameModel.answerNumber) ? "⬆️" : "⬇️"
            decreaseLife()
        }
    }
    
    func decreaseLife() {
        gameModel.life -= 1
        refreshHearts()
        if (gameModel.life <= 0)
        {
            //game over
            result = "Game Over"
            buttonText = "Restart"
            return
        }
    }
    
    func resetGame() {
        result = "Guess Number 0~99"
        buttonText = "TRY"
        gameModel = GameModel(
            id: UUID(),
            answerNumber: 0,
            life: 10)
        refreshHearts()
    }
}
