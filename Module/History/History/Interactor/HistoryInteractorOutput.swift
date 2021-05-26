//
//  HistoryInteractorOutput.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import Core

protocol HistoryInteractorOutput {
    func loadedHistoryThisWeek(historiesThisWeek: [TransactionEntity])
    func loadedHistoryThisMonth(historiesThisMonth: [TransactionEntity])

}
