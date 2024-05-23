//
//  UploadFileRequest.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 1/12/23.
//

import Foundation
import UIKit

struct UploadFileRequest {
    var image: UIImage?
    var fileName: String
    var fileUrl: URL?
    var fileExtension: String
    var mimeType: String
}
