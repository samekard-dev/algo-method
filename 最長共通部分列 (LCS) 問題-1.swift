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

//"a"が出てくるのはx,y,z...番目という情報
var sPositions: [Character: [Int]] = [:]
var tPositions: [Character: [Int]] = [:]

for c in "abcdefghijklmnopqrstuvwxyz" {
	sPositions[c] = []
	tPositions[c] = []
}

for (index, c) in sSource.enumerated() {
	sPositions[c]?.append(index)
}

for (index, c) in tSource.enumerated() {
	tPositions[c]?.append(index)
}

var sameMap = [[Int]](repeating: [], count: sCount)
var counter = [[Int]](repeating: [Int](repeating: 0, count: tCount), count: sCount)

for c in "abcdefghijklmnopqrstuvwxyz" {
	if let sPos = sPositions[c], let tPos = tPositions[c] {
		for s in sPos {
			for t in tPos {
				sameMap[s].append(t)
			}
		}
	}
}

for s in 0..<sCount {
	for t in sameMap[s] {
		counter[s][t] = 1
		var noSearchL = -1
		for ss in (0..<s).reversed() {
			for tt in sameMap[ss].reversed() {
				if tt >= t {
					continue
				}
				if tt <= noSearchL {
					break
				}
				if counter[ss][tt] >= 1 {
					counter[s][t] = max(counter[s][t], counter[ss][tt] + 1)
					noSearchL = tt
					break
					//(ss, tt)より左上(ss, ttのラインを含む)内で最高値であるので左は見ない
				}
			}
		} 
	}
}

print(counter.joined().max()!)
