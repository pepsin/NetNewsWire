//
//  TextStemsExtract.swift
//  smartfeed
//
//  Created by Pepsin Ye on 2024/7/23.
//

import NaturalLanguage
extension String {
    func getNouns() -> [String] {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = self

        var stems = [[String]]()
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
        let wholeText = self.startIndex..<self.endIndex
        let language = NLLanguageRecognizer.dominantLanguage(for: self) ?? .english
        tagger.setLanguage(language, range: wholeText)
        tagger.enumerateTags(in: self.startIndex..<self.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
            let word = String(self[tokenRange])
            if word.count > 1 {
                stems.append([word, tag?.rawValue ?? ""])
            }
            return true
        }
        var result = [String]()
        for tuple in stems {
            let type = tuple[1]
            let noun = tuple[0]
            if type == NLTag.noun.rawValue || type == NLTag.otherWord.rawValue {
                result.append(noun)
            }
        }

        return result
    }
}
