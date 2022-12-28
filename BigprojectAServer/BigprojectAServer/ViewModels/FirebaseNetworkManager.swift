//
//  FirebaseNetworkManager.swift
//  BigprojectAServer
//
//  Created by 이승준 on 2022/12/28.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

final class FirebaseNetworkManager: ObservableObject {
	@Published var viewData = ""
	
	let superCollectionName: String
	let firebasePath = Firestore.firestore()
	
	init(superCollectionName: CollectionType) {
		self.superCollectionName = superCollectionName.rawValue
	}
	// MARK: FetchData
	/// Firestore에 Map 으로 저장된 데이터를 가져옵니다.
	/// Firestore의 Map 타입 데이터는 딕셔너리 키-밸류 타입으로 캐스팅 한 후, 다시 키를 참조하여 값을 가져올 수 있습니다.
	@MainActor
	public func requestMapData(_ collectionType: CollectionType) async -> Void {
		let superCollectionPath = firebasePath.collection(superCollectionName)
		
		switch collectionType {
		case .admin:
			await requestAdminCollection(with: superCollectionPath)
		case .customer:
			await requestCustomerCollection(with: superCollectionPath)
		case .seller:
			await requestSellerCollection(with: superCollectionPath)
		case .cs:
			await requestCustomerServiceCollection(with: superCollectionPath)
		}
	}
	
	private func requestAdminCollection(with path: CollectionReference) async -> Void {
		do {
			let snapshot = try await path.getDocuments()
			
			for document in snapshot.documents {
				let requestedData = document.data()
				print(requestedData)
				
				let id: String = requestedData["id"] as? String ?? "FALIED"
				let lastLoginDate = requestedData["lastLoginDate"] as? Timestamp ?? Timestamp(date: Date.now)
				let createdDate = requestedData["createdDate"] as? Timestamp ?? Timestamp(date: Date.now)
				
				dump("\(id), \(lastLoginDate), \(createdDate)")
			}
		} catch {
			dump("ERROR REQUEST FALIED : \(error.localizedDescription)")
		}
		
	}
	
	private func requestCustomerCollection(with path: CollectionReference) async -> Void {
		do {
			let snapshot = try await path.getDocuments()
			
			for document in snapshot.documents {
				let requestedData = document.data()
				
				
			}
		} catch {
			dump("ERROR REQUEST FALIED : \(error.localizedDescription)")
		}
	}
	
	private func requestSellerCollection(with path: CollectionReference) async -> Void {
		do {
			let snapshot = try await path.getDocuments()
			
			for document in snapshot.documents {
				let requestedData = document.data()
				
				for document in snapshot.documents {
					let requestedData = document.data()
					
					let id: String = requestedData["id"] as? String ?? ""
					let sellerName: String = requestedData["sellerName"] as? String ?? ""
					let sellerEmail: String = requestedData["sellerEmail"] as? String ?? ""
					let phoneNumber: String = requestedData["phoneNumber"] as? String ?? ""
					
					dump("\(id), \(sellerName), \(sellerEmail), \(phoneNumber)")
				}
			}
		} catch {
			dump("ERROR REQUEST FALIED : \(error.localizedDescription)")
		}
	}
	
	private func requestCustomerServiceCollection(with path: CollectionReference) async -> Void {
		do {
			let snapshot = try await path.getDocuments()
			
			for document in snapshot.documents {
				let requestedData = document.data()
				
				
			}
		} catch {
			dump("ERROR REQUEST FALIED : \(error.localizedDescription)")
		}
	}
	
	public func createData(_ collectionType: CollectionType) async -> Void {
		let superCollectionPath = firebasePath.collection(superCollectionName)
		
		switch collectionType {
		case .admin:
			print()
			//			await requestAdminCollection(with: superCollectionPath)
		case .customer:
			print()
			//			await requestCustomerCollection(with: superCollectionPath)
		case .seller:
			print("+++", #function)
			//			await createSellerDocument(with: superCollectionPath)
			await createItemInfo(with: superCollectionPath)
		case .cs:
			print()
			//			await requestCustomerServiceCollection(with: superCollectionPath)
		}
	}
	
	private func createSellerDocument(with path: CollectionReference) async -> Void {
		
		// Seller 정보만 만드는 메소드
		path.addDocument(data: [
			"id": "AUTH 에서 생성된 uid",
			"sellersStoreId": "Store를 생성하는 시점에 field 업데이트해서 uid 채우기",
			"sellerName": "멋사",
			"sellerEmail": "test@email.com",
			"phoneNumber": "010-1111-2222",
			"isBanned": false,
			"sellerProfileImage" : "image"
		])
	}
	
	private func createItemInfo(with path: CollectionReference) async -> Void {
		print("", #function)
		let itemPath = path
			.document("I0sM8nn7ZFUs1ZFwDemE")
			.collection("StoreInfo")
			.document("randomStore")
			.collection("Iteminfo")
			.addDocument(data: [
				"id" : "ItemId",
				"storeId" : "randomStore",
				"itemName" : "monitor",
				"itemCategory" : "monitor",
				"itemAmount" : "2",
				"itemAllOption" : [
					"color" : ["red_1000", "blue_3000"],
					"size" : "32\"",
				],
				"itemImage": "image",
				"price": "100000"
			])
	}
	
}
