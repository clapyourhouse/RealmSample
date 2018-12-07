//
//  DailyViewController.swift
//  RealmCalendar
//
//  Created by shogo.kitamura on 12/7/18.
//  Copyright © 2018 shogo.kitamura. All rights reserved.
//

import UIKit
import RealmSwift

class DiaryViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contextView: UITextView!
    var date: String! // 受け皿の用意

    override func viewDidLoad() {
        super.viewDidLoad()
        // TextViewの設定
        contextView.delegate = self
        contextView.layer.borderColor = UIColor.black.cgColor
        contextView.layer.borderWidth = 1.0
        contextView.layer.cornerRadius = 10.0
        contextView.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dateLabel.text = date // Labelに日付を表示
    }
    
    @IBAction func saveButtonPush(_ sender: Any) {
        let realm = try! Realm() //Realm初期化
        let diary = Diary()//モデルのインスタンス化
        diary.date = date
        diary.context = contextView.text
        
        try! realm.write {
            realm.add(diary, update: true) // Realmへ追加
            print(Realm.Configuration.defaultConfiguration.fileURL!)
        }
        self.dismiss(animated: true, completion: nil)
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
