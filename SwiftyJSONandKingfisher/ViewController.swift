//
//  ViewController.swift
//  SwiftyJSONandKingfisher
//
//  Created by Sridatta Nallamilli on 23/12/19.
//  Copyright © 2019 Sridatta Nallamilli. All rights reserved.
//

import UIKit
import SDWebImage

//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() {
//                self.image = image
//            }
//        }.resume()
//    }
//    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//}



struct jsonCountryData {
    var name: String = ""
    var alpha2Code: String = ""
    var flag: String = ""
    
    init() {

    }

    init(json:JSON) {
        name = json["name"].stringValue
        alpha2Code = json["alpha2Code"].stringValue
        flag = json["flag"].stringValue
    }
}

class ViewController: UIViewController {

    var countryArr = [jsonCountryData]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSON(data: data)
//                let names = json["name"]
//                print(names)
                for arr in json.arrayValue {
//                    print(arr["name"])
                    print(arr["flag"])
                    self.countryArr.append(jsonCountryData(json: arr))
                }
                print(self.countryArr)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countries", for: indexPath) as! CountriesTableViewCell
        cell.cName.text = countryArr[indexPath.row].name
        cell.cAlphaTwo.text = countryArr[indexPath.row].alpha2Code
//        cell.imgFlag.kf.setImage(with :URL(string: countryArr[indexPath.row].flag))
        
//        let imgLink = countryArr[indexPath.row].flag
//        cell.imgFlag.downloaded(from: imgLink)
        
//        cell.imgFlag.downloaded(from: countryArr[indexPath.row].flag)
        
//        var imageURL = countryArr[indexPath.row].flag
//        cell.imgFlag?.sd_setImage(with: countryArr[indexPath.row].flag, completed: nil)
        
        return cell
    }
    
    
}

