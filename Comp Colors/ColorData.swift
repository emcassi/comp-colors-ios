//
//  ColorData.swift
//  Comp Colors
//
//  Created by Alex Wayne on 11/9/22.
//

import Foundation

struct ColorsData: Decodable {
    let colors: [ColorData]
}

struct ColorData: Decodable {
    let rgb: RGBData
    let hex: HexData
}

struct RGBData: Decodable {
    let r: Int
    let g: Int
    let b: Int
    let value: String
}

struct HexData: Decodable {
    let value: String
    let clean: String
}
