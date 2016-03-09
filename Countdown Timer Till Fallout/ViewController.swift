//
//  ViewController.swift
//  Countdown Timer Till Fallout
//
//  Created by Kelby Lawson on 6/21/15.
//  Copyright (c) 2015 Kelby Lawson. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var tLabel: UILabel!
    @IBOutlet weak var sLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("computeTime"), userInfo: nil, repeats: true);
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func computeTime(){
        // ******* UPDATE TIME ***********
        var dateCompRel = NSDateComponents()
        dateCompRel.day = 10
        dateCompRel.month = 11
        dateCompRel.year = 2015
        dateCompRel.hour = 0
        
        var calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        var releaseDate = calendar?.dateFromComponents(dateCompRel)
        var currentDate = NSDate()
        
        
        
        var dateDurationComp = calendar?.components(
            NSCalendarUnit.CalendarUnitSecond,
            fromDate: currentDate,
            toDate: releaseDate!,
            options: nil)
        var secsToRelease = dateDurationComp?.second
        var minsToRelease = secsToRelease! / 60
        var hoursToRelease = (minsToRelease / 60)
        var daysToRelease = (hoursToRelease / 24)
        
        var secDiff = secsToRelease! % 60
        var minDiff = minsToRelease % 60
        var hourDiff = minsToRelease / 60
        var dayDiff = 0
        
        while (hourDiff > 24) {
            dayDiff++
            hourDiff -= 24
        }
        
        
        var timeNow = NSString(format: "%02dd:%02dh:%02dm:%02ds", dayDiff, hourDiff, minDiff, secDiff)
        
        updateTimeLabel(timeNow)
        flashTicker()
    }
    
    
    func updateTimeLabel(time:NSString){
        tLabel.text = time
    }
    
    func flashTicker(){
        if sLabel.hidden == true {
            sLabel.hidden = false
        }
        else {
            sLabel.hidden = true
        }    }
    
    
    
    
    


}

