//
//  ResourceSynthesizer+.swift
//  Plugins
//
//  Created by 이전희 on 4/7/25.
//

import ProjectDescription

public extension ResourceSynthesizer {
    static func assetsWithExtension() -> Self {
        .custom(plugin: "TRSEPlugin",
                parser: .assets,
                extensions: ["xcassets"],
                resourceName:  "TRSEAssetsExtension")
    }
    
    static func fontsWithExtension() -> Self {
        .custom(plugin: "TRSEPlugin",
                parser: .fonts,
                extensions: ["ttf", "otf"],
                resourceName:  "TRSEFontsExtension")
    }
    
    static func stringCatalogWithExtension() -> Self {
        .custom(plugin: "TRSEPlugin",
                parser: .json,
                extensions: ["xcstrings"],
                resourceName:  "TRSEStringCatalog")
    }
}
