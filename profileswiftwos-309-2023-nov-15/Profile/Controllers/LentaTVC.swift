//
//  LentaTVC.swift
//  Profile
//
import UIKit

class LentaTVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileDelegate
{
    func editProfile(vc: ProfileViewController, someData: String) {
        print(someData)
    }
    
    var tableView: UITableView!
    var index: Int?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as! MyTVC
//        cell.textLabel?.text = "Profile \(indexPath.row + 1)" // "Profile " + indexPath.row
        cell.profileName.text = "Profile \(indexPath.row + 1)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        print(indexPath.row)
        let vc = RegistrationViewController() // AboutViewController() // ProfileViewController()
//        vc.delegate = self
//        self.index = indexPath.row
//        vc.index = self.index
        present(vc, animated: true, completion: nil) // open window to edit profile
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    func setupTableView() {
        view.backgroundColor = UIColor.red
        let rect = CGRect(x: 15, y: 15, width: view.frame.width - 30, height: view.frame.height - 30)
        tableView = UITableView(frame: rect)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellId)
        tableView.register(MyTVC.self, forCellReuseIdentifier: Constants.cellId)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = view.frame.height / 12
        tableView.backgroundColor = UIColor.green
        tableView.translatesAutoresizingMaskIntoConstraints = false // !
        tableView.layer.cornerRadius = view.frame.height / 36
        tableView.layer.masksToBounds = true
        
        self.view.addSubview(tableView)
    }
    
    
}
