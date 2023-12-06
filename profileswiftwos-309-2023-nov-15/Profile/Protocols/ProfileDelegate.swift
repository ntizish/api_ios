//
//  ProfileDelegate.swift
//  Profile
//
import Foundation

protocol ProfileDelegate: NSObjectProtocol {
    func editProfile(vc: ProfileViewController, someData: String)
}
