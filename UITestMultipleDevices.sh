#--- xcodebuild: WARNING: Using the first of multiple matching destinations:
#{ platform:macOS, arch:arm64, variant:Designed for [iPad,iPhone], id:00006020-000429493A6B401E, name:My Mac }
#{ platform:iOS, id:dvtdevice-DVTiPhonePlaceholder-iphoneos:placeholder, name:Any iOS Device }
#{ platform:iOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-iphonesimulator:placeholder, name:Any iOS #Simulator Device }
#{ platform:iOS Simulator, id:659849D3-4A1B-428B-BB0B-8DFA0EE9E3AA, OS:17.2, name:iPhone 12 }
#{ platform:iOS Simulator, id:659849D3-4A1B-428B-BB0B-8DFA0EE9E3AA, OS:17.2, name:iPhone 12 }
#{ platform:iOS Simulator, id:5C2B79E3-BB79-47C3-8844-7524499C4652, OS:17.5, name:iPhone 12 }
#{ platform:iOS Simulator, id:5C2B79E3-BB79-47C3-8844-7524499C4652, OS:17.5, name:iPhone 12 }
#{ platform:iOS Simulator, id:2AD0893C-D25E-48B3-B760-C80913266EDA, OS:17.2, name:iPhone 12 mini }
#{ platform:iOS Simulator, id:2AD0893C-D25E-48B3-B760-C80913266EDA, OS:17.2, name:iPhone 12 mini }
#{ platform:iOS Simulator, id:F4F6C674-0F89-4C42-8360-46AA2388C832, OS:17.5, name:iPhone 15 }
#{ platform:iOS Simulator, id:F4F6C674-0F89-4C42-8360-46AA2388C832, OS:17.5, name:iPhone 15 }
#{ platform:iOS Simulator, id:E873767A-34B1-4A62-A4C4-C5B84AC62DE1, OS:17.2, name:iPhone 15 Plus }
#{ platform:iOS Simulator, id:E873767A-34B1-4A62-A4C4-C5B84AC62DE1, OS:17.2, name:iPhone 15 Plus }
#{ platform:iOS Simulator, id:5A110F9B-9DA1-4E23-9C95-6173793DA94E, OS:17.2, name:iPhone 15 Pro }
#{ platform:iOS Simulator, id:5A110F9B-9DA1-4E23-9C95-6173793DA94E, OS:17.2, name:iPhone 15 Pro }
#{ platform:iOS Simulator, id:F1157C5C-FCB0-445D-AC40-3789E76D9C78, OS:17.2, name:iPhone 15 Pro Max }
#{ platform:iOS Simulator, id:F1157C5C-FCB0-445D-AC40-3789E76D9C78, OS:17.2, name:iPhone 15 Pro Max }
#{ platform:iOS Simulator, id:DBA15F22-8769-4FD8-BA69-721B78B60D5B, OS:17.5, name:iPhone SE (3rd generation) }
#{ platform:iOS Simulator, id:DBA15F22-8769-4FD8-BA69-721B78B60D5B, OS:17.5, name:iPhone SE (3rd generation) }
#{ platform:iOS Simulator, id:0CAB3BED-9B66-4899-8421-FF8BDBCE8D76, OS:17.2, name:iPhone Xs }
#{ platform:iOS Simulator, id:0CAB3BED-9B66-4899-8421-FF8BDBCE8D76, OS:17.2, name:iPhone Xs }
#{ platform:iOS Simulator, id:EC4FBA44-E8EE-44B4-A49F-2729C59F9145, OS:17.5, name:iPhone Xs }
# platform:iOS Simulator, id:EC4FBA44-E8EE-44B4-A49F-2729C59F9145, OS:17.5, name:iPhone Xs }


xcodebuild test -testPlan UITestingSample -project UITestingSample.xcodeproj -scheme UITestingSample \
-destination 'platform=iOS Simulator,name=iPhone 15,OS=17.5' \
-destination 'platform=iOS Simulator,name=iPhone 12,OS=17.5' \
-destination 'platform=iOS Simulator,name=iPhone 12 mini,OS=17.2' \
-destination 'platform=iOS Simulator,name=iPad (10th generation),OS=17.5'
