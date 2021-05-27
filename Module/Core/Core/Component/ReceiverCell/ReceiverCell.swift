//
//  ReceiverCell.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import Kingfisher

public class ReceiverCell: UITableViewCell {

    @IBOutlet var receiverNameLabel: UILabel!
    @IBOutlet var receiverPhoneLabel: UILabel!
    @IBOutlet var receiverPhoto: UIImageView!
    @IBOutlet var backgroundCell: UIView!
    var url: String = ""
    var id: Int = 0
    public var passDataTransaction: ReceiverEntity = ReceiverEntity(id: 0, name: "", phone: "", image: "")
    
    public var delegate: ReceiverCellDelegate?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundCell.setShadow(color: UIColor.black.cgColor, opacity: 0.1)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        backgroundCell.addGestureRecognizer(tap)

    }
    
    public func showDataReceiver(receiver: ReceiverEntity) {
        self.receiverNameLabel.text = receiver.name
        self.receiverPhoneLabel.text = receiver.phone
        id = receiver.id
        url = receiver.image
        self.receiverPhoto.kf.setImage(with: URL(string: url))
        
        passDataTransaction.id = receiver.id
        passDataTransaction.name = self.receiverNameLabel.text ?? ""
        passDataTransaction.phone = self.receiverPhoneLabel.text ?? ""
        passDataTransaction.image = url
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.delegate?.passDataTransaction(passData: passDataTransaction)
    }
}
