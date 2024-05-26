//
//  APICaller.swift
//  ColorMix
//
//  Created by Drolllted on 21.05.2024.
//

import Foundation

struct JSONCaller: Codable {
    let XYZ: XYZ
    let _embedded: _Embededd
    let _links: Links
    let cmyk: CMYK
    let contrast: Contrast
    let hex: Hex
    let hsl: HSL
//    let hsv: HSV
    let image: Image
    let name: NameColor
    let rgb: RGB
    
    enum Codingkeys: String, CodingKey{
        case XYZ = "new_Key"
        case cmyk, contrast, hex, hsl, rgb
        case name
        case image
        case _embedded
        case _links
        
        
    }
}

//MARK: - XYZ
struct XYZ: Codable{
    let X, Y, Z: Int
    let fraction: FractionXYZ
    let value: String
}

struct FractionXYZ: Codable{
    let X, Y, Z: Double
}

//MARK: - links

struct Links: Codable{
    let `self`: SelfLinks
    
}

struct SelfLinks: Codable{
    let href: String
}

//MARK: - CMYK

struct CMYK: Codable{
    let c: Int
    let fraction: FractionCMYK
    let k: Int
    let m: Int
    let y: Int
}

struct FractionCMYK: Codable{
    let c: Double
    let k: Double
    let m: Double
    let y: Double
}

//MARK: - Contrast

struct Contrast: Codable{
    let value: String
}

//MARK: - Embdedd

struct _Embededd: Codable{
    
}

//MARK: - Hex
struct Hex: Codable{
    let clean: String
    let value: String
}

//MARK: - HSL

struct HSL: Codable{
    let fraction: HSLFraction
    let h: Int
    let l: Int
    let s: Int
    let value: String
}

struct HSLFraction: Codable{
    let h: Double
    let l: Double
    let s: Double
}

//MARK: - Image
struct Image: Codable{
    let bare: String
    let named: String
}

//MARK: - Name

struct NameColor: Codable{
    let closest_named_hex: String
    let distance: Int
    let exact_match_name: Bool
    let value: String
    
}

//MARK: RGB

struct RGB: Codable{
    let b: Int
    let fraction: RGBFraction
    let g: Int
    let r: Int
    let value: String
}

struct RGBFraction: Codable{
    let b: Double
    let g: Double
    let r: Double
}




//struct JSONCaller: Codable{
//    let hex: Hex
//    let rgb: RGB
//    let hsl: Hsl
//    let hsv: Hsv
//    let name: NameColor
//    let cmyk: Cmyk
//    let xyz: Xyz
//    let image: Image
//    let contrast: Contrast
//    let _links: Links
//    let _embedded: Embedded
//
//    enum CodingKeys: String, CodingKey {
//        case hex, rgb, hsl, hsv, name, cmyk
//        case xyz
//        case image, contrast
//        case _links
//        case _embedded
//    }
//}
//
//// MARK: - Cmyk
//struct Cmyk: Codable {
//    let fraction: CmykFraction
//    let value: String
//    let c, m, y, k: Int
//
//}
//
//// MARK: - CmykFraction
//struct CmykFraction: Codable {
//    let c,y, k: String
//    let m: Int
//}
//
//// MARK: - Contrast
//struct Contrast: Codable {
//    let value: String
//}
//
//// MARK: - Embedded
//struct Embedded: Codable {
//}
//
//// MARK: - Hex
//struct Hex: Codable {
//    let value: String
//    let clean: Int64
//}
//
//// MARK: - Hsl
//struct Hsl: Codable {
//    let fraction: HslFraction
//    let h, s, l: Int
//    let value: String
//}
//
//// MARK: - HslFraction
//struct HslFraction: Codable {
//    let h, s: String
//    let l: Double
//}
//
//// MARK: - Hsv
//struct Hsv: Codable {
//    let fraction: HsvFraction
//    let value: String
//    let h, s, v: Int
//}
//
//// MARK: - HsvFraction
//struct HsvFraction: Codable {
//    let h, s, v: String
//}
//
//// MARK: - Image
//struct Image: Codable {
//    let bare, named: String
//}
//
//// MARK: - Links
//struct Links: Codable {
//    let linksSelf: SelfClass
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf
//    }
//}
//
//// MARK: - SelfClass
//struct SelfClass: Codable {
//    let href: String
//}
//
//// MARK: - Name
//struct NameColor: Codable {
//    let value, closestNamedHex: String
//    let exactMatchName: Int
//    let distance: Int
//
//    enum CodingKeys: String, CodingKey {
//        case value
//        case closestNamedHex
//        case exactMatchName
//        case distance
//    }
//}
//
//// MARK: - RGB
//struct RGB: Codable {
//    let fraction: RGBFraction
//    let r, g, b: Int
//    let value: String
//}
//
//// MARK: - Decodable
//struct RGBFraction: Codable {
//    let r, g, b: String
//}
//
//// MARK: - Xyz
//struct Xyz: Codable {
//    let fraction: XYZFraction
//    let value: String
//    let x, y, z: Int
//
//    enum CodingKeys: String, CodingKey {
//        case fraction, value
//        case x
//        case y
//        case z
//    }
//}
//
//// MARK: - XYZFraction
//struct XYZFraction: Codable {
//    let x, y, z: String
//
//    enum CodingKeys: String, CodingKey {
//        case x
//        case y
//        case z
//    }
//}
