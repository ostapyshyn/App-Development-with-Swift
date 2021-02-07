//
//  MorseCodePlaybackEventRepresentable.swift
//  MorseCodeHaptics
//
//  Created by Volodymyr Ostapyshyn on 06.02.2021.
//

import Foundation

protocol MorseCodePlaybackEventRepresentable {
    var playbackEvents: [MorseCodePlaybackEvent] { get }
}

extension TimeInterval {
    static let morseCodeUnit: TimeInterval = 0.2
}

extension MorseCodeSignal: MorseCodePlaybackEventRepresentable {
    var playbackEvents: [MorseCodePlaybackEvent] {
        switch self {
        case .short:
            return [.on(.morseCodeUnit)]
        default:
            return [.on(.morseCodeUnit * 3)]
        }
    }
    
    var components: [MorseCodePlaybackEventRepresentable] { [] }
    var componentSeparationDuration: TimeInterval { 0 }
}

extension MorseCodeCharacter: MorseCodePlaybackEventRepresentable {
    var components: [MorseCodePlaybackEventRepresentable] { signals }
    var componentSeparationDuration: TimeInterval { .morseCodeUnit }
}
