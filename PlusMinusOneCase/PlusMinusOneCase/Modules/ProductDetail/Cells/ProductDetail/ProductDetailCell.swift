//
//  ProductDetailCell.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 18.09.2022.
//

import UIKit

protocol TimerCallbackable: AnyObject {
    func didFinishTimer()
}
// MARK: - ProductDetailCell
final class ProductDetailCell: UITableViewCell, NibLoadable {

    // MARK: UIElements
    @IBOutlet weak private var productNameLabel: UILabel!
    @IBOutlet weak private var productDescriptionLabel: UILabel!
    @IBOutlet weak private var heartImageView: UIImageView!
    @IBOutlet weak private var likeCountLabel: UILabel!
    @IBOutlet weak private var ratingLabel: UILabel!
    @IBOutlet weak private var starRatingView: StarRatingView!
    @IBOutlet weak private var commentCountLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var circleCountDownLabel: CircleCountDownView!
    
    // MARK: Variable
    weak var timerCallbackable: TimerCallbackable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        circleCountDownLabel.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareProductDetail(_ model: ProductDetailModule.DetailItemViewModel) {
        
        circleCountDownLabel.backgroundColor = .clear
        circleCountDownLabel.labelFont = UIFont.boldSystemFont(ofSize: 10)
        circleCountDownLabel.labelTextColor = .orange
        circleCountDownLabel.start(beginingValue: 5, interval: 1)
        
        starRatingView.rating = Float(model.commentCounts.averageRating)
        productNameLabel.text = model.name
        productDescriptionLabel.text = model.desc
        likeCountLabel.text = "\(model.likeCount)"
        ratingLabel.text = "\(Double(model.commentCounts.averageRating))"
        commentCountLabel.text = "(\(model.commentCounts.memberCommentsCount + model.commentCounts.anonymousCommentsCount) yorum)"
        priceLabel.text = "\(model.price.value) \(model.price.currency)"
    }
}
// MARK: - Extension
extension ProductDetailCell: CircleCountDownViewDelegate {
    func timerDidEnd(sender: CircleCountDownView, elapsedTime: TimeInterval) {
        timerCallbackable?.didFinishTimer()
    }
}
