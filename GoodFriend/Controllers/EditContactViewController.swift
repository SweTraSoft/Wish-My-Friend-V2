//
//  EditContactViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-02-04.
//

import UIKit
import ContactsUI

class EditContactViewController: UIViewController {

    var contactSelected: CNContact?
    var sampleDelegate: ContactsViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var contactSelected = self.contactSelected!
        let contactViewController = CNContactViewController(for: contactSelected)
        contactViewController.delegate = sampleDelegate
        let navigationController = UINavigationController(rootViewController: contactViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
        self.navigationController!.dismiss(animated: true, completion:nil)
    }

}
