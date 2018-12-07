//
//  Diary.swift
//  RealmCalendar
//
//  Created by shogo.kitamura on 12/7/18.
//  Copyright © 2018 shogo.kitamura. All rights reserved.
//

import UIKit
import RealmSwift

class Diary: Object {
    //日付と本文とdate
    @objc dynamic var date: String = ""
    @objc dynamic var context: String = ""
    override static func primaryKey() -> String {
        return "date"
    }
}
