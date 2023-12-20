let sSource = readLine()!
let tSource = readLine()!

let sCount = sSource.count
let tCount = tSource.count

let s = sSource.compactMap({ $0 })
let t = tSource.compactMap({ $0 })

var dp = [[Int]](repeating: [Int](repeating: 0, count: tCount + 1), count: sCount + 1)

//dpの0行目と0列目は0が入っている
for i in 1...sCount {
	for j in 1...tCount {
		if s[i - 1] == t[j - 1] {
			//i - 1とj - 1のペアまで（本人達を含む）の情報がdp[i][j]
			dp[i][j] = dp[i - 1][j - 1] + 1
		}
		dp[i][j] = max(dp[i][j], dp[i - 1][j])
		dp[i][j] = max(dp[i][j], dp[i][j - 1])
	}
}

print(dp[sCount][tCount])
