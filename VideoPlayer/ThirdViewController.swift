//
//  ThirdViewController.swift
//  VideoPlayer
//
//  Created by Ary on 2015/05/08.
//  Copyright (c) 2015年 Trabal. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ThirdViewController: UIViewController {

    var playerViewController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 動画ファイルのURLを取得
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("hogevideo", ofType: "mp4")
        let url = NSURL(fileURLWithPath: path!)

        // アイテム取得
        let playerItem = AVPlayerItem(URL: url)
        
        // 生成
        let player = AVPlayer(playerItem: playerItem)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        // 設定
        playerViewController.view.frame = CGRectMake(54, 96, view.bounds.width - 108, view.bounds.height - 192)
        playerViewController.showsPlaybackControls = true // 操作パネルを非表示にする場合はfalse
        playerViewController.videoGravity = AVLayerVideoGravityResizeAspect // 矩形にフィット
        
        // 通知登録
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didPlayerItemReachEnd:", name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
        
        // 表示
        view.addSubview(playerViewController.view)
        
        // 再生
        player.play()
    }

    func didPlayerItemReachEnd(notification: NSNotification) {
        // リピート再生
        playerViewController.player.seekToTime(kCMTimeZero)
        playerViewController.player.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

