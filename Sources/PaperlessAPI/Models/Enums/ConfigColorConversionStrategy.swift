//
//  ConfigColorConversionStrategy.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public enum ConfigColorConversionStrategy: RawRepresentable, Codable, Equatable {
    case leaveColorUnchanged, rgb, useDeviceIndependentColor, gray, cmyk
    case unknown(String)
    
    public typealias RawValue = String
    public init(rawValue: String) {
        switch rawValue {
        case "LeaveColorUnchanged": self = .leaveColorUnchanged
        case "RGB": self = .rgb
        case "UseDeviceIndependentColor": self = .useDeviceIndependentColor
        case "Gray": self = .gray
        case "CMYK": self = .cmyk
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: String {
        switch self {
        case .leaveColorUnchanged: return "LeaveColorUnchanged"
        case .rgb: return "RGB"
        case .useDeviceIndependentColor: return "UseDeviceIndependentColor"
        case .gray: return "Gray"
        case .cmyk: return "CMYK"
        case .unknown(let rawValue): return rawValue
        }
    }
}
