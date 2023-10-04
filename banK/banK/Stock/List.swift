//
//  List.swift
//  banK
//
//  Created by João Gabriel Lavareda Ayres Barreto on 03/10/23.
//

import Foundation
import UIKit
import Charts

class List: UIView, UITableViewDelegate{
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 10.0),
        ChartDataEntry(x: 1.0, y: 5.0),
        ChartDataEntry(x: 2.0, y: 7.0),
        ChartDataEntry(x: 3.0, y: 5.0),
        ChartDataEntry(x: 4.0, y: 10.0),
        ChartDataEntry(x: 5.0, y: 6.0),
        ChartDataEntry(x: 6.0, y: 5.0),
        ChartDataEntry(x: 7.0, y: 7.0),
        ChartDataEntry(x: 8.0, y: 8.0),
        ChartDataEntry(x: 9.0, y: 12.0),
        ChartDataEntry(x: 10.0, y: 13.0),
        ChartDataEntry(x: 11.0, y: 5.0),
        ChartDataEntry(x: 12.0, y: 7.0),
        ChartDataEntry(x: 13.0, y: 3.0),
        ChartDataEntry(x: 14.0, y: 15.0),
        ChartDataEntry(x: 15.0, y: 6.0),
        ChartDataEntry(x: 16.0, y: 17.0),
        ChartDataEntry(x: 17.0, y: 16.0),
        ChartDataEntry(x: 18.0, y: 22.0),
        ChartDataEntry(x: 19.0, y: 20.0),
        ChartDataEntry(x: 20.0, y: 27.0),
        ChartDataEntry(x: 21.0, y: 23.0),
        ChartDataEntry(x: 22.0, y: 30.0),
        ChartDataEntry(x: 23.0, y: 50.0),
        ChartDataEntry(x: 24.0, y: 47.0),
        ChartDataEntry(x: 25.0, y: 55.0),
        ChartDataEntry(x: 26.0, y: 60.0),
        ChartDataEntry(x: 27.0, y: 39.0),
        ChartDataEntry(x: 28.0, y: 55.0),
        ChartDataEntry(x: 29.0, y: 70.0),
        ChartDataEntry(x: 30.0, y: 75.0),
        ChartDataEntry(x: 31.0, y: 58.0),
        ChartDataEntry(x: 32.0, y: 68.0),
        ChartDataEntry(x: 33.0, y: 77.0),
        ChartDataEntry(x: 34.0, y: 80.0),
        ChartDataEntry(x: 35.0, y: 69.0),
        ChartDataEntry(x: 36.0, y: 80.0),
        ChartDataEntry(x: 37.0, y: 90.0),
        ChartDataEntry(x: 38.0, y: 119.0),
        ChartDataEntry(x: 39.0, y: 110.0),
        ChartDataEntry(x: 40.0, y: 122.0)]
    

    let stockList = [
        StockModel(name: "BVSP", company: "IBOVESPA", value: "113,419", variation: "-1,63", url: "https://finance.yahoo.com/quote/%5EBVSP?.tsrc=applewf"),
        StockModel(name: "Dow Jones", company: "Down Jones Industrial Average", value: "32.002,38", variation: "-430,92", url: "https://finance.yahoo.com/quote/%5EDJI?.tsrc=applewf"),
        StockModel(name: "BA", company: "The Boeing Company", value: "188,92", variation: "+0,12", url: "https://finance.yahoo.com/quote/BA/key-statistics?.tsrc=applewf"),
        StockModel(name: "AAPL", company: "Apple Inc,", value: "173,77", variation: "+1,32", url: "https://finance.yahoo.com/quote/AAPL/key-statistics?.tsrc=applewf")
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StockHeaderView.self, forHeaderFooterViewReuseIdentifier: "MyHeader")
        tableView.register(StockListCell.self, forCellReuseIdentifier: StockListCell.reuseID)
        tableView.rowHeight = StockListCell.rowHeight
        tableView.backgroundColor = appColor
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension List {
    func style() {
        addSubview(tableView)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension List: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StockListCell.reuseID, for: indexPath) as! StockListCell
        cell.stockCodeNameLabel.text = stockList[indexPath.row].name
        cell.stockCompanyNameLabel.text = stockList[indexPath.row].company
        cell.valueLabel.text = stockList[indexPath.row].value
        cell.variationLabel.text = stockList[indexPath.row].variation
        cell.setData(yValues: yValues, title: "Stocks")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStock = stockList[indexPath.row]
        let urlString = selectedStock.url
        
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                // Handle the case where the URL cannot be opened
                // You can display an alert or perform any other action
                print("Cannot open URL: \(urlString)")
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyHeader") as? StockHeaderView else {
            return nil
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
}
