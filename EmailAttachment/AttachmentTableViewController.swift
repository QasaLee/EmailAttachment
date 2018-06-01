//
//  AttachmentTableViewController.swift
//  EmailAttachment
//
//  Created by Simon Ng on 5/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import MessageUI

class AttachmentTableViewController: UITableViewController {

    let filenames = ["10 Great iPhone Tips.pdf", "camera-photo-tips.html", "foggy.jpg", "Hello World.ppt", "no more complaint.png", "Why Appcoda.doc"]

    enum MIMEType: String {
        case jpg = "image/jpeg"
        case png = "image/png"
        case doc = "application/msword"
        case ppt = "application/vnd.ms-powerpoint"
        case html = "text/html"
        case pdf = "application/pdf"

        init?(type: String) {
            switch type.lowercased() {
            case "jpg": self = .jpg
            case "png": self = .png
            case "doc": self = .doc
            case "ppt": self = .ppt
            case "html": self = .html
            case "pdf": self = .pdf
            default: return nil
            }
        }
    }

    // MARK: - Show Email
    func showEmail(attachment: String) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Enable large title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return filenames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = filenames[indexPath.row]
        cell.imageView?.image = UIImage(named: "icon\(indexPath.row)");

        return cell
    }

}

extension AttachmentTableViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Mail Canceled")
        case .failed:
            print("Failed to send: \(error?.localizedDescription ?? "")")
        case .saved:
            print("Mail Saved")
        case .sent:
            print("Mail Sent")
        }
        dismiss(animated: true, completion: nil)
    }
}




