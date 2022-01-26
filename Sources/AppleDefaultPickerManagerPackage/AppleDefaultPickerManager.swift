//
//  AppleDefaultPickerManager.swift
//  AppleDefaultPickerManager
//
//  Created by user on 2022/01/26.
//

import Foundation
import Photos
import UIKit
import PhotosUI 

/// A object helps to open and get assets by default picker.
public final class AppleDefaultPickerManager {
    public static let shared = AppleDefaultPickerManager()

    // MARK: - Public variables

    /// Delegate methods. Refer to `AppleDefaultPickerManagerDelegate`
    public weak var delegate: AppleDefaultPickerManagerDelegate?

    /// A builder contains various options when presenting picker.
    public var configBuilder = PickerConfigurationBuilder()

    /// Access level to library, default value is readWrite.
    public var accessLevel: PHAccessLevel = .readWrite

    /// A style to present picker.
    public var presentationStyle: UIModalPresentationStyle = .automatic

    // MARK: - Private variables

    private lazy var authorizationService = GalleryAuthorizationService(accessLevel: accessLevel)
    private var pickerViewController: PHPickerViewController?

    // MARK: - Public Methods

    /// Present picker from `presentingViewController`.
    /// By using `PickerConfigurationBuilder`, you can change representation of picker.
    public func presentPicker(_ presentingViewController: UIViewController) async {
        guard authorizationService.authorizationResult == .authorized else {
            let result = await authorizationService.requestAuthorization()

            if result == .authorized {
                showPicker(presentingViewController)
            }
            else {
                print("Please authorize to access gallery")
            }

            return
        }

        showPicker(presentingViewController)
    }

    // MARK: - Private Methods

    private func showPicker(_ presentingViewController: UIViewController) {
        let config = configBuilder.build()
        let pickerViewController = PHPickerViewController(configuration: config)
        pickerViewController.modalPresentationStyle = presentationStyle
        pickerViewController.delegate = self

        presentingViewController.present(pickerViewController, animated: true) {
            self.delegate?.didPresentPicker(pickerViewController)
        }

        self.pickerViewController = pickerViewController
    }
}

// MARK: - Extension - PHPickerViewControllerDelegate

extension AppleDefaultPickerManager: PHPickerViewControllerDelegate {
    public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let assetIdentifiers = results.compactMap { result -> String? in
            result.assetIdentifier
        }

        var assets = [PHAsset]()
        let fetchResult: PHFetchResult<PHAsset> = PHAsset.fetchAssets(withLocalIdentifiers: assetIdentifiers, options: nil)

        fetchResult.enumerateObjects { asset, _, _ in
            assets.append(asset)
        }

        delegate?.didFinishPicking(picker, assets: assets)
    }
}
