//
//  DialogRealmModel.swift
//  RealmTranslator
//
//  Created by TakahashiYuichirou on 2016/05/17.
//  Copyright © 2016年 TakahashiYuichirou. All rights reserved.
//

import UIKit
import RealmSwift

class DialogRealmModel: Object, CSVConvertible {
    dynamic var id: Int = 0
    dynamic var dialog = ""
    dynamic var dialogJapanese = ""
    dynamic var dialogAnswer = ""
    dynamic var dialogAnswerJapanese = ""
    dynamic var wrongAnswer1 = ""
    dynamic var wrongAnswer2 = ""
    dynamic var wrongAnswer3 = ""
    dynamic var quesFileName = ""
    dynamic var answerFileName = ""
    dynamic var lessonId: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func convertFromCSV(row: [String]) -> Object {
        id = Int(row[0]) ?? -1
        dialog = row[1]
        dialogJapanese = row[2]
        dialogAnswer = row[3]
        dialogAnswerJapanese = row[4]
        wrongAnswer1 = row[5]
        wrongAnswer2 = row[6]
        wrongAnswer3 = row[7]
        quesFileName = row[8]
        answerFileName = row[9]
        lessonId = Int(row[10]) ?? -1
        
        return self
    }

}

class DialogLessonRealmModel: Object, CSVConvertible {
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

