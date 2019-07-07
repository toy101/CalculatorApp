//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 登生 on 2019/07/04.
//  Copyright © 2019 Next-0. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var numberOnScreen:Double = 0;	//画面上の数字
	var previousNumber:Double = 0;	//前の画面に表示されていた数字
	var performingMath = false
	var operation = 0;	// 演算子

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
		//数字が表示されている&演算子が抑えれた時
		if lable.text != "" && sender.tag != 11 && sender.tag != 16{
			previousNumber = Double(lable.text!)!
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
		}
		else if sender.tag == 16{	//イコール
			if operation == 12{
				lable.text = String(previousNumber / numberOnScreen)
			}
			else if operation == 13{
				lable.text = String(previousNumber * numberOnScreen)
			}
			else if operation == 14{
				lable.text = String(previousNumber - numberOnScreen)
			}
			else if operation == 15{
				lable.text = String(previousNumber + numberOnScreen)
			}
		}
		else if sender.tag == 11{	//クリア
			lable.text = ""
			previousNumber = 0;
			numberOnScreen = 0;
			operation = 0;
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

