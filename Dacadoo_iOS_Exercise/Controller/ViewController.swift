//
//  ViewController.swift
//  Dacadoo_iOS_Exercise
//
//  Created by Angelos Staboulis on 17/5/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var pictureInfo=[Urls](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var viewModel = PhotoViewModel()
    
    @IBOutlet weak var txtWidth: NSLayoutConstraint!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var txtPhrase: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
        setupTableView()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        guard let phrase = txtPhrase.text else{
            return
        }
        pictureInfo.removeAll()
        fetchData(query: phrase)
    }
    
}
extension ViewController{
    func initialView(){
        navigationItem.title = "iOS_Exercise"
        setupIpadConstraints()
        setupAccessibility()
    }
    func setupAccessibility(){
        tableView.isAccessibilityElement = true
        tableView.accessibilityValue = "Image from Unsplash API"
        txtPhrase.isAccessibilityElement = true
        txtPhrase.accessibilityValue = "Enter your Phrase"
        btnSearch.isAccessibilityElement = true
        btnSearch.accessibilityValue = "Search Image"
    }
    func setupIpadConstraints(){
        if UIDevice.current.userInterfaceIdiom == .pad{
            txtPhrase.translatesAutoresizingMaskIntoConstraints = false
            txtWidth.constant = 600
        }else{
            txtPhrase.translatesAutoresizingMaskIntoConstraints = false
            txtWidth.constant = 250
        }
    }
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        fetchData(query: "all")
    }
    func getURL(apiURL:String)  {
            viewModel.getAllPhotos(urlString: apiURL) { imageinfo in
                self.pictureInfo.append(contentsOf: imageinfo)
            }
    }
    func fetchData(query:String){
        getURL(apiURL:"https://api.unsplash.com/search/photos?query=\(query)&client_id=NHr5nmnvy4fJA0AtfpReQm_EI2SBnnvPajDObRtmYbY")
    }
    func showImage(indexPath:IndexPath){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let imageViewController = storyboard.instantiateViewController(identifier: "ShowImageViewController") as! ShowImageViewController
        imageViewController.url = pictureInfo[indexPath.row].regular
        self.navigationController?.pushViewController(imageViewController, animated: true)
    }
    func createCell(tableView:UITableView,indexPath:IndexPath)->CellImage{
        let cell:CellImage = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellImage
        cell.backgroundColor = .white
        cell.mainImage.loadFrom(URLAddress: pictureInfo[indexPath.row].regular)
        return cell
    }
}

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictureInfo.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  450
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showImage(indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createCell(tableView: tableView, indexPath: indexPath)
    }
    
    
    
}
