//
//  AboutViewController.swift
//  Profile
//
import UIKit

class AboutViewController: UIViewController
{
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "About App"
        label.textColor = Colors.white.uiColor
        label.font = Constants.font2
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.darkblue.uiColor
        view.addSubview(titleLabel)
        
        titleLabel.pinTop(to: self.view, Constants.inset)
        titleLabel.pinCenterX(to: self.view)
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        scrollView.pinTop(to: self.view.safeAreaLayoutGuide.topAnchor, Constants.inset * 4)
        scrollView.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        scrollView.pinLeft(to: self.view.safeAreaLayoutGuide.leadingAnchor, Constants.inset)
        scrollView.pinRight(to: self.view.safeAreaLayoutGuide.trailingAnchor, Constants.inset)
        
        //        scrollView.backgroundColor = .gray
        
        let aboutLabel = UILabel()
        aboutLabel.numberOfLines = 0
        aboutLabel.textColor = Colors.white.uiColor
//        aboutLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        
        aboutLabel.font = Constants.font
        aboutLabel.text = """
        Lorem ipsum dolor sit amet,
        consectetur adipiscing elit, sed
        do eiusmod tempor incididunt
        ut labore et dolore
        magna aliqua.
        Ut enim ad minim veniam,
        quis nostrud
        exercitation ullamco
        laboris nisi ut aliquip
        ex ea commodo consequat.
        Duis aute irure dolor in
        reprehenderit in voluptate
        velit esse cillum
        dolore eu fugiat nulla
        pariatur. Excepteur sint
        occaecat cupidatat non proident,
        sunt in culpa qui officia deserunt
        mollit anim id est
        laborum.
                Lorem ipsum dolor
                sit amet,
                consectetur adipiscing
                elit, sed
                do eiusmod tempor incididunt
                ut labore et dolore
                magna aliqua.
                Ut enim ad minim veniam,
                quis nostrud
                exercitation ullamco
                laboris nisi ut aliquip
                ex ea commodo consequat.
                Duis aute irure dolor in
                reprehenderit in voluptate
                velit esse cillum
                dolore eu fugiat nulla
                pariatur. Excepteur sint
                occaecat cupidatat non proident,
                sunt in culpa qui officia deserunt
                mollit anim id est
                laborum.
        """
        
        aboutLabel.sizeToFit()
        scrollView.addSubview(aboutLabel)
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: aboutLabel.frame.height)
        
        
    }
    
    
    
    
    
}
