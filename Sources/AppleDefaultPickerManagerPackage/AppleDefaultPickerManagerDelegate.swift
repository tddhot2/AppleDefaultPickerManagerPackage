//
//  AppleDefaultPickerManagerDelegate.swift
//  AppleDefaultPickerManager
//
//  Created by user on 2022/01/26.
//

import Foundation
import PhotosUI

public protocol AppleDefaultPickerManagerDelegate: AnyObject {
    /// Call when picker view controller was presented.
    func didPresentPicker(_ pickerViewController: PHPickerViewController)

    /// Call when finish to pick assets and tap done button.
    func didFinishPicking(_ pickerViewController: PHPickerViewController, assets: [PHAsset])
}
