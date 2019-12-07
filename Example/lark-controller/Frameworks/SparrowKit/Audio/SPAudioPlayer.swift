// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import AVFoundation

class SPAudioPlayer: NSObject, AVAudioPlayerDelegate {
    
    fileprivate var player: AVAudioPlayer = AVAudioPlayer()
    fileprivate var endPlayingComplection: (()->())? = nil
    
    func play(fileName: String, complection: (()->())? = nil) {
        self.endPlayingComplection?()
        self.player = AVAudioPlayer()
        let url = Bundle.main.url(forResource: fileName, withExtension: nil)
        if url == nil {
            self.endPlayingComplection?()
            return
        }
        do {
            self.player = try AVAudioPlayer(contentsOf: url!)
            player.volume = 1
            player.delegate = self
            player.prepareToPlay()
            player.play()
            self.endPlayingComplection = complection
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func stop() {
        player.stop()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.endPlayingComplection?()
    }
}
