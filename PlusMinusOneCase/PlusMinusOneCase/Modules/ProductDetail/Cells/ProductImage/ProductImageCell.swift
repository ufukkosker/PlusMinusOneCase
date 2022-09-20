//
//  ProductImageCell.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 18.09.2022.
//

import UIKit

class ProductImageCell: UITableViewCell, NibLoadable {

    @IBOutlet weak private var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareProductImage(with url: String) {
        guard let imageURL = URL(string: url) else { return }
        productImageView.downloaded(from: imageURL, contentMode: .scaleAspectFill)
    }
}
