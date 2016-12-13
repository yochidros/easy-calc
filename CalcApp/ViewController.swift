//
//  ViewController.swift
//  CalcApp
//
//  Created by 宮澤賢生 on 2016/12/13.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var firstval:Int = 0
    var secondval:Int = 0
    var result_cal:Int = 0
    var function_cal:String = ""
    let predicate = NSPredicate(format: "SELF MATCHES '\\\\d+'")//数値判定

    @IBAction func zeroButton(_ sender: Any) {
        if(!(textField.text! == "")){
            textField.text! += "0"
        }
    }
    @IBAction func doubleZeroButton(_ sender: Any) {
        if(!(textField.text! == "")){
            textField.text! += "00"
        }
    }
    @IBAction func oneButton(_ sender: Any) {
        textField.text! += "1"

    }
    @IBAction func twoButton(_ sender: Any) {
        textField.text! += "2"

    }
    @IBAction func threeButton(_ sender: Any) {
        textField.text! += "3"

    }
    @IBAction func fourButton(_ sender: Any) {
        textField.text! += "4"

    }
    @IBAction func fiveButton(_ sender: Any) {
        textField.text! += "5"

    }
    @IBAction func sixButton(_ sender: Any) {
        textField.text! += "6"

    }
    @IBAction func sevenButton(_ sender: Any) {
        textField.text! += "7"

    }
    @IBAction func eightButton(_ sender: Any) {
        textField.text! += "8"

    }
    @IBAction func nineButton(_ sender: Any) {
        textField.text! += "9"

    }
   

    @IBAction func plusButton(_ sender: Any) {
        if( predicate.evaluate(with: textField.text!)){
            firstval = Int(textField.text!)!
            function_cal = "+"
        }
        else{
            alertFunction()
        }
        textField.text! = ""
        
    }
    @IBAction func minusButton(_ sender: Any) {
        if( predicate.evaluate(with: textField.text!)){
            firstval = Int(textField.text!)!
            function_cal = "-"
        }
        else{
            alertFunction()
        }
        textField.text! = ""
        
    }
    @IBAction func divisionButton(_ sender: Any) {
        if( predicate.evaluate(with: textField.text!)){
        firstval = Int(textField.text!)!
        function_cal = "/"
        }
        else{
            alertFunction()
        }
        textField.text! = ""
    }
    @IBAction func multiButton(_ sender: Any) {
        if( predicate.evaluate(with: textField.text!)){
            firstval = Int(textField.text!)!
            function_cal = "*"
        }
        else{
            alertFunction()
        }
        textField.text! = ""
    }
    
    @IBAction func returnButton(_ sender: Any) {
        let N:Int = Int(textField.text!)!/10
        if( N == 0){
            textField.text! = ""
        }
        else{
            textField.text! = String("\(N)")
        }
    }
    
    @IBAction func calcButton(_ sender: Any) {
        if( predicate.evaluate(with: textField.text!)){
            secondval = Int(textField.text!)!
            if( function_cal == "+"){
                result_cal = firstval + secondval
            }
            else if( function_cal == "-"){
                result_cal = firstval - secondval
            }
            else if( function_cal == "*"){
                result_cal = firstval * secondval
            }
            else{
                if( firstval == 0){
                    result_cal = 0
                }else{
                    result_cal = firstval / secondval
                }
            }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

