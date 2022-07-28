//
//  AliasWordsPack.swift
//  Alias
//
//  Created by Дмитрий Х on 28.07.22.
//
typealias Word = String

struct AliasWordsPack {
    let title: String        // Название категории
    let words: [Word]     // Список слов в Категории
}
extension AliasWordsPack {
    static func getAliasWordsCategories() -> [AliasWordsPack] {
        // логика
        let words = [
            
            // тут надо накидать найденные из интернета списки слов
            // 4 категории
            // по 30, 40 или 60 слов, еще не определились...
            
            AliasWordsPack(title: "Животные",
                           words: [
                            "Осел",
                            "Жираф",
                            "Бегемот"
                           ]),
            AliasWordsPack(title: "Инструменты",
                           words: [
                            "Ножницы",
                            "Молоток",
                            "Плоскогубцы"
                           ])
        ]
        
        return words
    }
}
