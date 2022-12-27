//
//  AliasDataManager.swift
//  Alias
//
//  Created by ALEKSEY SUSLOV on 30.07.2022.
//

import Foundation

struct AliasJSONModel: Decodable {
    let aliasWordPacks: [AliasWordsPack]
}

struct AliasDataManager {
    static let shared = AliasDataManager()
    private let sampleWordsPack = [AliasWordsPack(
        title: "Животные",
        words: [
            "Осел", "Жираф", "Бегемот",
            "Барсук", "Броненосец",
            "Альпака", "Панда", "Вомбат",
            "Фенек", "Морская свинка",
            "Сурикат", "Ленивец", "Лемур",
            "Коала", "Выдра", "Кошка",
            "Капибара", "Гепард",
            "Лев", "Скорпион", "Попугай",
            "Мышь", "Суслик", "Коза",
            "Крот", "Воробей", "Орёл",
            "Жираф", "Шимпанзе", "Жучок"
        ]
    )]
    func getAliasWordsCategories() -> [AliasWordsPack] {
        return fetchData() ?? sampleWordsPack
    }
    private func fetchData() -> [AliasWordsPack]? {
        guard let sourcesURL = Bundle.main.url(forResource: "AliasWordCategories", withExtension: "json") else { return nil }
        guard let aliasData = try? Data(contentsOf: sourcesURL) else { return nil }
        guard let aliasWordPacksFromJSON = try? JSONDecoder().decode(AliasJSONModel.self, from: aliasData) else { return nil }
        let aliasWordPacks = aliasWordPacksFromJSON.aliasWordPacks
        return aliasWordPacks
    }
    private init() {}
}
