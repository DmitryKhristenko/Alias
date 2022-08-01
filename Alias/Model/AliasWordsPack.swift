//
//  AliasWordsPack.swift
//  Alias
//
//  Created by Дмитрий Х on 28.07.22.
//

typealias Word = String

struct AliasWordsPack: Decodable {
    let title: String
    let words: [Word]
}
