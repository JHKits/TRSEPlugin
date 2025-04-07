//
//  ResourceSynthesizer+.swift
//  Plugins
//
//  Created by 이전희 on 4/7/25.
//

import ProjectDescription

public extension ResourceSynthesizer {
    static func assetsExtension() -> Self {
        .custom(plugin: "TRSEPlugin",
                parser: .assets,
                extensions: ["xcassets"],
                resourceName:  "TRSEAssetsExtension")
    }
    
    static func fontsExtension() -> Self {
        .custom(plugin: "TRSEPlugin",
                parser: .fonts,
                extensions: Set(["ttf", "otf"]),
                resourceName:  "TRSEFontsExtension")
    }
}
