# AppleDefaultPickerManagerPackage

Description : Present PHPickerViewController to check and get `PHAsset` simply

## Available Versions

- Can only use this package over iOS 15.0 
- `PHPickerViewController` can be used over iOS 14.0
- `PHPickerConfiguration.Selection` can be used over iOS 15.0

## Usage

- You should use all API by `shared` of `AppleDefaultPickerManager`

### `public func presentPicker(_ presentingViewController: UIViewController) async`
- This method present `PHPickerViewController` from your view controller. However, this method require async logic because authorization so you shoul like below.
`
Task {
    presentPicker(Your View Controller)
}
`
