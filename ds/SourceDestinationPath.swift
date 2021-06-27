/*
Given the edges of a directed graph where edges[i] = [ai, bi] indicates there is an edge between nodes ai and bi, and two nodes source and destination of this graph, determine whether or not all paths starting from source eventually, end at destination, that is:

At least one path exists from the source node to the destination node
If a path exists from the source node to a node with no outgoing edges, then that node is equal to destination.
The number of possible paths from source to destination is a finite number.
Return true if and only if all roads from source lead to destination.

 5
 [[0,1],[0,2],[0,3],[0,3],[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]] -> True
 0
 4
 
 5
 [[0,1],[1,2],[2,3],[3,4]] -> False
 1
 3

*/

class GraphSourceDestinationPath {
    
    func leadsToDestination(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
    
        if (edges.isEmpty && n > 1) {
            return false;
        }

        if (n == 1 && source == 0 && source == destination && edges.isEmpty) {
            return true;
        }

        var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

        for i in 0...n-1 {
            for j in 0...n-1 {
                graph[i][j] = 0;
            }
        }

        //initialize the directed graph
        for (_, item) in edges.enumerated() {
            let x = item[0];
            let y = item[1];
            graph[x][y] = 1;
            if x == y || y == source {
                return false;
            }
        }

        var result = false
        var dp : Set<Int> = []

        for j in 0...n-1 {
            let i = source

            if(graph[i][j] == 1) {
                var set : Set<Int> = [0]
                result = traverseGraph(n, graph, destination, j, 0, &set, &dp)

                if !result {
                    return result
                }
            }
        }

        return result
}

    func traverseGraph(_ n: Int, _ graph: [[Int]], _ destination: Int, _ row: Int, _ col: Int, _ set: inout Set<Int>, _ dp: inout Set<Int>) -> Bool {

        if set.contains(row) {
            return false
        }

        if row == destination {
            return true
        }

        if (dp.contains(row)) {
            return true
        }

        set.insert(row)
        var result = false

        for j in 0...n-1 {
            if graph[row][j] == 1 {
                result = traverseGraph(n, graph, destination, j, 0, &set, &dp)

                //if result is false, path from some node is non-existent or loop exists
                if !result {
                    return result
                }
                else if !dp.contains(j) {
                    dp.insert(j)
                }
            }
        }
        set.remove(row)
        return result
    }
}
