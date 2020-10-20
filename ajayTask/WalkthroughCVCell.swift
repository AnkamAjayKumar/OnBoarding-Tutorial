//
//  WalkthroughCVCell.swift
//  ajayTask
//
//  Created by Himansu Sekhar Panigrahi on 27/07/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class WalkthroughCVCell:UICollectionViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.contentMode = .scaleToFill
    }
}
