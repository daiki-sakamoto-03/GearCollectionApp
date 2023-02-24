//
//  GearDetailViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/23.
//

import UIKit

class GearDetailViewController: UIViewController {
    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet weak var makerText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gearDetailViewConntroller = storyboard.instantiateViewController(identifier: "GearDetail") as! GearDetailViewController
        navigationController?.pushViewController(gearDetailViewConntroller, animated: true)
    }
    
    @objc func didTapDone() {
        view.endEditing(true)
    }
    
    // キーボードに閉じるボタンを実装（コンピューティッドプロパティ）
    var toolBar: UIToolbar {
        let toolBarRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35)
        let toolBar = UIToolbar(frame: toolBarRect)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        toolBar.setItems([doneItem], animated: true)
        return toolBar
    }
    
    // 日付入力のTextFieldに、DatePickerを実装（設定）
    var datePicker: UIDatePicker {
        let datePicker: UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = .current // タイムゾーンを現在位置に設定
        datePicker.preferredDatePickerStyle = .wheels // ホイールスタイルのUIを指定
        datePicker.locale = Locale(identifier: "ja-JP") // 日本のロケールを指定
        datePicker.date = Date() // 現在の日付を代入
        datePicker.addTarget(self, action: #selector(didChangeDate), for: .valueChanged) // ピッカーの値が変更された際に、didChangeDateメソッドを実行
        return datePicker
    }
    
    // 日付をUITextFieldに表示する
    var dateFormatter: DateFormatter {
        let dateFormatt = DateFormatter()
        dateFormatt.dateStyle = .long
        dateFormatt.timeZone = .current
        dateFormatt.locale = Locale(identifier: "ja-JP")
        return dateFormatt
    }
    
    
    var category: String = ""
    var maker: String = ""
    var name: String = ""
    var amount: Int = 0
    var weight: Double = 0.0
    var date: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    
    
    func configure(gear: GearDataModel) {
        category = gear.category
        maker = gear.maker
        name = gear.name
        amount = gear.amount
        weight = gear.weight
        date = gear.date
        print("データは\(category)、\(maker)、\(name)、\(amount)、\(weight)、\(date)です！")
    }
    
    func displayData() {
        categoryText.text = category
        makerText.text = maker
        nameText.text = name
        var toIntAmount: Int? = Int(amountText.text!)
        var toIntWeight: Int? = Int(weightText.text!)
        dateText.inputView = datePicker
        categoryText.inputAccessoryView = toolBar // 閉じるボタン
        makerText.inputAccessoryView = toolBar // 閉じるボタン
        nameText.inputAccessoryView = toolBar // 閉じるボタン
        amountText.inputView = toolBar // 閉じるボタン
        weightText.inputAccessoryView = toolBar // 閉じるボタン
        dateText.inputAccessoryView = toolBar // 閉じるボタン
        dateText.text = dateFormatter.string(from: Date()) // datePickerで選択された日付をString型に変換
    }
    
    // 日付が選択された際に、UITextFieldに日付が表示されるようにするメソッド
    @objc func didChangeDate(picker: UIDatePicker) {
        dateText.text = dateFormatter.string(from: picker.date)
    }
    
}




