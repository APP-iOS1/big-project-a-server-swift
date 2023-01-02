//
//  UserInfo.swift
//  BigprojectAServer
//
//  Created by 이승준 on 2023/01/02.
//

import Foundation

struct CustomerInfo {
	var id: String = UUID().uuidString
	var userEmail: String
	var userNickname: String
	var userName: String?
	var userAddress: String?
	var phoneNumber: String?
	var birthDate: Date?
	var userProfileImage: String?
}
