fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios pod_install

```sh
[bundle exec] fastlane ios pod_install
```

Runs `pod install`

### ios lint

```sh
[bundle exec] fastlane ios lint
```

Run swift code validation using SwiftLint

### ios increment_build

```sh
[bundle exec] fastlane ios increment_build
```

Incrementing Build Number

### ios unit_Test

```sh
[bundle exec] fastlane ios unit_Test
```

Unit test

### ios resolve_packages

```sh
[bundle exec] fastlane ios resolve_packages
```



### ios build_ipa

```sh
[bundle exec] fastlane ios build_ipa
```

Install Profiles and Build My App

### ios upload_testflight

```sh
[bundle exec] fastlane ios upload_testflight
```

Description of what the lane does

### ios upload_firebase

```sh
[bundle exec] fastlane ios upload_firebase
```

upload Firebase App Distribution

### ios get_dev_certs

```sh
[bundle exec] fastlane ios get_dev_certs
```



### ios release

```sh
[bundle exec] fastlane ios release
```

Description of what the lane does

Push a new release build to the App Store

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
