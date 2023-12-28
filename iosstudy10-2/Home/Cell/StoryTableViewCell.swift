//
//  StoryTableViewCell.swift
//  iosstudy10-2
//
//
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var colletionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        colletionView.delegate = dataSourceDelegate
        colletionView.dataSource = dataSourceDelegate
        colletionView.tag = row
        
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        colletionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        colletionView.collectionViewLayout = flowLayout
        
        colletionView.reloadData()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
