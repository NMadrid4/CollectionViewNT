//
//  MovieDetailViewController.swift
//  CollectionViewApp
//
//  Created by Melanie on 12/7/18.
//

import UIKit
import AVKit

class MovieDetailViewController: UIViewController {

    var urlMovie: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(urlMovie)
    }
    
    @IBAction func playVideoAction(_ sender: Any) {
        if let urlMovie = urlMovie {
            
            let urlVideo = URL(string: urlMovie)!
            let video = AVPlayer(url: urlVideo)
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            self.present(videoPlayer, animated: true, completion: {
                video.play()
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
                }
                catch {
                    print("Setting category to AVAudioSessionCategoryPlayback failed.")
                }
            })
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
