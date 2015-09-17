//
//  Phrase.swift
//  SGTalk
//
//  Created by Hau Tu on 9/4/15.
//  Copyright (c) 2015 Suga. All rights reserved.
//

import Foundation

class Phrase {
    private var mKeys = [String]()
    private var mKeysToValue = [String: AnyObject]()
    
    private var mLocalizeString = ""
    
    var description : String {
        get {
            return mLocalizeString
        }
    }
    
    init(localizeKey: String) {
        mLocalizeString = NSLocalizedString(localizeKey, comment: "")
        mKeys = matchesForRegexInText("\\{(.+?)\\}", text: mLocalizeString)
    }
    
    static func from(localizeKey: String) -> Phrase {
        return Phrase(localizeKey: localizeKey)
    }
    
    func put(key: String, value: AnyObject) -> Phrase {
        mKeysToValue["{\(key)}"] = value
        return self
    }
    
    func fomat() -> Phrase {
        for key in mKeys {
            let value: AnyObject? = mKeysToValue[key]
            if( value == nil){
                println("not exist key \(key)")
                continue
            }
            mLocalizeString = mLocalizeString.stringByReplacingOccurrencesOfString(key, withString: value!.description, options: NSStringCompareOptions.allZeros, range: nil)
        }
        return self
    }
    
    private func matchesForRegexInText(regex: String!, text: String!) -> [String] {
        let regex = NSRegularExpression(pattern: regex,
            options: nil, error: nil)!
        let nsString = text as NSString
        let results = regex.matchesInString(text,
            options: nil, range: NSMakeRange(0, nsString.length))
            as! [NSTextCheckingResult]
        return map(results) { nsString.substringWithRange($0.range)}
    }
}