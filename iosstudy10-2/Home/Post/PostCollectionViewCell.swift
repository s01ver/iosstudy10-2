//
//  PostCollectionViewCell.swift
//  iosstudy10-2
//
//
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostCollectionViewCell"

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData() {
        
    }

}

