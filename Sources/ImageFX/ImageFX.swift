#if os(macOS)
import Cocoa
#else
import UIKit
#endif
import RenderKit
import PixelKit
import PixelColor

#if os(macOS)
public typealias _Image = NSImage
public typealias _Color = NSColor
#else
public typealias _Image = UIImage
public typealias _Color = UIColor
#endif

var didSetup: Bool = false

func setup() {
    frameLoopRenderThread = .background
    PixelKit.main.render.engine.renderMode = .manual
    PixelKit.main.disableLogging()
    didSetup = true
}

enum FXImageError: Error {
    case imageRenderNotAvalible
}

func fx(_ image: _Image, edit: (ImagePIX) -> (PIX & NODEOut)) async throws -> _Image {
    
    if !didSetup {
        setup()
    }
    
    let imagePix = ImagePIX()
    imagePix.image = image
    try await imagePix.manuallyRender()
    
    let editPix = edit(imagePix)
    try await editPix.manuallyRender()
    guard let editImage: _Image = editPix.renderedImage else {
        throw FXImageError.imageRenderNotAvalible
    }
    
    return editImage
}

public extension _Image {
    
    func fxBlur(_ value: CGFloat) async throws -> _Image {
        try await fx(self) { $0.pixBlur(value) }
    }
    
    func fxRainbowBlur(_ value: CGFloat) async throws -> _Image {
        try await fx(self) { $0.pixRainbowBlur(value) }
    }
    
    func fxEdge(_ value: CGFloat = 10) async throws -> _Image {
        try await fx(self) { $0.pixEdge(value) }
    }
    
    func fxClamp(low: CGFloat = 0.0, high: CGFloat = 1.0) async throws -> _Image {
        try await fx(self) { $0.pixClamp(low: low, high: high) }
    }
    
    func fxKaleidoscope(divisions: Int = 12, mirror: Bool = true) async throws -> _Image {
        try await fx(self) { $0.pixKaleidoscope(divisions: divisions, mirror: mirror) }
    }
    
    func fxBrightness(_ value: CGFloat) async throws -> _Image {
        try await fx(self) { $0.pixBrightness(value) }
    }
    
    func fxDarkness(_ value: CGFloat) async throws -> _Image {
        try await fx(self) { $0.pixDarkness(value) }
    }
    
    func fxContrast(_ value: CGFloat) async throws -> _Image {
        try await fx(self) { $0.pixContrast(value) }
    }
    
    func fxGamma(_ value: CGFloat) async throws -> _Image {
        try await fx(self) { $0.pixGamma(value) }
    }
    
    func fxInvert() async throws -> _Image {
        try await fx(self) { $0.pixInvert() }
    }
    
    func fxOpacity(_ value: CGFloat) async throws -> _Image {
        try await fx(self) { $0.pixOpacity(value) }
    }
    
    func fxQuantize(fraction: CGFloat = 0.1) async throws -> _Image {
        try await fx(self) { $0.pixQuantize(fraction) }
    }
    
    func fxSharpen(_ value: CGFloat = 2.0) async throws -> _Image {
        try await fx(self) { $0.pixSharpen(value) }
    }
    
    func fxSlope(_ value: CGFloat = 1.0) async throws -> _Image {
        try await fx(self) { $0.pixSlope(value) }
    }
    
    func fxThreshold(_ value: CGFloat = 0.5) async throws -> _Image {
        try await fx(self) { $0.pixThreshold(value) }
    }
    
    func fxTwirl(_ value: CGFloat = 2.0) async throws -> _Image {
        try await fx(self) { $0.pixTwirl(value) }
    }
    
    func fxRange(inLow: _Color = .black, inHigh: _Color = .white, outLow: _Color = .black, outHigh: _Color = .white) async throws -> _Image {
        try await fx(self) { $0.pixRange(inLow: PixelColor(inLow), inHigh: PixelColor(inHigh), outLow: PixelColor(outLow), outHigh: PixelColor(outHigh)) }
    }
    
    func fxRange(inLow: CGFloat = 0.0, inHigh: CGFloat = 1.0, outLow: CGFloat = 0.0, outHigh: CGFloat = 1.0) async throws -> _Image {
        try await fx(self) { $0.pixRange(inLow: inLow, inHigh: inHigh, outLow: outLow, outHigh: outHigh) }
    }
    
    func fxSaturation(_ value: CGFloat) async throws -> _Image {
        try await fx(self) { $0.pixSaturation(value) }
    }
    
    func fxMonochrome() async throws -> _Image {
        try await fxSaturation(0.0)
    }
    
    func fxHue(_ value: CGFloat) async throws -> _Image {
        try await fx(self) { $0.pixHue(value) }
    }
    
    func fxSepia(color: _Color) async throws -> _Image {
        try await fx(self) { imagePix in
            let sepiaPix = SepiaPIX()
            sepiaPix.input = imagePix
            sepiaPix.color = PixelColor(color)
            return sepiaPix
        }
    }
    
    func fxFlipX() async throws -> _Image {
        try await fx(self) { $0.pixFlipX() }
    }
    
    func fxFlipY() async throws -> _Image {
        try await fx(self) { $0.pixFlipY() }
    }
    
    func fxFlopLeft() async throws -> _Image {
        try await fx(self) { $0.pixFlopLeft() }
    }
    
    func fxFlopRight() async throws -> _Image {
        try await fx(self) { $0.pixFlopRight() }
    }
}
