//
//  QuestionViewController.swift
//  WordList2
//
//  Created by 森掛 on 2023/05/14.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var quetionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered: Bool = false
    var wordArray:[Dictionary<String, String>] = []
    var nowNumber: Int = 0
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        wordArray.shuffle()
        quetionLabel.text = wordArray[nowNumber]["english"]
    }
    
    @IBAction func nextButtonTapped() {
        if isAnswered {
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < wordArray.count {
                quetionLabel.text = wordArray[nowNumber]["english"]
                isAnswered = false
                nextButton.setTitle("答えを表示", for: .normal)
            }else {
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        }else {
            answerLabel.text = wordArray[nowNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
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
