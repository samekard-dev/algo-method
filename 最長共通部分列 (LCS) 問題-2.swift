/* 

問題

文字列SとTが与えられる。
SとTの最長共通部分列の長さは？
最長共通部分列はとびとびでもよい。


解説

- 文字列Aの文字aと文字列Bの文字bの組み合わせを総当り
- Aの文字数xBの文字数のDPテーブルを作成
- DPのデータの意味は「ここまで調べましたペアはx個でした」
- カウント時（ペアを作る）は2つ同時なので斜め下移動が+1
- ある文字は2つとペアになってはいけないので、DPの縦移動は0、横移動は0となる

*/

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
