# Countdown

## Language
The Countdown iOS app is written in Objective C. 

## Environment
The Countdown iOS app uses several tools to enable development and deployment.

#### Xcode
The currently build is built using Xcode 10.2 (this information is also included in the `.xcode-version` file). It is recommended to use the most recent version of Xcode.

[Download previous versions of Xcode](https://developer.apple.com/download/more/?name=Xcode)

#### Fastlane
Fastlane is used to automate building and deploying the application. Fastlane support is still being added, so not every lane is fully functional yet. Refer to the `fastlane/fastfile` to see which lanes are fully implemented and can be used.

[GitHub](https://github.com/fastlane/fastlane)
[Documentation](https://docs.fastlane.tools/ "docs.fastlane.tools")

## Project Structure
This project's files are organized pretty simply. All source code for the main application is contained in the `Source` directory. Xcode keeps the project's groups synchronized with the directories within `Source`.

## Build Instructions
1. Open the Xcode project `Countdown.xcodeproj`.
2. Select a scheme and build the project.

## Testing Deployment
The testing lane in FastLane is not configured yet. To deploy the testing build, archive the Countdown scheme in Xcode, and use the Xcode Organizer to upload the build to App Store Connect. Complete the rest of the deployment from [App Store Connect](appstoreconnect.apple.com).

## Release Deployment
The release lane in FastLane is not configured yet. To deploy the release build, archive the Countdown scheme in Xcode, and use the Xcode Organizer to upload the build to App Store Connect. Complete the rest of the deployment from [App Store Connect](appstoreconnect.apple.com).
