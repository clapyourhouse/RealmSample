//
//  ViewController.swift
//  RealmCalendar
//
//  Created by shogo.kitamura on 12/7/18.
//  Copyright © 2018 shogo.kitamura. All rights reserved.
//

import UIKit
import JBDatePicker

class ViewController: UIViewController,
JBDatePickerViewDelegate {
    @IBOutlet weak var datePickerView: JBDatePickerView!
    @IBOutlet weak var writeButton: UIButton!
    var date: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //delegateをControllerへ追加
         datePickerView.delegate = self
    }
    //日本の日付を返す
    lazy var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy    MM/dd"
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        return formatter
    }()
    // 日付選択時
    func didSelectDay(_ dayView: JBDatePickerDayView) {
        print("day selected:\(dateFormatter.string(from: dayView.date!))")
        date = dateFormatter.string(from: dayView.date!) // 追加

    }
    @IBAction func writeButtonPush(_ sender: Any) {
        self.performSegue(withIdentifier: "toDiary", sender: nil)
    }
    //画面遷移の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDiary") {
            let diaryView = segue.destination as! DiaryViewController
            diaryView.date = self.date
        }
    }
}

