//
//  TrackRealmModel.swift
//  RealmTranslator
//
//  Created by TakahashiYuichirou on 2016/05/17.
//  Copyright © 2016年 TakahashiYuichirou. All rights reserved.
//

import UIKit
import RealmSwift

class TrackRealmModel: Object, CSVConvertible {
    dynamic var id: Int = 0
    dynamic var fileNameJapanese = ""
    dynamic var trackJapanese = ""
    dynamic var fileNameEnglish = ""
    dynamic var trackEnglish = ""
    dynamic var categoryId: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func convertFromCSV(row: [String]) -> Object {
        id = Int(row[0]) ?? -1
        fileNameJapanese = row[1]
        trackJapanese = row[2]
        fileNameEnglish = row[3]
        trackEnglish = row[4]
        categoryId = Int(row[5]) ?? -1
        
        return self
    }
}

class TrackCategoryRealmModel: Object, CSVConvertible {
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

