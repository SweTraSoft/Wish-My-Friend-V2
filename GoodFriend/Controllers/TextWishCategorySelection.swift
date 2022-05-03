//
//  TextWishCategorySelectionViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-02-27.
//

import Foundation
import UIKit

class TextWishCategorySelection: UIView
{
    static let instance = TextWishCategorySelection()
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var categorySelectionView: UIView!
    @IBOutlet weak var filterView: UIView!
    //Switches for all relations
    @IBOutlet weak var momSwitch: UISwitch!
    @IBOutlet weak var dadSwitch: UISwitch!
    @IBOutlet weak var wifeSwitch: UISwitch!
    @IBOutlet weak var husbandSwitch: UISwitch!
    @IBOutlet weak var gfSwitch: UISwitch!
    @IBOutlet weak var bfSwitch: UISwitch!
    @IBOutlet weak var brotherSwitch: UISwitch!
    @IBOutlet weak var sisterSwitch: UISwitch!
    @IBOutlet weak var friendSwitch: UISwitch!
    @IBOutlet weak var bossSwitch: UISwitch!
    
    //Buttons
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var removeallButton: UIButton!
    @IBOutlet weak var discardButton: UIButton!
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("TextWishCategorySelection", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit()
    {
        parentView.frame = CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        filterView.layer.cornerRadius = 10
    }
    
    func showFilters()
    {
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    
    @IBAction func clickApply(_ sender: Any) {
        print("clicking apply")
        parentView.removeFromSuperview()
    }
    
    
    @IBAction func clickRemoveall(_ sender: Any) {
        parentView.removeFromSuperview()
    }
    
    
    @IBAction func clickDiscard(_ sender: Any) {
        parentView.removeFromSuperview()
    }
    
}
