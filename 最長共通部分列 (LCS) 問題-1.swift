/* 

問題（元の問題と同一ではないがほぼ同じ）

文字列SとTが与えられる。
SとTの最長共通部分列の長さは？
最長共通部分列はとびとびでもよい。


解説

- 「文字列Aの文字a」と「文字列Bの文字b」の組み合わせを総当り
- 「Aの文字数+1」x「Bの文字数+1」のDPテーブルを作成
- DPのデータの意味は「ここまで調べました ペアはx個でした」
- カウント時（ペアを作る）は2つ同時なので斜め下移動で+1
- ある文字は2つの相手とペアを組んではいけないので、DPの縦移動は0、横移動は0となる

*/

let s = Array(readLine()!)
let t = Array(readLine()!)

let sCount = s.count
let tCount = t.count

var dp = [[Int]](repeating: [Int](repeating: 0, count: tCount + 1), count: sCount + 1)
//ただしSwiftの2次元配列は読み書きが遅い

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
