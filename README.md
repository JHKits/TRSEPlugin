# TRSEPlugin

### 📖 Overview

**Tuist Resource Synthesizers Extension Plugin**

> TRSEPlugin is a Tuist plugin that extends the capabilities of the built-in ResourceSynthesizers, providing additional
> functionality for managing assets and fonts in modular Swift projects.

<br/>

### 🧑‍💻 Development Environment

![Swift](https://img.shields.io/badge/Swift-5.9-orange?logo=swift)
![mise/Tuist](https://img.shields.io/badge/mise/Tuist-4.9.0-blue?logo=tuist)

<br/>

---

### 🛠️ Prepare

To start using TRSEPlugin, follow these steps:

**1. Add the plugin to your project configuration**

In your Config.swift file:

```swift
// Example
let config = Config(
    plugins: [
        .git(url: "https://github.com/JHKits/TRSEPlugin", tag: "1.0.0") // TRSEPlugin
    ],
    generationOptions: .options()
)
```

<br/>

**2. Use the plugin in your [Project.swift](https://docs.tuist.dev/en/references/project-description/structs/project)
manifest**

Import the plugin and apply the extended resource synthesizers:

```
import TRSEPlugin

let project: Project = Project(name: "projectName",
                               resourceSynthesizers: [
                                .assets(),
                                .fonts(),
                                .assetsExtension(), // Extended by TRSEPlugin
                                .fontsExtension() // Extended by TRSEPlugin
                               ])
```

<br/>

---

### 🚀 Usage

Once configured, Tuist will automatically generate extended resource access code based on your Assets and Fonts.

**Assets**

<details>
<summary>
`assetsExtension()` generates image and color resources:
</summary>

```swift
#if os(macOS)

public extension NSImage {
    enum assets {
        public static let {{imageName}} = {{projectName}}Asset.{{imageName}}.image
    }
    
}

public extension NSColor {
    enum assets {
        public static let {{colorName}} = {{projectName}}Asset.{{colorName}}.color
    }
}

#elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)

public extension UIImage {
    enum assets {
        public static let {{imageName}} = {{projectName}}Asset.{{imageName}}.image
    }

}

public extension UIColor {
    enum assets {
         public static let {{colorName}} = {{projectName}}Asset.{{colorName}}.color
    }
}

#endif

#if canImport(SwiftUI)

public extension Image {
    enum assets {
        public static let {{imageName}} = {{projectName}}Asset.{{imageName}}.swiftUIImage
    }
}

public extension Color {
    enum assets {
        public static let {{colorName}} = {{projectName}}Asset.{{colorName}}.swiftUIColor
    }
}

#endif

```

</details>

```swift
// macOS
let image = NSImage.imageName
let color = NSColor.colorName

// iOS / tvOS / watchOS / visionOS
let image = UIImage.imageName
let color = UIColor.colorName

// SwiftUI
let image = Image.imageName
let color = Color.colorName

```

<br/>

**Fonts**

<details>
<summary>
`fontsExtension()` generates font accessors
</summary>

| Platform                        | {{projectName}}FontConvertible.Font |
|---------------------------------|-------------------------------------|
| macOS                           | NSFont                              |
| iOS / tvOS / watchOS / visionOS | UIFont                              |

```swift
#if os(macOS)

public extension NSFont {
    static func {{fontName}}(weight: {{projectName}}FontFamily.{{fontName}}Weight, size: CGFloat) -> {{projectName}}FontConvertible.Font {
        return {{projectName}}FontFamily.{{fontName}}(weight: weight).font(size: size)
    }
}

#elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)

public extension UIFont {
    static func {{fontName}}(weight: {{projectName}}FontFamily.{{fontName}}Weight, size: CGFloat) -> {{projectName}}FontConvertible.Font {
        return {{projectName}}FontFamily.{{fontName}}(weight: weight).font(size: size)
    }
}

#endif

#if canImport(SwiftUI)

public extension Font {
    static func {{fontName}}(weight: {{projectName}}FontFamily.{{fontName}}Weight, size: CGFloat) -> Font {
        return {{projectName}}FontFamily.{{fontName}}(weight: weight).swiftUIFont(size: size)
    }
}

#endif

```

</details>


```swift
// macOS
let font = NSFont.fontName(weight: .regular, size: 20)

// iOS / tvOS / watchOS / visionOS
let font = UIFont.fontName(weight: .regular, size: 20)

// SwiftUI
let font = Font.fontName(weight: .regular, size: 20)
```

<br/>

---

### 📃 License

**TRSEPlugin** is available under the **MIT license**.  
See the [LICENSE](./LICENSE) file for more information.

<br/>

### 📬 Contact

If you have any questions, suggestions, or issues, feel free to reach out:  
**Email:** [l06094@gmail.com](mailto:l06094@gmail.com)

<br/>

### 🙌 Contribute
You're more than welcome to submit a pull request or open an issue.  
Community contributions are always appreciated!

<br/>