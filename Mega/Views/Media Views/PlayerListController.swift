//
//  PlayerListController.swift
//  Mega
//
//  Created by Tope Abayomi on 17/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class PlayerListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var backButton : UIButton!
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var artistLabel : UILabel!
    
    @IBOutlet var bgImageView : UIImageView!
    @IBOutlet var coverImageView : UIImageView!
    
    @IBOutlet var trackStartLabel : UILabel!
    @IBOutlet var trackEndLabel : UILabel!
    @IBOutlet var trackProgress : UIProgressView!
    
    @IBOutlet var mediaPlayButton : UIButton!
    @IBOutlet var mediaShuffleButton : UIButton!
    @IBOutlet var mediaRewindButton : UIButton!
    @IBOutlet var mediaForwardButton : UIButton!
    @IBOutlet var mediaRepeatButton : UIButton!
    
    @IBOutlet var trackTableView : UITableView!
    
    @IBOutlet var imageHeightConstraint : NSLayoutConstraint!
    
    var album : Album!
    var player : AVAudioPlayer!
    var timer : NSTimer!
    var isPaused : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if album == nil {
            album = Album(title: "Wonderful Life", artist: "Hurts", coverImageUrl: "cover-album-4", songCount: 5)
        }
        
        let track1 = Track(name: "You Won't Feel a Thing", duration: "2:30", filename: "sample-track-1")
        let track2 = Track(name: "For the First Time", duration: "4:20", filename: "sample-track-2")
        let track3 = Track(name: "Nothing", duration: "3:45", filename: "sample-track-1")
        let track4 = Track(name: "Science & Faith", duration: "5:01", filename: "sample-track-2")
        let track5 = Track(name: "If You Ever Come Back", duration: "4:49", filename: "sample-track-1")
        
        album.tracks = [track1, track2, track3, track4, track5]
        
        coverImageView.image = UIImage(named: album.coverImageUrl)
        bgImageView.image = UIImage(named: album.coverImageUrl)
        
        titleLabel.text = album.title
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont(name: MegaTheme.semiBoldFontName, size: 18)
        
        artistLabel.text = album.artist
        artistLabel.textColor = UIColor.whiteColor()
        artistLabel.font = UIFont(name: MegaTheme.semiBoldFontName, size: 13)
        
        trackStartLabel.text = "1:20"
        trackStartLabel.textColor = UIColor.whiteColor()
        trackStartLabel.font = UIFont(name: MegaTheme.semiBoldFontName, size: 11)
        
        trackEndLabel.text = "4:13"
        trackEndLabel.textColor = UIColor.whiteColor()
        trackEndLabel.font = UIFont(name: MegaTheme.semiBoldFontName, size: 11)
        
        trackProgress.tintColor = UIColor(red: 0.16, green: 0.75, blue: 0.56, alpha: 1.0)
        
        let backImage = UIImage(named: "back")?.imageWithRenderingMode(.AlwaysTemplate)
        backButton.setImage(backImage, forState: .Normal)
        backButton.setTitle("", forState: .Normal)
        backButton.tintColor = UIColor.whiteColor()
        backButton.addTarget(self, action: "backButtonTapped", forControlEvents: .TouchUpInside)
        
        themeMediaButton(mediaRepeatButton, imageName: "media-repeat")
        themeMediaButton(mediaPlayButton, imageName: "media-play")
        themeMediaButton(mediaRewindButton, imageName: "media-rewind")
        themeMediaButton(mediaForwardButton, imageName: "media-forward")
        themeMediaButton(mediaShuffleButton, imageName: "media-shuffle")
        
        trackTableView.delegate = self
        trackTableView.dataSource = self
        trackTableView.backgroundColor = UIColor.clearColor()
        trackTableView.separatorColor = UIColor(white: 1.0, alpha: 0.4)
        
        mediaPlayButton.addTarget(self, action: "playButtonTapped", forControlEvents: .TouchUpInside)
        let bundle = NSBundle.mainBundle()
        let url = bundle.URLForResource("sample-track-1", withExtension: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOfURL: url!)
        }catch{
            
        }
    }
    
    func backButtonTapped(){
        player.stop()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func themeMediaButton(button: UIButton, imageName: String){
        button.tintColor = UIColor.whiteColor()
        let image = UIImage(named: imageName)?.imageWithRenderingMode(.AlwaysTemplate)
        button.setImage(image, forState: .Normal)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TrackCell") as! TrackCell
        
        let track = album.tracks[indexPath.row]
        cell.nameLabel.text = track.name
        cell.durationLabel.text = track.duration
        
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.tracks.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        playTrackAtIndexPath(indexPath)
    }
    
    func playTrackAtIndexPath(indexPath : NSIndexPath){
        
        let track = album.tracks[indexPath.row]
        
        let bundle = NSBundle.mainBundle()
        let url = bundle.URLForResource(track.filename, withExtension: "mp3")
    
        do {
            try player = AVAudioPlayer(contentsOfURL: url!)
        }catch{
            
        }
        
        isPaused = true
        playButtonTapped()
    
        updateTime()
    }
    
    func updateTime(){
        
        trackStartLabel.text = timeFormat(player.currentTime)
        trackEndLabel.text = timeFormat(player.duration - player.currentTime)
        
        let progress = player.currentTime/player.duration
        
        trackProgress.progress = Float(progress)
    }
    
    func playButtonTapped(){
        
        if isPaused {
            player.play()
            scheduleTimer()
            themeMediaButton(mediaPlayButton, imageName: "media-pause")
            isPaused = false
            
        }else{
            player.pause()
            themeMediaButton(mediaPlayButton, imageName: "media-play")
            isPaused = true
        }
    }
    
    func scheduleTimer(){
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        
    }
    
    func timeFormat(value: NSTimeInterval) -> String{
        let round = Double(lround(value))/60
        let minutes = floor(round)
        let seconds = Double(lround(value)) - (minutes * 60);
        
        let roundedSeconds = lround(seconds);
        let roundedMinutes = lround(minutes);
        
        let time = String(format: "%d:%02d", roundedMinutes, roundedSeconds)
        
        return time
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        let transitionToWide = size.width > size.height
        
        imageHeightConstraint.constant = transitionToWide ? 0 : 200
    }
}