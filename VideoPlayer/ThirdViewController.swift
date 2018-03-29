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
        let bundle = Bundle.main
        let path = bundle.path(forResource: "hogevideo", ofType: "mp4")
        let url = URL(fileURLWithPath: path!)

        // アイテム取得
        let playerItem = AVPlayerItem.init(url: url)
        
        // 生成
        let player = AVPlayer(playerItem: playerItem)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        // 設定
        playerViewController.view.frame = CGRect(x: 54, y: 96, width: view.bounds.width - 108, height: view.bounds.height - 192)
        playerViewController.showsPlaybackControls = true // 操作パネルを非表示にする場合はfalse
        playerViewController.videoGravity = AVLayerVideoGravity.resizeAspect.rawValue // 矩形にフィット
        
        // 通知登録
        NotificationCenter.default.addObserver(self, selector: #selector(didPlayerItemReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
        // 表示
        view.addSubview(playerViewController.view)
        
        // 再生
        player.play()
    }

    @objc func didPlayerItemReachEnd(notification: NSNotification) {
        guard let player = playerViewController.player else {
            return
        }
        // リピート再生
        player.seek(to: kCMTimeZero)
        player.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

