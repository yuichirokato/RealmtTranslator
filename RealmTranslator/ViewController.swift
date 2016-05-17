//
//  ViewController.swift
//  RealmTranslator
//
//  Created by TakahashiYuichirou on 2016/05/16.
//  Copyright © 2016年 TakahashiYuichirou. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createWordAction(sender: AnyObject) {
        let manager = RealmManager(fileName: "word")
        let wordCSV = createCSV("word")
        let wordLessonCSV = createCSV("word_lesson")
        let wordWrapper = CSVWrapper(csvStr: wordCSV)
        let wordLessonWrapper = CSVWrapper(csvStr: wordLessonCSV)
        
        let words = wordWrapper.createRealmObject(WordRealmModel())
        let wordLessons = wordLessonWrapper.createRealmObject(WordLessonRealmModel())
        print("words: \(words)")
        print("word lessons: \(wordLessons)")
        
        manager.saveRealmModel(words)
        manager.saveRealmModel(wordLessons)
    }
    
    @IBAction func createPhraseAction(sender: AnyObject) {
        let manager = RealmManager(fileName: "sentence")
        let sentenceCSV = createCSV("phrase")
        let sentenceLessonCSV = createCSV("phrase_lesson")
        let sentenceWrapper = CSVWrapper(csvStr: sentenceCSV)
        let sentenceLessonWrapper = CSVWrapper(csvStr: sentenceLessonCSV)
        
        let sentences = sentenceWrapper.createRealmObject(SentenceRealmModel())
        let sentenceLessons = sentenceLessonWrapper.createRealmObject(SentenceLessonRealmModel())
        
        manager.saveRealmModel(sentences)
        manager.saveRealmModel(sentenceLessons)
    }
    
    @IBAction func createDialogAction(sender: AnyObject) {
        let manager = RealmManager(fileName: "dialog")
        let dialogCSV = createCSV("dialog")
        let dialogLessonCSV = createCSV("dialog_lesson")
        let dialogWrapper = CSVWrapper(csvStr: dialogCSV)
        let dialogLessonWrapper = CSVWrapper(csvStr: dialogLessonCSV)
        
        let dialogs = dialogWrapper.createRealmObject(DialogRealmModel())
        let dialogLessons = dialogLessonWrapper.createRealmObject(DialogLessonRealmModel())
        
        
        manager.saveRealmModel(dialogs)
        manager.saveRealmModel(dialogLessons)
    }
    
    @IBAction func createTrackAction(sender: AnyObject) {
        let manager = RealmManager(fileName: "track")
        let trackCSV = createCSV("track")
        let trackCategoryCSV = createCSV("track_category")
        let trackWrapper = CSVWrapper(csvStr: trackCSV)
        let trackCategoryWrapper = CSVWrapper(csvStr: trackCategoryCSV)
        
        let tracks = trackWrapper.createRealmObject(TrackRealmModel())
        let trackCategories = trackCategoryWrapper.createRealmObject(TrackCategoryRealmModel())
        
        manager.saveRealmModel(tracks)
        manager.saveRealmModel(trackCategories)
    }
    
    private func createCSV(name: String) -> String {
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "csv") ?? ""
        
        return try! String(contentsOfFile: path) ?? ""
    }
}

