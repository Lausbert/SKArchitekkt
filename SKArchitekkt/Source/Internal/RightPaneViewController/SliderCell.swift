//
//  Slider.swift
//  CoreArchitekkt
//
//  Created by Stephan Lerner on 08.02.20.
//

import Cocoa

class SliderCell: NSSliderCell {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func drawBar(inside aRect: NSRect, flipped: Bool) {
        var rect = aRect
        rect.size.height = CGFloat(5)
        let barRadius = CGFloat(2.5)
        let value = CGFloat((self.doubleValue - self.minValue) / (self.maxValue - self.minValue))
        let finalWidth = CGFloat(value * (self.controlView!.frame.size.width - 8))
        var leftRect = rect
        leftRect.size.width = finalWidth
        let bg = NSBezierPath(roundedRect: rect, xRadius: barRadius, yRadius: barRadius)
        NSColor.color(named: "sliderRight").setFill()
        bg.fill()
        let active = NSBezierPath(roundedRect: leftRect, xRadius: barRadius, yRadius: barRadius)
        NSColor.color(named: "primary1").setFill()
        active.fill()
    }

}
