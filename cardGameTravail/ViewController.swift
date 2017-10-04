//-------------------
import UIKit
//-------------------
class ViewController: UIViewController {
    
    //SCORE BOARD ----------------------------
    @IBOutlet weak var scoreBoard: UITextView!
    //----------------------------------------
    
    //BACK AND FRONT -------------------------
    @IBOutlet weak var back_1: UIView!
    @IBOutlet weak var front_1: UIView!
    @IBOutlet weak var back_2: UIView!
    @IBOutlet weak var front_2: UIView!
    @IBOutlet weak var back_3: UIView!
    @IBOutlet weak var front_3: UIView!
    @IBOutlet weak var back_4: UIView!
    @IBOutlet weak var front_4: UIView!
    @IBOutlet weak var back_5: UIView!
    @IBOutlet weak var front_5: UIView!
    @IBOutlet weak var back_6: UIView!
    @IBOutlet weak var front_6: UIView!
    @IBOutlet weak var back_7: UIView!
    @IBOutlet weak var front_7: UIView!
    @IBOutlet weak var back_8: UIView!
    @IBOutlet weak var front_8: UIView!
    @IBOutlet weak var back_9: UIView!
    @IBOutlet weak var front_9: UIView!
    @IBOutlet weak var back_10: UIView!
    @IBOutlet weak var front_10: UIView!
    @IBOutlet weak var back_11: UIView!
    @IBOutlet weak var front_11: UIView!
    @IBOutlet weak var back_12: UIView!
    @IBOutlet weak var front_12: UIView!
    //----------------------------------------
    
    //IMAGES ---------------------------------
    @IBOutlet weak var imgView_1: UIImageView!
    @IBOutlet weak var imgView_2: UIImageView!
    @IBOutlet weak var imgView_3: UIImageView!
    @IBOutlet weak var imgView_4: UIImageView!
    @IBOutlet weak var imgView_5: UIImageView!
    @IBOutlet weak var imgView_6: UIImageView!
    @IBOutlet weak var imgView_7: UIImageView!
    @IBOutlet weak var imgView_8: UIImageView!
    @IBOutlet weak var imgView_9: UIImageView!
    @IBOutlet weak var imgView_10: UIImageView!
    @IBOutlet weak var imgView_11: UIImageView!
    @IBOutlet weak var imgView_12: UIImageView!
    //----------------------------------------
    
    //CARDS ----------------------------------
    @IBOutlet weak var card_1: UIView!
    @IBOutlet weak var card_2: UIView!
    @IBOutlet weak var card_3: UIView!
    @IBOutlet weak var card_4: UIView!
    @IBOutlet weak var card_5: UIView!
    @IBOutlet weak var card_6: UIView!
    @IBOutlet weak var card_7: UIView!
    @IBOutlet weak var card_8: UIView!
    @IBOutlet weak var card_9: UIView!
    @IBOutlet weak var card_10: UIView!
    @IBOutlet weak var card_11: UIView!
    @IBOutlet weak var card_12: UIView!
    //----------------------------------------
    
    //Reset Button ---------------------------
    @IBOutlet weak var resetButton: UIButton!
    //----------------------------------------
    
    //VARIABLES ------------------------------
    var arrayOfImagesViews: [UIImageView]!
    var arrayOfAnimalNames: [String]!
    var arrayOfRandomAnimalNames = [String]()
    
    var arrayChosenCards = [String]()
    var arrayChosenViews = [UIView]()
    
    var arrayOfShowingBacks = [UIView]()
    var arrayOfHidingFronts = [UIView]()
    
    var score = 0
    var gameReset = 0
    
    var arrayOfCards: [AnyObject]!
    //----------------------------------------
    
    //TIMER ----------------------------------
    var time = 0
    var timer = Timer()
    var cardCounter = 1 // Number the CARDS
    var cardSequence = 0 // Number the CARDS IN SEQUENCE
    //----------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfCards = [back_1,back_2,back_3,back_4,back_5,back_6,back_7,back_8,back_9,back_10,back_11,back_12]
        styleCards(border: 3) // Ajouter border pour les cards
        arrayOfAnimalNames = ["panda.png", "panda.png", "fox.png", "fox.png","snake.png","snake.png", "whale.png", "whale.png", "octopus.png","octopus.png","owl.png","owl.png"]
        arrayOfImagesViews = [imgView_1,imgView_2,imgView_3,imgView_4,imgView_5,imgView_6,imgView_7,imgView_8,imgView_9,imgView_10,imgView_11,imgView_12]
        randomAnimal()
        setImagesToCard ()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.jpg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    //SHOW CARD--------------------------------
    //This function show the cards when you click
    @IBAction func showCard(_ sender: UIButton) {
        if arrayOfHidingFronts.count == 2 {
            return
        }
        
        resetButton.isEnabled=false //Bloquer le bouton reset
        print(sender.tag)
        switch sender.tag {
            case 0:
                flipCard(from: front_1, to: back_1)
                arrayOfShowingBacks.append(back_1)
                arrayOfHidingFronts.append(front_1)
                arrayChosenCards.append(arrayOfRandomAnimalNames[0])
                arrayChosenViews.append(card_1)
            case 1:
                flipCard(from: front_2, to: back_2)
                arrayOfShowingBacks.append(back_2)
                arrayOfHidingFronts.append(front_2)
                arrayChosenCards.append(arrayOfRandomAnimalNames[1])
                arrayChosenViews.append(card_2)
            case 2:
                flipCard(from: front_3, to: back_3)
                arrayOfShowingBacks.append(back_3)
                arrayOfHidingFronts.append(front_3)
                arrayChosenCards.append(arrayOfRandomAnimalNames[2])
                arrayChosenViews.append(card_3)
            case 3:
                flipCard(from: front_4, to: back_4)
                arrayOfShowingBacks.append(back_4)
                arrayOfHidingFronts.append(front_4)
                arrayChosenCards.append(arrayOfRandomAnimalNames[3])
                arrayChosenViews.append(card_4)
            case 4:
                flipCard(from: front_5, to: back_5)
                arrayOfShowingBacks.append(back_5)
                arrayOfHidingFronts.append(front_5)
                arrayChosenCards.append(arrayOfRandomAnimalNames[4])
                arrayChosenViews.append(card_5)
            case 5:
                flipCard(from: front_6, to: back_6)
                arrayOfShowingBacks.append(back_6)
                arrayOfHidingFronts.append(front_6)
                arrayChosenCards.append(arrayOfRandomAnimalNames[5])
                arrayChosenViews.append(card_6)
            case 6:
                flipCard(from: front_7, to: back_7)
                arrayOfShowingBacks.append(back_7)
                arrayOfHidingFronts.append(front_7)
                arrayChosenCards.append(arrayOfRandomAnimalNames[6])
                arrayChosenViews.append(card_7)
            case 7:
                flipCard(from: front_8, to: back_8)
                arrayOfShowingBacks.append(back_8)
                arrayOfHidingFronts.append(front_8)
                arrayChosenCards.append(arrayOfRandomAnimalNames[7])
                arrayChosenViews.append(card_8)
            case 8:
                flipCard(from: front_9, to: back_9)
                arrayOfShowingBacks.append(back_9)
                arrayOfHidingFronts.append(front_9)
                arrayChosenCards.append(arrayOfRandomAnimalNames[8])
                arrayChosenViews.append(card_9)
            case 9:
                flipCard(from: front_10, to: back_10)
                arrayOfShowingBacks.append(back_10)
                arrayOfHidingFronts.append(front_10)
                arrayChosenCards.append(arrayOfRandomAnimalNames[9])
                arrayChosenViews.append(card_10)
            case 10:
                flipCard(from: front_11, to: back_11)
                arrayOfShowingBacks.append(back_11)
                arrayOfHidingFronts.append(front_11)
                arrayChosenCards.append(arrayOfRandomAnimalNames[10])
                arrayChosenViews.append(card_11)
            case 11:
                flipCard(from: front_12, to: back_12)
                arrayOfShowingBacks.append(back_12)
                arrayOfHidingFronts.append(front_12)
                arrayChosenCards.append(arrayOfRandomAnimalNames[11])
                arrayChosenViews.append(card_12)
        default:
            break
        }
        
        verification()
        
    }
    //RESET CARDS -----------------------------
    //Réinitialiser les cartes que vous cliquer.
    func resetCard() {
        if arrayOfShowingBacks.count == 2 {
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(reflip)), userInfo: nil, repeats: false)
        }
    }
    
    @objc func reflip() {
        for index in 0..<arrayOfShowingBacks.count {
            flipCard(from: arrayOfShowingBacks[index], to: arrayOfHidingFronts[index])
        }
        arrayOfHidingFronts = []
        arrayOfShowingBacks = []
        self.resetButton.isEnabled=true // Montre le reset button après choisir les deux cards
    }
    
    
    //FLIP CARDS---------------------------------
    func flipCard(from:UIView, to:UIView) {
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromTop, .showHideTransitionViews]
        
        UIView.transition(with: from, duration: 1.0, options: transitionOptions, animations: {
            from.isHidden=true
            //TIMER------------------------------
            if (self.cardCounter == 1) {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
                self.cardCounter += 1
            //TIMER------------------------------
            }
        })
        
        UIView.transition(with: to, duration: 1.0, options: transitionOptions, animations: {
            to.isHidden=false
            
        })
    }
    //RANDOM ANIMAIS TO CARDS------------------
    //Ajouter les animoux aléatoire à les cartes.
    func setImagesToCard () {
        var number = 0
        for imgView in arrayOfImagesViews {
            imgView.image = UIImage(named:arrayOfRandomAnimalNames[number])
            number = number + 1
        }
    }
    //RANDOM CARDS ----------------------------
    //Aléatoire toutes les cartes
    func randomAnimal() {
        let numberOfAnimal = arrayOfAnimalNames.count
        
        for _ in 1...numberOfAnimal {
            let randomNumber = Int(arc4random_uniform(UInt32(arrayOfAnimalNames.count)))
            arrayOfRandomAnimalNames.append(arrayOfAnimalNames[randomNumber])
            arrayOfAnimalNames.remove(at: randomNumber)
        }
        
    }
    //VERIFICATION-----------------------------
    //Faire la verification de deux cartes egales et count le score
    func verification(){
        if arrayChosenCards.count == 2 {
            if arrayChosenCards[0] == arrayChosenCards[1] {
                
                //SCORE -------------------
                Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(hideCards)), userInfo: nil, repeats: false)
                score += (100)*(100/(1+time))*(1+cardSequence)+100
                scoreBoard.text = String(score)
                cardSequence += 1
                gameReset += 1
                //--------------------------
                
                //Animation de le button resert après le game est fini
                if (gameReset == 6) {
                    resetButton.transform=CGAffineTransform(scaleX: 0.1, y: 0.1)
                    UIView.animate(withDuration: 30, delay: 1, usingSpringWithDamping: 0.2, initialSpringVelocity: 3, options: .allowUserInteraction, animations: {[weak self] in self?.resetButton.transform = .identity}, completion: nil)
                }
                //------------------------------
            }else {
                arrayChosenViews = []
                cardSequence = 0
            }
            arrayChosenCards = []
        }
        resetCard()
    }
    //HIDE CARDS------------------------------
    @objc func hideCards() {
        arrayChosenViews[0].isHidden = true
        arrayChosenViews[1].isHidden = true
        arrayChosenViews = []
    }
    //RESET GAME OBJECT-----------------------
    @IBAction func reset(_ sender: UIButton) {
        card_1.isHidden = false
        card_2.isHidden = false
        card_3.isHidden = false
        card_4.isHidden = false
        card_5.isHidden = false
        card_6.isHidden = false
        card_7.isHidden = false
        card_8.isHidden = false
        card_9.isHidden = false
        card_10.isHidden = false
        card_11.isHidden = false
        card_12.isHidden = false
        arrayOfAnimalNames = ["panda.png", "panda.png", "fox.png", "fox.png","snake.png","snake.png", "whale.png", "whale.png", "octopus.png","octopus.png","owl.png","owl.png"]
        arrayOfRandomAnimalNames = []
        randomAnimal()
        setImagesToCard ()
        score = 0
        scoreBoard.text = String(score)
        cardCounter = 1
        time = 0
        timer.invalidate()
        timerScore.text = "0"
        cardSequence = 0
        gameReset = 0
        reflip()
        
    }
    //TIMER-----------------------------------
    @IBOutlet weak var timerScore: UILabel!
    func action() {
        time += 1
        timerScore.text = "\(time)"
    }
    //STYLE de les CARDS ---------------------
    
    func styleCards(border: CGFloat) {
        for kitObject in arrayOfCards {
            kitObject.layer.borderWidth = border
        }
    }
    //----------------------------------------
}

