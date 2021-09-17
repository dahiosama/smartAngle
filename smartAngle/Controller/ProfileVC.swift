//
//  ProfileVC.swift
//  smartAngle
//
//  Created by osama abu dahi on 17/09/2021.
//

import UIKit
import Kingfisher

class ProfileVC: UIViewController {

    var profile:ProviderObject?

    @IBOutlet weak var hederView: UIView!
    @IBOutlet weak var deilesView: UIView!
    @IBOutlet weak var requsetBoutton: UIButton!
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userJob: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var StutesView: UIView!

    @IBOutlet weak var userRateView: CosmosView!
    @IBOutlet weak var userRate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stupeView()
        fetchData()
    
    }
   
    
    func stupeView() {
        self.reviewTable.register(UINib(nibName: "ReviewViewCell", bundle: nil), forCellReuseIdentifier: "ReviewViewCell")
        self.hederView.round(with: .bottom,radius: 35.0)
        self.deilesView.round(with: .both)
        self.requsetBoutton.layer.cornerRadius = 20
        self.StutesView.layer.cornerRadius = 5
    }
    func fetchData(){
        
        NetworkClient.Request(self, ProviderObject.self, router: APIRouter.getProfile, true) { (data, error) in
            if data != nil {
                self.profile = data
                self.stupeData()
                self.reviewTable.reloadData()
                self.reloadInputViews()
            }
        }
    }
    func stupeData()  {
        self.userName.text = self.profile?.provider?.name ?? ""
        self.userJob.text = self.profile?.provider?.userType ?? "Clener"
        self.userLocation.text =  "Gaza" // null in API
        
        self.userRate.text = self.profile?.provider?.rate ?? "0.0"
        
        self.userRateView.rating  = Double(self.profile?.provider?.rate ?? "0.0") ?? 0.0
    }
    


}


extension ProfileVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profile?.reviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewViewCell") as! ReviewViewCell
        cell.selectionStyle = .none
        
        
        let reviews = self.profile?.reviews?[indexPath.row]
        
        cell.userName.text = reviews?.user?.name
        cell.userImage.kf.setImage(with: URL(string: Constant.ProductionServer.baseURL + (reviews?.user?.image!)! ))

        // have error form API bio not found in user in reviews object That for test just
        cell.descrption.text = self.profile?.provider?.bio ?? ""
        cell.date.text = self.profile?.provider?.birthday ?? ""
        cell.userRate.rating = Double(reviews?.rate ?? "0.0") ?? 0.0

        
        return cell

    }
    
    
    
}

