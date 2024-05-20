//
//  CellImage.swift
//  Dacadoo_iOS_Exercise
//
//  Created by Angelos Staboulis on 19/5/24.
//

import UIKit

class CellImage: UITableViewCell {

    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var centerY: NSLayoutConstraint!
    @IBOutlet weak var mainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAccessiblity()
        setupIpadConstraints()
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImage.image = nil
    }
}
extension CellImage{
    func setupAccessiblity(){
        mainImage.isAccessibilityElement = true
        mainImage.accessibilityHint = "Image for Unsplash Rest-API"
    }
    func setupIpadConstraints(){
        if UIDevice.current.userInterfaceIdiom == .pad{
            mainImage.translatesAutoresizingMaskIntoConstraints = false
            leading.constant = (UIScreen.main.bounds.width / 2.0)-120
        }
    }
}
