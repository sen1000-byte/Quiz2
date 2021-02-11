//
//  QuizViewController.swift
//  Quiz
//
//  Created by Chihiro Nishiwaki on 2021/02/11.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizeArray = [Any]()
    //正解を数える変数
    var correctAnswer: Int! = 0
    
    //問題数
    var numberOfQuestion: Int! = 0
    
    //クイズを表示
    @IBOutlet var quizTextView: UITextView!

    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //quizArrayにクイズ文を追加
        quizeArray.append(["豆腐の原料は?","牛乳","だいず","天使の涙の結晶",2])
        quizeArray.append(["このキャラクターのモチーフは？","豆腐","歯","妖精",1])
        quizeArray.append(["豆腐を固まらせるために加えるものは？","にがい","にがり","念",2])
        quizeArray.append(["このキャラクターが好きなのは","ケチャップ","かつおぶし","魔法の粉",2])
        
        numberOfQuestion = quizeArray.count
        
        //問題文をシャッフル
        quizeArray.shuffle()
        
        choiceQuiz()
        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz() {
        //一時的にクイズを取り出しておく
        let tempArray = quizeArray[0] as! [Any]
        quizTextView.text = tempArray[0] as? String
        choiceButton1.setTitle(tempArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tempArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tempArray[3] as? String, for: .normal)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResult", sender: nil)
    }
    
    //値の受け渡し準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
            resultViewController.numberOfQuestion = self.numberOfQuestion
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        let tempArray = quizeArray[0] as! [Any]
        if tempArray[4] as! Int == sender.tag {
            correctAnswer = correctAnswer + 1
        }
        //削除
        quizeArray.remove(at: 0)
        //解いた数の合計が、設定していた問題数に到達したら結果画面へ
        if quizeArray.count == 0 {
            performSegueToResult()
        }else{
            choiceQuiz()
        }
        
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
