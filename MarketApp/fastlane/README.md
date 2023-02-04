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

### ios build_ipa

```sh
[bundle exec] fastlane ios build_ipa
```

Install Profiles and Build My App

### ios beta

```sh
[bundle exec] fastlane ios beta
```

build app and upload to testflight

### ios get_dev_certs

```sh
[bundle exec] fastlane ios get_dev_certs
```



### ios sync_all_development

```sh
[bundle exec] fastlane ios sync_all_development
```



### ios sync_device_info

```sh
[bundle exec] fastlane ios sync_device_info
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