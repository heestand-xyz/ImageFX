import SwiftUI
#if os(macOS)
import Cocoa
#else
import UIKit
#endif
import AsyncGraphics
import PixelColor

#if os(macOS)
public typealias FXImage = NSImage
public typealias FXColor = NSColor
#else
public typealias FXImage = UIImage
public typealias FXColor = UIColor
#endif


public extension FXImage {
    
    func fx(
        edit: (Graphic) async throws -> Graphic
    ) async throws -> FXImage {
        try await edit(Graphic.image(self)).image
    }
}

public extension FXImage {
    
    func fxBlur(radius: CGFloat) async throws -> FXImage {
        try await fx { try await $0.blurred(radius: radius) }
    }
    
    func fxRainbowBlur(radius: CGFloat) async throws -> FXImage {
        try await fx { try await $0.rainbowBlurredCircle(radius: radius) }
    }
    
    func fxEdge(amplitude: CGFloat = 1.0, distance: CGFloat = 1.0) async throws -> FXImage {
        try await fx { try await $0.edge(amplitude: amplitude, distance: distance) }
    }
    
    func fxClamp(low: CGFloat = 0.0, high: CGFloat = 1.0) async throws -> FXImage {
        try await fx { try await $0.clamp(low: low, high: high) }
    }
    
    func fxKaleidoscope(divisions: Int = 12, mirror: Bool = true) async throws -> FXImage {
        try await fx { try await $0.kaleidoscope(count: divisions, mirror: mirror) }
    }
    
    func fxBrightness(_ value: CGFloat) async throws -> FXImage {
        try await fx { try await $0.brightness(value) }
    }
    
    func fxDarkness(_ value: CGFloat) async throws -> FXImage {
        try await fx { try await $0.darkness(value) }
    }
    
    func fxContrast(_ value: CGFloat) async throws -> FXImage {
        try await fx { try await $0.contrast(value) }
    }
    
    func fxGamma(_ value: CGFloat) async throws -> FXImage {
        try await fx { try await $0.gamma(value) }
    }
    
    func fxInvert() async throws -> FXImage {
        try await fx { try await $0.inverted() }
    }
    
    func fxOpacity(_ value: CGFloat) async throws -> FXImage {
        try await fx { try await $0.opacity(value) }
    }
    
    func fxQuantize(fraction: CGFloat = 0.1) async throws -> FXImage {
        try await fx { try await $0.quantize(fraction) }
    }
    
    func fxSharpen(_ value: CGFloat = 2.0) async throws -> FXImage {
        try await fx { try await $0.sharpen(value) }
    }
    
    func fxSlope(_ value: CGFloat = 1.0) async throws -> FXImage {
        try await fx { try await $0.slope(amplitude: value) }
    }
    
    func fxThreshold(_ value: CGFloat = 0.5) async throws -> FXImage {
        try await fx { try await $0.threshold(value) }
    }
    
    func fxRange(
        inLow: CGFloat = 0.0,
        inHigh: CGFloat = 1.0,
        outLow: CGFloat = 0.0,
        outHigh: CGFloat = 1.0
    ) async throws -> FXImage {
        try await fx {
            try await $0.range(
                referenceLow: inLow,
                referenceHigh: inHigh,
                targetLow: outLow,
                targetHigh: outHigh
            )
        }
    }
    
    func fxSaturation(_ value: CGFloat) async throws -> FXImage {
        try await fx { try await $0.saturated(value) }
    }
    
    func fxMonochrome() async throws -> FXImage {
        try await fx { try await $0.monochrome() }
    }
    
    func fxHue(_ value: Angle) async throws -> FXImage {
        try await fx { try await $0.hue(value) }
    }
    
    func fxSepia(color: FXColor) async throws -> FXImage {
        try await fx { try await $0.sepia(color: PixelColor(color)) }
    }
    
    func fxFlipX() async throws -> FXImage {
        try await fx { try await $0.mirroredHorizontally() }
    }
    
    func fxFlipY() async throws -> FXImage {
        try await fx { try await $0.mirroredVertically() }
    }
    
    func fxFlopLeft() async throws -> FXImage {
        try await fx { try await $0.rotatedLeft() }
    }
    
    func fxFlopRight() async throws -> FXImage {
        try await fx { try await $0.rotatedRight() }
    }
}
