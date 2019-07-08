//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 登生 on 2019/07/04.
//  Copyright © 2019 Next-0. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var numberOnScreen:Double = 0	//画面上の数字
	var previousNumber:Double = 0	//前の画面に表示されていた数字
	var resultNumber:Double = 0		//計算結果
	var performingMath = false
	var flagContinutyCalculate = false
	var operation = 0	// 演算子
	
	func calculate(leftNum: Double, rigftNum: Double, operation: Int) -> Double{
		
		var result:Double = 0
		
		if operation == 12{
			result = leftNum / rigftNum
		}
		else if operation == 13{
			result = leftNum * rigftNum
		}
		else if operation == 14{
			result = leftNum - rigftNum
		}
		else if operation == 15{
			result = leftNum + rigftNum
		}
		
		return result
		
	}

	@IBOutlet weak var lable: UILabel!
	
	@IBAction func numbers(_ sender: UIButton) {	//数字ボタンの設定
		if performingMath == true{
			lable.text = String(sender.tag-1)
			numberOnScreen = Double(lable.text!)!
			performingMath = false
		}
		else{
			lable.text = lable.text! + String(sender.tag-1)	//桁が増える
			numberOnScreen = Double(lable.text!)!
		}
	}
	
	@IBAction func buttons(_ sender: UIButton) {
		if flagContinutyCalculate{
			if resultNumber == 0{
				resultNumber = calculate(leftNum: previousNumber, rigftNum: numberOnScreen, operation: operation)
			}else{
				resultNumber = calculate(leftNum: resultNumber, rigftNum: numberOnScreen, operation: operation)
			}
		}
		//数字が表示されている&演算子が抑えれた時
		if lable.text != "" && sender.tag != 11 && sender.tag != 16{
			
			if performingMath == false{
				previousNumber = Double(lable.text!)!
			}
			
			if sender.tag == 12{	//割り算
				lable.text = "÷"
			}
			else if sender.tag == 13{	//掛け算
				lable.text = "×"
			}
			else if sender.tag == 14{	//引き算
				lable.text = "-"
			}
			else if sender.tag == 15{	//足し算
				lable.text = "+"
			}
			operation = sender.tag
			performingMath = true
			
			flagContinutyCalculate = true
		}
		else if sender.tag == 16{	//イコール
			lable.text = String(resultNumber)
			flagContinutyCalculate = false
		}
		else if sender.tag == 11{	//クリア
			lable.text = ""
			previousNumber = 0
			numberOnScreen = 0
			resultNumber = 0
			operation = 0
			flagContinutyCalculate = false
			performingMath = false
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

