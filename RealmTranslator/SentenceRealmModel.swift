//
//  SentenceRealmModel.swift
//  RealmTranslator
//
//  Created by TakahashiYuichirou on 2016/05/17.
//  Copyright © 2016年 TakahashiYuichirou. All rights reserved.
//

import UIKit
import RealmSwift

class SentenceRealmModel: Object, CSVConvertible {
    dynamic var id: Int = 0
    dynamic var phrase = ""
    dynamic var phraseJapanese = ""
    dynamic var phrasePart1 = ""
    dynamic var phrasePart2 = ""
    dynamic var phrasePart3 = ""
    dynamic var phrasePart4 = ""
    dynamic var quesFileName = ""
    dynamic var lessonId: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
    func convertFromCSV(row: [String]) -> Object {
        id = Int(row[0]) ?? -1
        phrase = row[1]
        phraseJapanese = row[2]
        phrasePart1 = row[3]
        phrasePart2 = row[4]
        phrasePart3 = row[5]
        phrasePart4 = row[6]
        quesFileName = row[7]
        lessonId = Int(row[8]) ?? -1
        
        return self
    }
}


class SentenceLessonRealmModel: Object, CSVConvertible {
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

