//
//  ShowImageViewController.swift
//  Dacadoo_iOS_Exercise
//
//  Created by Angelos Staboulis on 19/5/24.
//

import UIKit
protocol TransferValue{
    var url:String{get}
}
class ShowImageViewController: UIViewController,TransferValue {
    var url: String = ""
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccesibility()
        initialView()
        showImage()
        // Do any additional setup after loading the view.
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ShowImageViewController{
    func initialView(){
        navigationItem.title = "Show Image"
    }
    func setupAccesibility(){
        view.isAccessibilityElement = true
        view.accessibilityValue = "Show Image"
    }
    func showImage(){
        imageView.loadFrom(URLAddress:url)
    }
}
