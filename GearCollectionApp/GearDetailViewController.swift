//
//  GearDetailViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/23.
//

import UIKit
import RealmSwift

class GearDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet weak var makerText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var record = GearRecord()

    
    @IBAction func addButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gearDetailViewConntroller = storyboard.instantiateViewController(identifier: "GearDetail") as! GearDetailViewController
        navigationController?.pushViewController(gearDetailViewConntroller, animated: true)
        saveRecord()
        
        if record.category.isEmpty {
            print("カテゴリが選択されていません！")
            addButton.isEnabled = false
        } else if record.name.isEmpty {
            print("ギア名が入力されていません！")
            addButton.isEnabled = false
        } else if record.category.isEmpty && record.name.isEmpty {
            print("カテゴリ・ギア名が入力されていません！")
            addButton.isEnabled = false
        }
    }
    
    // 写真を追加するボタン
    @IBAction func photoButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            
        }
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
        datePicker.locale = Locale(identifier: "ja_JP") // 日本のロケールを指定
        datePicker.date = Date() // 現在の日付を代入
        datePicker.addTarget(self, action: #selector(didChangeDate), for: .valueChanged) // ピッカーの値が変更された際に、didChangeDateメソッドを実行
        return datePicker
    }
    
    // 日付をUITextFieldに表示する（日付の値を文字列に変換）
    var dateFormatter: DateFormatter {
        let dateFormatt = DateFormatter()
        dateFormatt.dateStyle = .long
        dateFormatt.timeZone = .current
        dateFormatt.locale = Locale(identifier: "ja_JP")
        return dateFormatt
    }
    
    
    var category: String = ""
    var maker: String = ""
    var name: String = ""
    var amount: Int = 0
    var weight: Double = 0.0
    var date: Date = Date()
    
    var gearList: [GearRecord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        createPickerView()
        configureDateTextField()
        let realm = try! Realm()
        let result = realm.objects(GearRecord.self)
        gearList = Array(result)
        closeKeyboard()
        print("👀firstRecord: \(String(describing: gearList))")
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    // 他の場所をタップしたらキーボードが閉じる設定
    @objc func closeKeyboard() {
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
        NotificationCenter.default.addObserver(self, selector: #selector(namekeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(amountkeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(weightkeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(datekeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // ギア名入力時、TextFieldにキーボードが被らないようにする
    @objc func namekeyboardWillShow(notification: NSNotification) {
        if !nameText.isFirstResponder {
            return
        }
        
        if self.view.frame.origin.y == 0 {
            if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardRect.height
            }
        }
    }
    // 金額入力時、TextFieldにキーボードが被らないようにする
    @objc func amountkeyboardWillShow(notification: NSNotification) {
        if !amountText.isFirstResponder {
            return
        }
        
        if self.view.frame.origin.y == 0 {
            if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardRect.height
            }
        }
    }
    // 重量入力時、TextFieldにキーボードが被らないようにする
    @objc func weightkeyboardWillShow(notification: NSNotification) {
        if !weightText.isFirstResponder {
            return
        }
        
        if self.view.frame.origin.y == 0 {
            if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardRect.height
            }
        }
    }
    // 日付入力時、TextFieldにキーボードが被らないようにする
    @objc func datekeyboardWillShow(notification: NSNotification) {
        if !dateText.isFirstResponder {
            return
        }
        
        if self.view.frame.origin.y == 0 {
            if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardRect.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    

    
    func configure(gear: GearDataModel) {
        category = gear.category
        maker = gear.maker
        name = gear.name
        amount = gear.amount
        weight = gear.weight
        date = gear.date
    }
    
    func displayData() {
        categoryText.text = category
        makerText.text = maker
        nameText.text = name
        var toIntAmount: Int? = Int(amountText.text!)
        var toIntWeight: Double? = Double(weightText.text!)
        dateText.inputView = datePicker
        dateText.text = dateFormatter.string(from: Date()) // datePickerで選択された日付をString型に変換
    }
    
    // 日付が選択された際に、UITextFieldに日付が表示されるようにするメソッド
    @objc func didChangeDate(picker: UIDatePicker) {
        dateText.text = dateFormatter.string(from: picker.date)
    }
    
    // データをRealmに保存する処理
    func saveRecord() {
        let realm = try! Realm()
        try! realm.write {
            if let categoryText = categoryText.text,
               let category = String?(categoryText) {
                record.category = category
            }
            if let makerText = makerText.text,
               let maker = String?(makerText) {
                record.maker = maker
            }
            if let nameText = nameText.text,
               let name = String?(nameText) {
                record.name = name
            }
            if let amountText = amountText.text,
               let amount = Int(amountText) {
                record.amount = amount
            }
            if let weightText = weightText.text,
               let weight = Double(weightText) {
                record.weight = weight
            }
            if let dateText = dateText.text,
               let date = dateFormatter.date(from: dateText) {
                record.date = date
            }
            realm.add(record)
        }
        dismiss(animated: true) // 画面を閉じる処理
    }
    
    // カテゴリ入力時に、PickerViewの設定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryText.text = categoryData[row]
    }
    var pickerView = UIPickerView()
    var categoryData = ["TENT&TARP", "TABLE&CHAIR", "FIRE", "KITCHEN&TABLEWEAR", "SLEEPING", "OTHER"]
    
    
    @objc func donePicker() {
        categoryText.endEditing(true)
    }
    func createPickerView() {
        pickerView.delegate = self
        categoryText.inputView = pickerView
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(GearDetailViewController.donePicker))
        toolBar.setItems([doneButtonItem], animated: true)
    
        }
    
    func configureDateTextField() {
        dateText.inputView = datePicker
        dateText.inputAccessoryView = toolBar
        dateText.text = dateFormatter.string(from: Date())
    }

}
    



