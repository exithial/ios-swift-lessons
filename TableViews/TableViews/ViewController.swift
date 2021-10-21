import UIKit

class ViewController: UIViewController {
    
    private var myCountries = ["España", "Mexico", "Perú", "Chile", "Argentina", "Estados Unidos", "Colombia", "Francia", "Italia"]

    // Outlets
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCountries.sort()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.register(UINib(nibName:"MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }


}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Celdas simples"
        }
        return "Celdas custom"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Footer para celdas simples"
        }
        return "Footer para celdas custom"
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
                cell?.backgroundColor = .lightGray
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                cell?.accessoryType = .disclosureIndicator
            }
            
            cell!.textLabel?.text = myCountries[indexPath.row]
            return cell!
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
        
        cell?.myFirstLabel.text = String(indexPath.row + 1)
        cell?.mySecondLabel.text = myCountries[indexPath.row]
        
        if indexPath.row == 2 {
            cell?.mySecondLabel.text = "lksadjaklsdjklasjd alksdjaslkdjlaksdj lkasjdklajd lkajsdlkajsdlkajslkd aklsdjlkasd"
        }
        
        return cell!
    }

}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myCountries[indexPath.row])
    }
}
