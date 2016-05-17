//
//  RealmManager.swift
//  RealmTranslator
//
//  Created by TakahashiYuichirou on 2016/05/17.
//  Copyright © 2016年 TakahashiYuichirou. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager {
    
    private let realm: Realm?
    
    init(fileName: String) {
        var config = Realm.Configuration()
        config.fileURL = config.fileURL?
            .URLByDeletingLastPathComponent?
            .URLByAppendingPathComponent(fileName)
            .URLByAppendingPathExtension("realm")
        
        do {
            realm = try Realm(configuration: config)
            
            print("path: \(config.fileURL!.absoluteString)")
        } catch let e as NSError {
            realm = nil
            print("Error! Realm create failed. message: \(e.localizedDescription)")
        }
    }
    
    
    func saveRealmModel<T: Object>(model: [T]) {
        print("model: \(model)")
        do {
            try realm?.write { realm?.add(model) }
        } catch let e as NSError {
            print("Realm model save failed. message: \(e.localizedDescription)")
        }
    }
}
