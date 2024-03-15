//
//  NewsTableViewCell.swift
//  AppDioNews
//
//  Created by Mrpay on 15/03/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceNameLabel:UILabel!
    @IBOutlet weak var authorLabel:UILabel!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var imageImageView:UIImageView!
    @IBOutlet weak var publishedLabel:UILabel!
    @IBOutlet weak var linkImageView:UIImageView!
    public var news:NewsModel?{
        didSet{
            self.sourceNameLabel.text = news?.source?.name
            self.authorLabel.text = news?.autor
            self.titleLabel.text = news?.title
            self.descriptionLabel.text = news?.description
            self.imageImageView.LoadImage()
            self.publishedLabel.text = news?.publishedAt.ToString()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension Date{
    func ToString(with formater:String = "dd/MM/yyyy")->String{
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = formater
        return dateFormat.string(from: self)
    }
}
extension UIImageView{
    func LoadImage(){
        self.image = UIImage(named: "NoImage.png")
    }
}
