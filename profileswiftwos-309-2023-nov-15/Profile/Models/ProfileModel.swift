//
//  ProfileModel.swift
//  Profile
//
import Foundation

public struct ProfileModel
{
    let avatar: String?// Аватар
    let firstName: String // Имя
    let secondName: String // Фамилия
    let middleName: String // Отчество
    let alias: String // Никнейм
    let mail: String // Имейл
    let phone: String // Телефон
    let telegram: String // Телеграм

    public init(
        avatar: String? = nil,
        firstName: String = "",
        secondName: String = "",
        middleName: String = "",
        alias: String = "",
        mail: String = "",
        phone: String = "",
        telegram: String = ""
    ) {
        self.avatar = avatar
        self.firstName = firstName
        self.secondName = secondName
        self.middleName = middleName
        self.alias = alias
        self.mail = mail
        self.phone = phone
        self.telegram = telegram
    }
}
