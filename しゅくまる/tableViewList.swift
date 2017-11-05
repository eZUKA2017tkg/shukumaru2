//
//  FirstViewController.swift
//  しゅくまる
//
//  Created by miyu.s on 2017/09/02.
//  Copyright © 2017年 miyu.s. All rights reserved.
//

import UIKit

class tableViewList: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var imgArray = Array<String>()
    var label2Array = Array<String>()
    var buttonArray = Array<Int>()
    var img2Array = Array<Int>()
    
    @IBOutlet weak var TodayDate: UILabel!
    
    @IBOutlet weak var shukudaisuu2: UILabel!
    
    @IBOutlet weak var shukudaisuu: UILabel!
    
    @IBOutlet weak var finish: UILabel!
    
    @IBOutlet weak var finish2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgArray = [String](repeating: "", count: label2Array.count)

        
        for n in 0..<label2Array.count {
            
            switch label2Array[n]{
                
            case "かんじドリル":
                imgArray[n] = "かんじドリルai"
                break
            case "けいさんドリル":
                imgArray[n] = "けいさんドリルai"
                break
            case "さくぶん":
                imgArray[n] = "さくぶんai"
                break
            case "おんどく":
                imgArray[n] = "おんどくai"
                break
            case "こくご":
                imgArray[n] = "こくごai"
                break
            case "さんすう":
                imgArray[n] = "さんすうai"
                break
            case "しゃかい":
                imgArray[n] = "しゃかいai"
                break
            case "りか":
                imgArray[n] = "りかai"
                break
            case "がいこくご":
            imgArray[n] = "そのたai"
                break
            default:
                break
            }
        }
        
        buttonArray = [Int](repeating: 0, count: label2Array.count)
        img2Array = [Int](repeating: 0, count: label2Array.count)
        
        var shukudaiCount:Int = 0//宿題数を計算する値
        var finishCount:Int = 0 //終わった数を計算する値
            
            shukudaiCount = label2Array.count
            
            for num in 0 ..< label2Array.count {
                finishCount += buttonArray[num]
            }
            shukudaisuu.text = String(shukudaiCount)
            shukudaisuu2.text = String(shukudaiCount)
            
            finish.text = String(finishCount)


    }
    
    
    //TableViewセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label2Array.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //tableCellのIDでUITableViewCellのインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        //Tag番号1でUIImageViewインスタンスの生成
        let imageView1 = cell.viewWithTag(1) as! UIImageView
        imageView1.image = UIImage(named: imgArray[indexPath.row])
        
        //Tag番号2でUILabelインスタンスの生成
        let label1 = cell.viewWithTag(2) as! UILabel
        label1.text = String(describing: label2Array[indexPath.row])
        
        //Tag番号3でUIButtonインスタンスの生成
        let button1 = cell.viewWithTag(3) as! UIButton
        if(buttonArray[indexPath.row] == 0) {
            button1.setTitle("これから!", for: .normal)
            button1.setTitleColor(UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            button1.backgroundColor = UIColor(red: 48/255, green: 148/255, blue: 137/255, alpha: 1.0)
        }else if(buttonArray[indexPath.row] == 1) {
            button1.setTitle("おわった!", for: .normal)
            button1.setTitleColor(UIColor(red: 48/255, green: 148/255, blue: 137/255, alpha: 1.0), for: .normal)
            button1.backgroundColor = UIColor.clear
        }
        
        //Tag番号4でUIImageViewインスタンスの生成
        let imageView2 = cell.viewWithTag(4) as! UIImageView
        if img2Array[indexPath.row] == 0 {
            imageView2.image = UIImage(named: "はなまるoff")
        }else if img2Array[indexPath.row] == 1 {
            imageView2.image = UIImage(named: "はなまる")
        }
        
        
        return cell
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
        
    }
    //画面を自動回転させない
    override var shouldAutorotate: Bool {
        get {
            return false
        }
    }
    
    //画面の向きを指定
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
        return .landscape
        }
    }
    
    

}
