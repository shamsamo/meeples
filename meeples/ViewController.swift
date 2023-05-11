//
//  ViewController.swift
//  meeples
//
//  Created by Shamsa Mohamed on 3/2/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // view
    @IBOutlet weak var meepleViewOne: UIView!
    @IBOutlet weak var meepleViewTwo: UIView!
    @IBOutlet weak var meepleViewThree: UIView!
    @IBOutlet weak var meepleViewFour: UIView!
    // buttons
    @IBOutlet weak var changeOutletOne: UIButton!
    @IBOutlet weak var changeOutletTwo: UIButton!
    @IBOutlet weak var changeOutletThree: UIButton!
    @IBOutlet weak var changeOutletFour: UIButton!
    // images
    @IBOutlet weak var playerIconOne: UIImageView!
    @IBOutlet weak var playerIconTwo: UIImageView!
    @IBOutlet weak var playerIconThree: UIImageView!
    @IBOutlet weak var playerIconFour: UIImageView!
    // text Field
    @IBOutlet weak var playerNameOne: UITextField!
    @IBOutlet weak var playerNameTwo: UITextField!
    @IBOutlet weak var playerNameThree: UITextField!
    @IBOutlet weak var playerNameFour: UITextField!
    
    @IBOutlet weak var textViewOne: UITextView!
    
    @IBOutlet weak var textViewTwo: UITextView!
    
    @IBOutlet weak var diceRollImage: UIImageView!
    
    
    var counterOne = -1
    var counterTwo = -1
    var counterThree = -1
    var counterFour = -1
    var counterFive = -1

    var cardFlipAudioTrack = AVAudioPlayer()
    var BackgroundMusicAudioTrack = AVAudioPlayer()
    var dingMusicAudioTrack = AVAudioPlayer()
    var diceRollMusicAudioTrack = AVAudioPlayer()

    var meeples = ["meeple1","meeple2","meeple3","meeple4"]
    var diceImcfdages = ["1","2","3","4","5","6"]
//    var icons: UIImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeOutletOne.isHidden = true
        changeOutletTwo.isHidden = true
        changeOutletThree.isHidden = true
        changeOutletFour.isHidden = true
        playerNameOne.isEnabled =  false
        playerNameTwo.isEnabled =  false
        playerNameThree.isEnabled =  false
        playerNameFour.isEnabled =  false

        ac.shuffle()
        BackSound()
    }
    
    func FlipSound() {
        let path = Bundle.main.path(forResource: "cardFlip", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            cardFlipAudioTrack = try AVAudioPlayer(contentsOf: url)
            cardFlipAudioTrack.play()
        } catch {
            print("there is an issue with the audio")
        }
    }
   
    func BackSound() {
        let path = Bundle.main.path(forResource: "backgroundMusic", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            BackgroundMusicAudioTrack = try AVAudioPlayer(contentsOf: url)
            BackgroundMusicAudioTrack.play()
            BackgroundMusicAudioTrack.numberOfLoops = -1
        } catch {
            print("there is an issue with the audio")
        }
    }

    func dingSound() {
        let path = Bundle.main.path(forResource: "ding", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            dingMusicAudioTrack = try AVAudioPlayer(contentsOf: url)
            dingMusicAudioTrack.play()
        } catch {
            print("there is an issue with the audio")
        }
    }
    func diceRollSound() {
        let path = Bundle.main.path(forResource: "diceRoll", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            diceRollMusicAudioTrack = try AVAudioPlayer(contentsOf: url)
            diceRollMusicAudioTrack.play()
        } catch {
            print("there is an issue with the audio")
        }
    }
    
    
    @IBAction func buttonOne(_ sender: UIButton) {
        FlipSound()
        counterFive += 1
        if counterFive == ac.count {
            counterFive = 0
        }
        textViewOne.text = ac[counterFive][1]
    }
    @IBAction func buttonTwo(_ sender: UIButton) {
        FlipSound()
     textViewTwo.text = ac[counterFive][2]
    }
    
    
    
    @IBAction func changedTappedOne(_ sender: UIButton) {
        counterOne += 1
        if counterOne == meeples.count {
            counterOne = 0
        }
        playerIconOne.image = UIImage(named: meeples[counterOne])
    }
    @IBAction func changedTappedTwo(_ sender: UIButton) {
        counterTwo += 1
        if counterTwo == meeples.count {
            counterTwo = 0
        }
        playerIconTwo.image = UIImage(named: meeples[counterTwo])
    }
    @IBAction func changedTappedThree(_ sender: UIButton) { counterThree += 1
        if counterThree == meeples.count {
            counterThree = 0
        }
        playerIconThree.image = UIImage(named: meeples[counterThree])
    }
    @IBAction func changedTappedFour(_ sender: UIButton) {
        counterFour += 1
        if counterFour == meeples.count {
            counterFour = 0
        }
        playerIconFour.image = UIImage(named: meeples[counterFour])
    }
    
    
    
//    @IBAction func meeplePanGestOne(_ sender: UIPanGestureRecognizer) {
//        let translation = sender.translation(in: self.view)
//        if let viewToDrag = sender.view {
//            viewToDrag.center = CGPoint(x:viewToDrag.center.x + translation.x ,
//                                        y: viewToDrag.center.y + translation.y)
//            sender.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
//        }
//    }
    
    @IBAction func panGest(_ sender: UIPanGestureRecognizer) {
        dingSound()
        let translation = sender.translation(in: self.view)
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x:viewToDrag.center.x + translation.x ,
                                        y: viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
        }
    }
    
    
    @IBAction func meeplePanGestTwo(_ sender: UIPanGestureRecognizer) {
        dingSound()
        let translation = sender.translation(in: self.view)
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x:viewToDrag.center.x + translation.x ,
                                        y: viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
        }
    }
    
    
    @IBAction func meeplePanGestThree(_ sender: UIPanGestureRecognizer) {
        dingSound()
        let translation = sender.translation(in: self.view)
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x:viewToDrag.center.x + translation.x ,
                                        y: viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
        }
    }
    
    
    @IBAction func meeplePanGestFour(_ sender: UIPanGestureRecognizer) {
        dingSound()
        let translation = sender.translation(in: self.view)
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x:viewToDrag.center.x + translation.x ,
                                        y: viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
        }
    }
    
    
    
//    @IBAction func longPressOne(_ sender: UILongPressGestureRecognizer) {
//        changeOutletOne.isHidden = false
//        playerNameOne.isEnabled = true
//    }
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        changeOutletOne.isHidden = false
        playerNameOne.isEnabled = true
    }
    
    @IBAction func longPressTwo(_ sender: UILongPressGestureRecognizer) {
        changeOutletTwo.isHidden = false
        playerNameTwo.isEnabled = true
    }
    
    
    @IBAction func longPressThree(_ sender: UILongPressGestureRecognizer) {
        changeOutletThree.isHidden = false
        playerNameThree.isEnabled = true
    }
    
    
    @IBAction func longPressFour(_ sender: UILongPressGestureRecognizer) {
        changeOutletFour.isHidden = false
        playerNameFour.isEnabled = true
    }
    
    
//    @IBAction func meepleTapGestOne(_ sender: UITapGestureRecognizer) {
//        changeOutletOne.isHidden = true
//        playerNameOne.isEnabled = false
//    }
    
    @IBAction func tapGest(_ sender: Any) {
        changeOutletOne.isHidden = true
        playerNameOne.isEnabled = false
    }
    
    @IBAction func meepleTapGestTwo(_ sender: UITapGestureRecognizer) {
        changeOutletTwo.isHidden = true
        playerNameTwo.isEnabled = false
    }
    
    
    @IBAction func meepleTapGestThree(_ sender: UITapGestureRecognizer) {
        changeOutletThree.isHidden = true
        playerNameThree.isEnabled = false
    }
    
    
    @IBAction func meepleTapGestFour(_ sender: UITapGestureRecognizer) {
        dingSound()
        changeOutletFour.isHidden = true
        playerNameFour.isEnabled = false
    }
    @IBAction func cardDrag(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x:viewToDrag.center.x + translation.x ,
                                        y: viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
        }
        
    }
    @IBAction func tapCard(_ sender: UIPanGestureRecognizer) {
        FlipSound()
        counterFive += 1
        if counterFive == ac.count {
            counterFive = 0
        }
        textViewOne.text = ac[counterFive][1]
    }
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn {
            BackgroundMusicAudioTrack.volume = 0
        } else {
            BackgroundMusicAudioTrack.volume = 1
        }
    }
    @IBAction func aboutUsAlerts(_ sender: UIButton) {
        let alertController = UIAlertController(title: "By: ", message: "Shamsa :D", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Go To Lab Website", style: .default)
        { [self] (action: UIAlertAction!) in
            openUrl(urlString: "https://www.swcsdcareertech.com/multi-skilled-health.html")
            print("oK button Tapped");
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: { (action: UIAlertAction!) in print("cancel")
        });
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)

    }
    func openUrl(urlString: String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    @IBAction func diceRoll(_ sender: UIButton) {
        diceRollSound()
        var random =  Int.random(in: 1...6)
        diceRollImage.image = UIImage(named: "\(random)")
    }
}
