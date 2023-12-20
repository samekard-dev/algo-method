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
