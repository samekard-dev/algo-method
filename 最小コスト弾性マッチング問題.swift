/* 問題(意味が同じになるように私が作成したもの)
1列に並んだn人のグループAと
1列に並んだm人のグループBが向き合っている。
全員を相手のグループの誰かとひもでつなぐ。
つなぐのはコストがかかる。コストは組み合わせによって違った値である。
ひとりが複数とつながれてもOK。
ひもは交差してはいけない。
A2-B3 A3-B2はだめ
A2-B2 A2-B3はOK
コストを最小にするには？
*/

func readIntArray() -> [Int] {
	readLine()!.split(separator: " ").map { Int(String($0))! }
}

let nm = readIntArray()
let n = nm[0]
let m = nm[1]

var costs: [[Int]] = []
for _ in 0..<n {
	costs.append(readIntArray())
}

var totalCosts = costs

for j in 1..<m {
	totalCosts[0][j] += totalCosts[0][j - 1]
}

for i in 1..<n {
	totalCosts[i][0] += totalCosts[i - 1][0]
}

for i in 1..<n {
	for j in 1..<m {
		totalCosts[i][j] += min(
			totalCosts[i - 1][j - 1],
			totalCosts[i][j - 1],
			totalCosts[i - 1][j]
		)
	}
}

print(totalCosts[n - 1][m - 1])
