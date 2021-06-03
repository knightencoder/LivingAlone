//
//  CleaningDetails.swift
//  Living Alone
//
//  Created by Anderson Sprenger on 28/05/21.
//

import SwiftUI

struct CleaningDetails: View {
    @Environment (\.presentationMode) private var presentationMode
    
    var tip: CleaningTipModel
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 0){
                ZStack {
                    Text(tip.title)
                        .font(.system(size: 17, weight: .bold))
                    
                    HStack {
                        Spacer()
                        
                        Text("OK")
                            .font(.system(size: 17))
                            .padding(.trailing)
                            .foregroundColor(Color("CleaningColor"))
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
                .padding()
                
                Image(tip.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 252)

                VStack(alignment: .leading) {
                    if tip.extendedTitle != nil {
                        HStack {
                            Text(tip.extendedTitle!)
                                .font(.system(size: 34, weight: .bold))
                                .foregroundColor(Color("CleaningColor"))
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                    }
                    
                    if tip.description != nil {
                        Text(tip.description!)
                            .padding(.bottom)
                    }
                    
                    HStack {
                        Text("Passo a Passo")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color("CleaningColor"))
                        
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    
                    VStack (alignment: .leading, spacing: 10) {
                        if tip.instructionsHeader != nil {
                            Text(tip.instructionsHeader!)
                        }
                        
                        ForEach(tip.instructions, id: \.self){ tip in
                            Text(tip)
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct CleaningDetails_Previews: PreviewProvider {
    static var previews: some View {
        CleaningDetails(tip: CleaningViewModel().cleaningTipsList[0])
    }
}
