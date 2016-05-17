//
//  WordRealmModel.swift
//  RealmTranslator
//
//  Created by TakahashiYuichirou on 2016/05/17.
//  Copyright © 2016年 TakahashiYuichirou. All rights reserved.
//

import UIKit
import RealmSwift

protocol CSVConvertible {
    init()
    
    func convertFromCSV(row: [String]) -> Object
}

class WordRealmModel: Object, CSVConvertible {
    dynamic var id: Int = 0
    dynamic var word = ""
    dynamic var wordJapanese = ""
    dynamic var furigana = ""
    dynamic var quesFileName = ""
    dynamic var lessonId: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func convertFromCSV(row: [String]) -> Object {
        id = Int(row[0]) ?? -1
        word = row[1]
        wordJapanese = row[2]
        furigana = row[3]
        quesFileName = row[4]
        lessonId = Int(row[5]) ?? -1
        
        return self
    }
}


class WordLessonRealmModel: Object, CSVConvertible {
    dynamic var id: Int = 0
    dynamic var name = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func convertFromCSV(row: [String]) -> Object {
        id = Int(row[0]) ?? -1
        name = row[1]
        
        return self
    }
}



