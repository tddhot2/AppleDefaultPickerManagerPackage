//
//  PickerConfigurationBuilder.swift
//  AppleDefaultPickerManager
//
//  Created by user on 2022/01/26.
//

import Foundation
import PhotosUI

public final class PickerConfigurationBuilder {
    private var filter: PHPickerFilter?
    private var representationMode: PHPickerConfiguration.AssetRepresentationMode
    private var selectionLimit: Int
    private var selection: PHPickerConfiguration.Selection

    // MARK: - Initializers

    public init() {
        filter = nil
        representationMode = .automatic
        selectionLimit = .max
        selection = .default
    }

    // MARK: - Public Methods

    public func setFilter(_ filter: PHPickerFilter) {
        self.filter = filter
    }

    public func setRepresentationMode(_ mode: PHPickerConfiguration.AssetRepresentationMode) {
        representationMode = mode
    }

    public func setCountOfMaximumSelectableAsset(_ count: Int) {
        selectionLimit = count
    }

    public func setPickerSelectionMode(_ mode: PHPickerConfiguration.Selection) {
        selection = mode
    }

    // MARK: - Internal Methods

    func build() -> PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = filter
        config.preferredAssetRepresentationMode = representationMode
        config.selectionLimit = selectionLimit
        config.selection = selection

        return config
    }
}
