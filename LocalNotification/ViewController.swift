//
//  ViewController.swift
//  LocalNotification
//
//  Created by 渡邉舜也 on 25/07/2019.
//  Copyright © 2019 渡邉舜也. All rights reserved.
//

import UIKit
// 通知の機能を読み込む
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldForTitle: UITextField!
    
    @IBOutlet weak var textFieldForContent: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didClickButton(_ sender: UIButton) {
        // 通知のオブジェクト作成（インスタンス化）
        let content = UNMutableNotificationContent()
        // タイトル・内容・音の設定
        if let text = textFieldForTitle.text {
            // タイトルの設定
            content.title = text
        }
        
        if let text = textFieldForContent.text {
            // 内容の設定
            content.body = text
        }
        // 通知音の設定
        content.sound = .default
        
        // 通知時間オブジェクト作成
        var notificationTime = DateComponents()
        // 時間の設定
        //hourの設定
        notificationTime.hour = Calendar.current.component(.hour, from: datePicker.date)
        //minutesの設定
        notificationTime.minute = Calendar.current.component(.minute, from: datePicker.date)
        
        //トリガーを作成
        let trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
        
        //トリガーを元に通知のリクエストを登録
        
        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
        //トリガー登録
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        // 通知のリクエストを登録
    }
    
}
