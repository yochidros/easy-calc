//
//  ViewController.swift
//  CalcApp
//
//  Created by 宮澤賢生 on 2016/12/13.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import UIKit


enum Function : String{
    case Plus   = "+"
    case Minus  = "-"
    case Mul    = "*"
    case Div    = "/"
    
    func getResult(first:Int , second:Int) -> Int{
        switch self{
            case .Plus : return first+second
            case .Minus : return first-second
            case .Mul: return first*second
            case .Div: if(first != 0){return first/second}
        }
        return 0
    }
}

class NumberButton : UIButton{
    @IBInspectable var numberString : String = ""
}

class FunctionButton : UIButton{
    @IBInspectable var functionString : String = ""
}

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var firstval:Int = 0
    var secondval:Int = 0
    var result_cal:Int = 0
    var function_cal:Function = Function.Plus
    
    @IBAction func numberButton(_ sender:NumberButton){
        let oldValue = (textField.text ?? "")//textがnilでなければtext,nilの場合""
        if oldValue.characters.count > 0 || sender.numberString != "0"{
            textField.text =  oldValue + String(sender.numberString)
        }
    }
    
    @IBAction func functionButton(_ sender:FunctionButton){
        if let text = textField.text, let number = Int(text), let function = Function(rawValue:sender.functionString){
            firstval = number
            function_cal = function
        }else{
            alertFunction()
        }
        textField.text = ""
    }
    
    //一文字消去
    @IBAction func returnButton(_ sender: Any) {
        if let text = textField.text, text.characters.count > 0{
            textField.text = text.substring(to: text.index(text.startIndex, offsetBy: text.characters.count - 1))
        }else{
            textField.text = ""
        }
    }
    //ファンクションボタンを押した時の処理
    func funcButton(tx: String?,f: Function){
        if let text = tx, let number = Int(text){
            firstval = number
            function_cal = f
        }
        else{
            alertFunction()
        }
        textField.text = ""
    }
    

    //計算
    @IBAction func calcButton(_ sender: Any) {
        if let text = textField.text{
            let number:Int? = Int(text)
            if let num = number{
                secondval = num
            }
            result_cal = function_cal.getResult(first: firstval,second: secondval)
        }
        else{
            firstval = 0
            alertFunction()
        }

    }
    
    func alertFunction(){
        // タイトル, メッセージ, Alertのスタイルを指定する
        let alert: UIAlertController = UIAlertController(title: "アラート表示", message: "正しい数値を入力してください", preferredStyle:  UIAlertControllerStyle.alert)
        
        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            // ボタンが押された時の処理を書く
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        
        // ③ UIAlertControllerにActionを追加
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        // ④ Alertを表示
        present(alert, animated: true, completion: nil)
        
    }
    
    // このメソッドで次の画面へのパラメータを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController2:ViewController2 = segue.destination as! ViewController2
        viewController2.param = String("\(result_cal)")
    }
    
}

