//
//  ResultViewController.swift
//  Quiz
//
//  Created by Chihiro Nishiwaki on 2021/02/11.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer: Int! = 0
    var numberOfQuestion: Int! = 0
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "おとうふレベル  " + String(correctAnswer) + " / " + String(numberOfQuestion)
        if correctAnswer > numberOfQuestion / 2 {
            imageView.image = UIImage(named: "yes.jpg")
        }else{
            imageView.image = UIImage(named: "pugya.jpg")
        }

        // Do any additional setup after loading the view.
    }
    

    @IBAction func back() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
