# SwiftGenWMO

An example of the linker blowing up when WMO is enabled.

This project uses [SwiftGen](https://github.com/AliSoftware/SwiftGen) to generate enums ([UIColor-Name.swift](SwiftGenWMO/UIColor%2BName.swift)) for a list of color [values](SwiftGenWMO/Colors.txt). It compiles just fine when the `SWIFT_OPTIMIZATION_LEVEL` is set to "None [-Onone]" or "Fast [-O]". However it breaks with the following ugly messages when Whole Module Optimization (WMO) is enabled (`SwiftGenWMO (Release)` scheme).

```
Ld /Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Intermediates/SwiftGenWMO.build/Release-iphonesimulator/SwiftGenWMO.build/Objects-normal/i386/SwiftGenWMO normal i386
    cd /Users/ben/dev/ios/SwiftGenWMO
    export IPHONEOS_DEPLOYMENT_TARGET=9.1
    export PATH="/Applications/Xcode7.1.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode7.1.app/Contents/Developer/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode7.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -arch i386 -isysroot /Applications/Xcode7.1.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator9.1.sdk -L/Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Products/Release-iphonesimulator -F/Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Products/Release-iphonesimulator -filelist /Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Intermediates/SwiftGenWMO.build/Release-iphonesimulator/SwiftGenWMO.build/Objects-normal/i386/SwiftGenWMO.LinkFileList -Xlinker -rpath -Xlinker @executable_path/Frameworks -mios-simulator-version-min=9.1 -Xlinker -objc_abi_version -Xlinker 2 -L/Applications/Xcode7.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphonesimulator -Xlinker -add_ast_path -Xlinker /Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Intermediates/SwiftGenWMO.build/Release-iphonesimulator/SwiftGenWMO.build/Objects-normal/i386/SwiftGenWMO.swiftmodule -Xlinker -dependency_info -Xlinker /Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Intermediates/SwiftGenWMO.build/Release-iphonesimulator/SwiftGenWMO.build/Objects-normal/i386/SwiftGenWMO_dependency_info.dat -o /Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Intermediates/SwiftGenWMO.build/Release-iphonesimulator/SwiftGenWMO.build/Objects-normal/i386/SwiftGenWMO

Undefined symbols for architecture i386:
  "direct type metadata for ext.SwiftGenWMO.__ObjC.UIColor.Name", referenced from:
      _globalinit_33_9DB38CA9AF8247CBBD097F938D9B20B4_func0 in ViewController.o
      generic specialization <ext.SwiftGenWMO.__ObjC.UIColor.Name with ext.SwiftGenWMO.__ObjC.UIColor.Name : Swift.Hashable in SwiftGenWMO, Swift.UInt32> of static Swift._VariantDictionaryStorage.maybeGetFromCocoaStorage <A, B where A: Swift.Hashable> (Swift._VariantDictionaryStorage<A, B>.Type)(Swift._CocoaDictionaryStorage, forKey : A) -> B? in ViewController.o
      function signature specialization <Arg[1] = Dead> of generic specialization <(ext.SwiftGenWMO.__ObjC.UIColor.Name, Swift.UInt32)> of static Swift.Array._allocateBufferUninitialized <A> ([A].Type)(Swift.Int) -> Swift._ArrayBuffer<A> in ViewController.o
      function signature specialization <Arg[0] = Owned To Guaranteed, Arg[1] = Dead> of generic specialization <ext.SwiftGenWMO.__ObjC.UIColor.Name with ext.SwiftGenWMO.__ObjC.UIColor.Name : Swift.Hashable in SwiftGenWMO, Swift.UInt32> of static Swift._NativeDictionaryStorage.fromArray <A, B where A: Swift.Hashable> (Swift._NativeDictionaryStorage<A, B>.Type)([(A, B)]) -> Swift._NativeDictionaryStorage<A, B> in ViewController.o
ld: symbol(s) not found for architecture i386
clang: error: linker command failed with exit code 1 (use -v to see invocation)

Ld /Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Intermediates/SwiftGenWMO.build/Release-iphonesimulator/SwiftGenWMO.build/Objects-normal/x86_64/SwiftGenWMO normal x86_64
    cd /Users/ben/dev/ios/SwiftGenWMO
    export IPHONEOS_DEPLOYMENT_TARGET=9.1
    export PATH="/Applications/Xcode7.1.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode7.1.app/Contents/Developer/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode7.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -arch x86_64 -isysroot /Applications/Xcode7.1.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator9.1.sdk -L/Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Products/Release-iphonesimulator -F/Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Products/Release-iphonesimulator -filelist /Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Intermediates/SwiftGenWMO.build/Release-iphonesimulator/SwiftGenWMO.build/Objects-normal/x86_64/SwiftGenWMO.LinkFileList -Xlinker -rpath -Xlinker @executable_path/Frameworks -mios-simulator-version-min=9.1 -Xlinker -objc_abi_version -Xlinker 2 -L/Applications/Xcode7.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphonesimulator -Xlinker -add_ast_path -Xlinker /Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Intermediates/SwiftGenWMO.build/Release-iphonesimulator/SwiftGenWMO.build/Objects-normal/x86_64/SwiftGenWMO.swiftmodule -Xlinker -dependency_info -Xlinker /Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Intermediates/SwiftGenWMO.build/Release-iphonesimulator/SwiftGenWMO.build/Objects-normal/x86_64/SwiftGenWMO_dependency_info.dat -o /Users/ben/Library/Developer/Xcode/DerivedData/SwiftGenWMO-cpguaisqqgbnnhabwlwdrmjpjnmy/Build/Intermediates/SwiftGenWMO.build/Release-iphonesimulator/SwiftGenWMO.build/Objects-normal/x86_64/SwiftGenWMO

Undefined symbols for architecture x86_64:
  "direct type metadata for ext.SwiftGenWMO.__ObjC.UIColor.Name", referenced from:
      _globalinit_33_9DB38CA9AF8247CBBD097F938D9B20B4_func0 in ViewController.o
      generic specialization <ext.SwiftGenWMO.__ObjC.UIColor.Name with ext.SwiftGenWMO.__ObjC.UIColor.Name : Swift.Hashable in SwiftGenWMO, Swift.UInt32> of static Swift._VariantDictionaryStorage.maybeGetFromCocoaStorage <A, B where A: Swift.Hashable> (Swift._VariantDictionaryStorage<A, B>.Type)(Swift._CocoaDictionaryStorage, forKey : A) -> B? in ViewController.o
      function signature specialization <Arg[1] = Dead> of generic specialization <(ext.SwiftGenWMO.__ObjC.UIColor.Name, Swift.UInt32)> of static Swift.Array._allocateBufferUninitialized <A> ([A].Type)(Swift.Int) -> Swift._ArrayBuffer<A> in ViewController.o
      function signature specialization <Arg[0] = Owned To Guaranteed, Arg[1] = Dead> of generic specialization <ext.SwiftGenWMO.__ObjC.UIColor.Name with ext.SwiftGenWMO.__ObjC.UIColor.Name : Swift.Hashable in SwiftGenWMO, Swift.UInt32> of static Swift._NativeDictionaryStorage.fromArray <A, B where A: Swift.Hashable> (Swift._NativeDictionaryStorage<A, B>.Type)([(A, B)]) -> Swift._NativeDictionaryStorage<A, B> in ViewController.o
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

## Xcode Versions

The following versions of Xcode have all been tested with the project and have this issue with WMO builds:

- 7.1 (7B91b)
- 7.1.1 (7B1005)
- 7.2 beta 3 (7C62)

## License

This repo is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for rights and limitations.
