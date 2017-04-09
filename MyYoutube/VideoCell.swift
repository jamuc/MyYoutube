import UIKit

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "16-9")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.image = UIImage(named: "jason-franklin-foto.256x256")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let separatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = UIColor.rgb(colorLiteralRed: 230, green: 230, blue: 230)
        return separator
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a really cool video"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let videoDescription: UITextView = {
        let textView = UITextView()
        textView.text = "Foobar • 1,684,687 views • 2 years"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.lightGray
        return textView
    }()

    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(photoImageView)
        addSubview(separatorView)
        addSubview(titleLabel)
        addSubview(videoDescription)

        addConstraints(withFormat: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraints(withFormat: "H:|-16-[v0(44)]", views: photoImageView)
        addConstraints(withFormat: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, photoImageView, separatorView)
        addConstraints(withFormat: "H:|[v0]|", views: separatorView)

        // title label
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: photoImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))

        // text view
        addConstraint(NSLayoutConstraint(item: videoDescription, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: videoDescription, attribute: .left, relatedBy: .equal, toItem: photoImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: videoDescription, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: videoDescription, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
    }
}
