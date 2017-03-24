

import Foundation
import UIKit


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrayName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell:TableViewCellHome = tableView.dequeueReusableCell(withIdentifier: Identifiers.identifierTableViewHome.id, for: indexPath) as? TableViewCellHome else{ return TableViewCellHome()}
        cell.lblSenderName.text = arrayName[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: Identifiers.identifiersegue.id, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destViewController = segue.destination as?
            ViewControllerChat{
            destViewController.Id = arrayId[index]
            destViewController.name = arrayName[index]
        }
    }
    
}
