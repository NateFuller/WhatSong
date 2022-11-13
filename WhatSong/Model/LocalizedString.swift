//
//  LocalizedString.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/30/22.
//

import Foundation

func LocalizedString(_ key: String) -> String {
    return Bundle.main.localizedString(forKey: key, value: key, table: nil)
}
