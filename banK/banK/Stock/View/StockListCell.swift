//
//  StockListCell.swift
//  banK
//
//  Created by João Gabriel Lavareda Ayres Barreto on 03/10/23.
//

import Foundation
import UIKit
import Charts

class StockListCell: UITableViewCell {
    static let reuseID = "StockTableViewCell"
    static let rowHeight: CGFloat = 100
    
    
    func configure(with stock: StockModel) {
        
    }
   
    
    lazy var stockCodeNameLabel: UILabel = {
        let code = UILabel()
        code.translatesAutoresizingMaskIntoConstraints = false
        code.text = "ITSA4"
        code.font = UIFont.preferredFont(forTextStyle: .body)
        code.textColor = .black
        return code
    }()
    
    lazy var stockCompanyNameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Itaúsa Holding"
        name.textColor = .systemGray
        return name
    }()
    
    lazy var squareView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var marketChart: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .white
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.rightAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.xAxis.enabled = false
        chartView.legend.enabled = false
        return chartView
    }()
    
    lazy var valueLabel: UILabel = {
        let value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "12,40"
        value.font = UIFont.preferredFont(forTextStyle: .body)
        value.textColor = .black
        return value
    }()
    
    lazy var variationLabel: UILabel = {
        let variation = UILabel()
        variation.translatesAutoresizingMaskIntoConstraints = false
        variation.text = "-0,32"
        return variation
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        buildHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.contentView.addSubview(stockCodeNameLabel)
        self.contentView.addSubview(stockCompanyNameLabel)
        self.contentView.addSubview(marketChart)
        self.contentView.addSubview(valueLabel)
        squareView.addSubview(variationLabel)
        self.contentView.addSubview(squareView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stockCodeNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            stockCodeNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            
            stockCompanyNameLabel.topAnchor.constraint(equalTo: stockCodeNameLabel.bottomAnchor, constant: 16),
            stockCompanyNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            
            marketChart.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            marketChart.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 200),
            marketChart.widthAnchor.constraint(equalToConstant: 100),
            marketChart.heightAnchor.constraint(equalToConstant: 80),
            
            valueLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            valueLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            squareView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 16),
            squareView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            squareView.widthAnchor.constraint(equalToConstant: 60),
            squareView.heightAnchor.constraint(equalToConstant: 30),
            
            variationLabel.centerYAnchor.constraint(equalTo: squareView.centerYAnchor),
            variationLabel.centerXAnchor.constraint(equalTo: squareView.centerXAnchor),
        ])
    }
}

extension StockListCell: ChartViewDelegate {
    
    func setData(yValues : [ChartDataEntry], title : String){
        let lineChartDS = LineChartDataSet(entries: yValues, label: title)
        
        lineChartDS.mode = .horizontalBezier
        lineChartDS.drawCirclesEnabled = false
        
        lineChartDS.lineWidth = 1
        lineChartDS.setColor(.black)
        
        let colors = [UIColor.white.cgColor, appColor.cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: colors as CFArray, locations: nil)!
        let fill = LinearGradientFill(gradient: gradient, angle: 70.0)
        lineChartDS.fill = fill
        lineChartDS.fillAlpha = 0.2
        lineChartDS.drawFilledEnabled = true
        
        lineChartDS.drawHorizontalHighlightIndicatorEnabled = false
        lineChartDS.drawVerticalHighlightIndicatorEnabled = false
        
        let data = LineChartData(dataSet: lineChartDS)
        
        //show chart values(x,y) in line
        data.setDrawValues(false)
        marketChart.data = data
    }
}

