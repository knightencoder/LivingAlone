//
//  CategoriePicker.swift
//  LivingAlone
//
//  Created by Heitor Feijó Kunrath on 25/05/21.
//

import SwiftUI

struct CategoriePicker: View {
    
    @State var currentBigTopic : BigTopicsModel
    @State var currentSubCategory : SubCategorie
    @State var pickerSelection = 0
    
    
    var body: some View {
        
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
            Picker(selection: $pickerSelection, label: Text("")) {
                
                ForEach(0..<currentBigTopic.subCategories.count){
                    
                    Text(currentBigTopic.subCategories[$0].name).tag($0)
                    
                    
             }
            
            }.pickerStyle(SegmentedPickerStyle()).padding(.top).padding(.bottom)
           }.padding()
            
            
            ScrollView{
                VStack{
                    ForEach(currentBigTopic.subCategories[pickerSelection].items, id:\.id){ item in
                        
                        Text(item.name)
                        
                        
                    }
                }
                
            }
            
            
        }
    }
    
}

    struct CategoriePicker_Previews: PreviewProvider {
        static var previews: some View {
            CategoriePicker(currentBigTopic: BigTopicsModel.bigTopicsArray[0], currentSubCategory:BigTopicsModel.bigTopicsArray[0].subCategories[0]  )
        }
    }

