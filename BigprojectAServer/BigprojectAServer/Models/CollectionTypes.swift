//
//  CollectionTypes.swift
//  BigprojectAServer
//
//  Created by 이승준 on 2022/12/28.
//

import Foundation

enum CollectionType: String {
	case admin = "AdminInfo",
		 customer = "CustomerInfo",
		 seller = "SellerInfo",
		 cs = "CustomerServiceInfo"
}

enum SellerSubcollectionType: String {
	case itemInfo = "ItemInfo"
	case storeInfo = "StoreInfo"
	case allUserReviews = "AllUserReviews"
	case orderInfo = "OrderInfo"
}
