let s = Array(readLine()!)
let t = Array(readLine()!)
let sCount = s.count
let tCount = t.count

//s、tそれぞれの先頭に数字の0を付け足して表を作成するとイメージする。(ただし実際のsとtは変更せず)
var dp = [[Int]](repeating: [Int](repeating: 0, count: tCount + 1), count: sCount + 1)

for i in 0...sCount {
	dp[i][0] = i
}
for j in 0...tCount {
	dp[0][j] = j
}

for i in 1...sCount {
	for j in 1...tCount {
		//補助の行と列を入れたので、(s[i - 1], t[j - 1])までの情報はdp[i][j]に格納される
		let newPair = s[i - 1] == t[j - 1] ? 
						dp[i - 1][j - 1] : dp[i - 1][j - 1] + 1
		dp[i][j] = min(
			newPair,
			dp[i - 1][j] + 1,
			dp[i][j - 1] + 1)
	}
}
print(dp[sCount][tCount])
