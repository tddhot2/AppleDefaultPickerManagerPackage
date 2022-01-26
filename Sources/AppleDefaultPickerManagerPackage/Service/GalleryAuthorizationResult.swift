//
//  GalleryAuthorizationResult.swift
//  AppleDefaultPickerManager
//
//  Created by user on 2022/01/26.
//

import Foundation
import Photos

enum GalleryAuthorizationResult {
    case authorized
    case impossible

    // MARK: - Initializers

    init(_ status: PHAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied, .limited:
            self = .impossible
        case .authorized:
            self = .authorized
        @unknown default:
            fatalError("Should assign proper status")
        }
    }
}
