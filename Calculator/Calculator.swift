//
//  Calculator.swift
//  Calculator
//
//  Created by 马红奇 on 2019/6/6.
//  Copyright © 2019 NSHotchner. All rights reserved.
//

import SwiftUI

struct Calculator: View {
  let data = [["+", "-", "÷", "×"],
              ["π", "7", "8", "9"],
              ["√", "4", "5", "6"],
              ["cos", "1", "2", "3"],
              ["±", ".", "0", "="]]
  
  var body: some View {
    let margin: CGFloat = 10
    return VStack(alignment: .center) {
      HStack {
        Spacer()
        
        Text("0")
          .color(Color(red: 231 / 255.0, green: 76 / 255.0, blue: 60 / 255.0))
          .bold()
          .frame(height: 50)
        }
        .padding(margin)
      
      VStack(alignment: .center, spacing: margin) {
        ForEach(data.identified(by: \.description)) { items in
          HStack(alignment: .center, spacing: margin) {
            ForEach(items.identified(by: \.description)) { item in
              Text(item)
                .font(.title)
                .bold()
                .color(Color.blue)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color(red: 234 / 255.0, green: 240 / 255.0, blue: 241 / 255.0))
                .tapAction {
                  self.touchAction(item)
              }
            }
          }
        }
        }
        .padding(EdgeInsets(top: 0, leading: margin, bottom: 0, trailing: margin))
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
  }
  
  private func touchAction(_ symbol: String) {
    if let digit = Int(symbol) {
      touchDigit(digit)
    } else {
      performOperation(symbol)
    }
  }
  
  private func touchDigit(_ digit: Int) {
    print(#function)
    print(digit)
  }
  
  private func performOperation(_ symbol: String) {
    print(#function)
    print(symbol)
  }
}

#if DEBUG
struct Calculator_Previews : PreviewProvider {
  static var previews: some View {
    Calculator()
  }
}
#endif
