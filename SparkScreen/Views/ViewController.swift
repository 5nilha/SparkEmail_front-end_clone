//
//  ViewController.swift
//  SparkScreen
//
//  Created by Fabio Quintanilha on 11/28/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newEmailCircleView: UIView!
    
    
    var viewModel: EmailListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setupView()
        self.loadEmails()
    }
    
    private func setupView() {
        self.newEmailCircleView.circle()
        self.newEmailCircleView.shadow()
    }
    
    private func loadEmails() {
        DataServices.loadEmails {  [unowned self] (emails) in
            DispatchQueue.main.async {
                self.viewModel = EmailListViewModel(emails: emails.map(EmailViewModel.init))
                self.tableView.reloadData()
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel != nil ? viewModel.numberOfSections : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel != nil ? viewModel.numberOfRowsInSection(section: section) : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath) as! EmailTableViewCell
        
        cell.setupCell(emailViewModel: viewModel.getEmail(section: indexPath.section, row: indexPath.row)!)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return self.viewModel.sections[section]
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 20))
        headerView.backgroundColor = .white
        
        let title = UILabel(frame: CGRect(x: 10, y: 0, width: headerView.bounds.width, height: headerView.bounds.height))
        title.font = .systemFont(ofSize: 11)
        title.textColor = .gray
        title.text = self.viewModel.sections[section]
        headerView.addSubview(title)
        
        
        return headerView
    }

}

