import Foundation

typealias BitCoin = [String: BitCoinValue]

struct BitCoinValue : Decodable{
    let the15M, last, buy, sell: Double?
    let symbol: String?
}
