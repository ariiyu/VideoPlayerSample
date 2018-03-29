//
//  SecondViewController.swift
//  VideoPlayer
//
//  Created by Ary on 2015/05/08.
//  Copyright (c) 2015年 Trabal. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class SecondViewController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 動画ファイルのURLを取得
        let moviePath = Bundle.main.path(forResource: "hogevideo", ofType: "mov")!
        let url = URL(fileURLWithPath: moviePath)
        
        // アイテム取得
        let playerItem = AVPlayerItem.init(url: url)
        
        // 生成
        player = AVPlayer(playerItem: playerItem)
        
        // 再生
        player?.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
