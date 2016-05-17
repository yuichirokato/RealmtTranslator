//
//  CSVWrapper.swift
//  RealmTranslator
//
//  Created by TakahashiYuichirou on 2016/05/17.
//  Copyright © 2016年 TakahashiYuichirou. All rights reserved.
//

import UIKit
import RealmSwift
import CSwiftV

class CSVWrapper {
    let csv: CSwiftV
    
    init(csvStr: String) {
        
//        print("csv string: \(csvStr)")
        
        csv = CSwiftV(string: csvStr)
        
        print("csv: ", csv.rows)
    }
    
    func createRealmObject<T: CSVConvertible>(object: T) -> [Object] {
        return csv.rows.map { T().convertFromCSV($0) }
    }
}
