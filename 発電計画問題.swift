/* 問題（元の問題と設定が同じで別文章）
ある時間をt個の区間に分ける。
0, 1, 2 ... t - 1
のt個の区間がある。

ある区間からある区間まで発電したときの報酬の情報が与えられる。
これを配列gainに格納する。
gain[0][0], gain[0][1] ... gain[t - 1][t - 1]
例 gain[2][5] 区間2から区間5まで発電したときの報酬

報酬が最大になるように計画を立てるとその報酬はいくらか。
*/

func readInt() -> Int {
	Int(readLine()!)!
}

func readIntArray() -> [Int] {
	readLine()!.split(separator: " ").map { Int(String($0))! }
}

let t = readInt()
var gain: [[Int]] = []
for _ in 0..<t {
	gain.append(readIntArray())
}
//gain[start][end]という見方をする

//dpは各段階で発電onと発電offの最大値を記録する
//2つ目のindexは0がoffで1がon
//0の方は発電しない場合の最大値
//1の方はそこで発電が終わる場合の最大値
//そこで発電が途中の場合の情報は、発電が終わったところで見る
var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 2), count: t)

dp[0][0] = 0
dp[0][1] = gain[0][0]
for i in 1..<t {
	dp[i][0] = max(dp[i - 1][0], dp[i - 1][1])
	dp[i][1] = gain[0][i]
	for j in 1...i {
		dp[i][1] = max(dp[i][1], dp[j - 1][0] + gain[j][i])
	}
}
print(max(dp[t - 1][0], dp[t - 1][1]))
