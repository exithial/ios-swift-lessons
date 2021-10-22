import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let myCountries = ["España", "Mexico", "Perú", "Colombia", "Argentina", "EEUU", "Francia", "Italia"]
        
    private let screenWidth = UIScreen.main.bounds.width
    private let myCellWidth = UIScreen.main.bounds.width / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "MyCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCustomCell")
    }


}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCustomCell", for: indexPath) as? MyCustomCollectionViewCell
        
        cell!.myFirstLabel.text = myCountries[indexPath.row]

        return cell!
    }

}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section) -> \(indexPath.row) \(myCountries[indexPath.row])")
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: myCellWidth, height: myCellWidth)
        }
        return CGSize(width: screenWidth, height: screenWidth)
    }
}
