/*

問題
2 つの文字列 S,T が与えられます。 S に削除、変更、追加の操作のいずれかを順次実施して T に変換します。 最小の操作回数を求めてください。 
操作は1文字ずつ行うこと。

解説
Sの文字数xTの文字数のDPテーブルを作る
各データの意味は「ここまで調べました。最小操作回数はx回です」

基本的には
横移動 +1
縦移動 +1
斜め移動 同じなら0 違うなら+1

しかし1文字目の処理(Sの1とTの1、Sの1とTの3、Sの3とTの1など)がややこしいので
SとTの前に数字の0を付けて考えることにする

*/

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
