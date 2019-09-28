//
//  FeedWranglerConfig.swift
//  NetNewsWire
//
//  Created by Jonathan Bennett on 9/27/19.
//  Copyright © 2019 Ranchero Software, LLC. All rights reserved.
//

import Foundation

enum FeedWranglerConfig {
	static let clientKey = "{FEEDWRANGLERKEY}"
	static let clientPath = "https://feedwrangler.net/api/v2/"
	static let clientURL = {
		URL(string: FeedWranglerConfig.clientPath)!
	}()
}
