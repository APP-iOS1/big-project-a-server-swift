//
//  UserAuthentication.swift
//  BigprojectAServer
//
//  Created by 이승준 on 2022/12/31.
//

import FirebaseAuth

// MARK: - User Authentication
/// 유저 로그인, 로그아웃, 회원가입, 아이디 중복 여부 확인 등의 기능을 제공하는 클래스 입니다.
final class UserAuthenticationManager {
	public let firebaseAuthenticationInstance = Auth.auth()
	
	public func requestUserLogin(withEmail email: String, withPassword password: String) async -> Void {
		do {
			try await firebaseAuthenticationInstance.signIn(withEmail: email, password: password)
			// 로그인 후, 유저 정보를 firestore에서 fetch 해와야 한다.
			// 로그인 실패와 성공에 대한 Bool 타입을 리턴시키고, 그 리턴 값을 기준으로 분기처리?
		} catch {
			dump("DEBUG : LOGIN FAILED \(error.localizedDescription)")
		}
	}
	
	public func requestUserSignOut() {
		do {
			try firebaseAuthenticationInstance.signOut()
		} catch {
			dump("DEBUG : LOG OUT FAILED \(error.localizedDescription)")
		}
	}
	
	public func createNewUser() async -> Void {
		
	}
}
