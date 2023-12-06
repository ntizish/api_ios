//
//  MyTVC.swift
//  Profile
//
import UIKit

class MyTVC: UITableViewCell
{
    let profileImage: UIImageView = {
        let image = UIImage(named: "DefaultAvatar")
        let control = UIImageView(image: image)
        return control
    }()
    
    
    let profileName: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        control.textAlignment = .left
        control.textColor = UIColor.red
        control.text = "Default profile"
        control.translatesAutoresizingMaskIntoConstraints = false // !
        return control
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func addView() {
        backgroundColor = UIColor.blue
        addSubview(profileImage)
        addSubview(profileName)
        
        profileImage.pinLeft(to: self, 15)
        profileImage.pinTop(to: self, 15)
        profileImage.setWidth(36)
        profileImage.setHeight(36)
//        profileImage.pin(to: self)
        
        profileName.pinTop(to: self, 15)
        profileName.pinRight(to: self, 15)
    }
    
    
    
}
