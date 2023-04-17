# AppleDefaultPickerManagerPackage

Description : Present PHPickerViewController to check and get `PHAsset` simply

# Contents
- [Available Versions](#available-versions)
- [Usage](#usage)
  * [Present Default Apple Picker](#present-default-apple-picker)
  * [Delegate method](#delegate-method)
    + [After presenting picker](#after-presenting-picker)
    + [After user select done button with some medias](#after-user-select-done-button-with-some-medias)
    
# Available Versions

- Available since iOS 15.0.

# Usage

- You should use all API by `shared` of `AppleDefaultPickerManager`

## Present Default Apple Picker
```Swift
public func presentPicker(_ presentingViewController: UIViewController) async
```

- This is `async` method so you should call in statement to allow `await` method.
- Default picker will be presented on `presentingViewController`.
- You must be responsible for dismissing picker when user finish to pick some medias. Please refer the delegate method [here]()

## Delegate method

- There are two delegate methods when events occurs

### After presenting picker

```Swift
func didPresentPicker(_ pickerViewController: PHPickerViewController)
```

- Notify presenting picker was finished. You can use `PHPickerViewController` instance.

### After user select done button with some medias

```Swift
func didFinishPicking(_ pickerViewController: PHPickerViewController, assets: [PHAsset])
```

- User done selecting medias.
- second parameter `assets` can be empty so please use carefully.
- You can decide to dismiss picker by some cases.
