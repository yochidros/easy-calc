//
//  ViewController.swift
//  CalcApp
//
//  Created by 宮澤賢生 on 2016/12/13.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import UIKit


enum Function{
    case Plus
    case Minus
    case Mul
    case Div
    
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

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var firstval:Int = 0
    var secondval:Int = 0
    var result_cal:Int = 0
    var function_cal:Function = Function.Plus
    
    func addText(_ numberString:String){
        let oldValue = (textField.text ?? "")
        if oldValue.characters.count > 0 || numberString != "0"{
            textField.text =  oldValue + String(numberString)
        }
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        addText("0")
    }
    @IBAction func doubleZeroButton(_ sender: Any) {
        addText("0")
        addText("0")
    }
    @IBAction func oneButton(_ sender: Any) {
        addText("1")
    }
    @IBAction func twoButton(_ sender: Any) {
        addText("2")
    }
    @IBAction func threeButton(_ sender: Any) {
        addText("3")
    }
    @IBAction func fourButton(_ sender: Any) {
        addText("4")
    }
    @IBAction func fiveButton(_ sender: Any) {
        addText("5")
    }
    @IBAction func sixButton(_ sender: Any) {
        addText("6")
    }
    @IBAction func sevenButton(_ sender: Any) {
        addText("7")
    }
    @IBAction func eightButton(_ sender: Any) {
        addText("8")
    }
    @IBAction func nineButton(_ sender: Any) {
        addText("9")
    }
   
    @IBAction func plusButton(_ sender: Any) {
        funcButton(tx: textField.text, f:Function.Plus)}
    @IBAction func minusButton(_ sender: Any) {
        funcButton(tx: textField.text, f:Function.Minus)}
    @IBAction func divisionButton(_ sender: Any) {
        funcButton(tx: textField.text, f:Function.Div)}
    @IBAction func multiButton(_ sender: Any) {
        funcButton(tx: textField.text, f:Function.Mul)}
    
    //一文字消去
    @IBAction func returnButton(_ sender: Any) {
        var _N:Int = 0
        if let text = textField.text, let n = Int(text){
                _N = n/10
                textField.text = String("\(_N)")
            if _N == 0{
                textField.text = ""
            }
        }
        else{
            textField.text = String("\(_N)")
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

