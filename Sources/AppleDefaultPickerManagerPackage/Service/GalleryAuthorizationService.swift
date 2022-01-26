//
//  GalleryAuthorizationService.swift
//  AppleDefaultPickerManager
//
//  Created by user on 2022/01/26.
//

import Foundation
import Photos

/// A object manages authorization for accessing gallery.
final class GalleryAuthorizationService {
    let accessLevel: PHAccessLevel
    private(set) var authorizationResult: GalleryAuthorizationResult = .impossible

    // MARK: - Initializers

    init(accessLevel: PHAccessLevel) {
        self.accessLevel = accessLevel
        let status = PHPhotoLibrary.authorizationStatus(for: accessLevel)
        authorizationResult = GalleryAuthorizationResult(status)
    }

    // MARK: - Internal Methods

    func requestAuthorization() async -> GalleryAuthorizationResult {
        let status = await PHPhotoLibrary.requestAuthorization(for: accessLevel)

        return GalleryAuthorizationResult(status)
    }
}
