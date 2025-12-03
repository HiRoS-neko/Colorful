//
//  Utils.swift
//  Colorful
//
//  Created by wong on 4/21/25.
//

#if os(macOS)
import AppKit
#endif
import SwiftUI

extension Color {
    #if os(macOS)
    var toColor: NSColor? {
        let cgColor = NSColor(self).cgColor
        return NSColor(cgColor: cgColor)
    }
    #endif
    #if os(iOS)
    var toColor: UIColor? {
        let cgColor = UIColor(self).cgColor
        return UIColor(cgColor: cgColor)
    }
    #endif
    var alpha: CGFloat {
        let nsColor = self.toColor
        var value: CGFloat = 1
        nsColor?.getHue(nil, saturation: nil, brightness: nil, alpha: &value)
        return value
    }

    var hue: CGFloat {
        let nsColor = self.toColor
        var value: CGFloat = 0
        nsColor?.getHue(&value, saturation: nil, brightness: nil, alpha: nil)
        return value
    }

    var saturation: CGFloat {
        let nsColor = self.toColor
        var value: CGFloat = 0
        nsColor?.getHue(nil, saturation: &value, brightness: nil, alpha: nil)
        return value
    }

    var brightness: CGFloat {
        let nsColor = self.toColor
        var value: CGFloat = 0
        nsColor?.getHue(nil, saturation: nil, brightness: &value, alpha: nil)
        return value
    }
}
