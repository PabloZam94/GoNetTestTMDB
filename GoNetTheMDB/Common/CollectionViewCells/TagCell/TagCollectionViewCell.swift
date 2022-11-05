//
//  TagCollectionViewCell.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 04/11/22.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

// MARK: @IBOUTLETA -
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var lblTagTitle: UILabel!
    
// MARK: STATIC LET -
    static let identifier = "TagCollectionViewCell"
    
// MARK: LIFE CYCLE CELL FUNC -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

// MARK: SETUP FUNC -
    func setupCell(lblText: String) {
        lblTagTitle.text = lblText
        tagView.setViewBorder(radius: 33 / 2, borderColor: .white, borderWidth: 1)
    }

}
