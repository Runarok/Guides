/*
1. Aim:
   To implement Dijkstra’s algorithm to compute the shortest path from a given source vertex to all other vertices in a weighted graph.

2. Software Tool:
   - Language: C
   - Compiler: GCC / Turbo C / Code::Blocks
   - Platform: Windows / Linux

3. Theory:
   - Dijkstra's algorithm is a **greedy algorithm** used to find the shortest path from a single source vertex to all other vertices in a **weighted** graph with **non-negative weights**.
   - It works by:
     - Initializing distances from the source to all other vertices as infinity (a large value like 999 here).
     - Marking all vertices as unvisited.
     - Repeatedly selecting the unvisited vertex with the smallest distance, and updating the distances of its neighbors.
   - The process continues until all vertices are visited.

4. Procedure:
   1. Input the number of vertices.
   2. Input the adjacency matrix of the graph (use 999 to represent infinity).
   3. Input the source vertex.
   4. Initialize the distance array with the distances from the source.
   5. Mark the source vertex as visited.
   6. Repeat:
      - Find the unvisited vertex with the smallest distance.
      - Update the distances of its unvisited neighbors.
      - Mark the vertex as visited.
   7. Output the shortest distance from the source to all other vertices.
*/

#include <stdio.h>

// Function to perform Dijkstra’s algorithm
void dijkstra(int src, int cost[][10], int dist[], int n)
{
    int visited[10], min, i, j, u;

    // Initialize visited array and distance array
    for (i = 1; i <= n; i++)
    {
        visited[i] = 0;              // Mark all vertices as unvisited
        dist[i] = cost[src][i];      // Initialize distance from source to i
    }

    visited[src] = 1;  // Mark source as visited
    dist[src] = 0;     // Distance from source to itself is 0

    // Repeat for all vertices
    for (i = 1; i <= n; i++)
    {
        if (i == src) continue;  // Skip if it's the source itself

        min = 999;  // Set min to a large value (infinity)
        for (j = 1; j <= n; j++)
        {
            // Find the unvisited vertex with the smallest distance
            if ((visited[j] == 0) && (min > dist[j]))
            {
                min = dist[j];  // Update min
                u = j;          // Store vertex with minimum distance
            }
        }

        visited[u] = 1;  // Mark the chosen vertex as visited

        // Update distances of neighbors of the chosen vertex
        for (j = 1; j <= n; j++)
        {
            if (visited[j] == 0)
            {
                // If going through u offers a shorter path, update it
                if (dist[j] > dist[u] + cost[u][j])
                    dist[j] = dist[u] + cost[u][j];
            }
        }
    }
}

int main()
{
    int n, cost[10][10], dist[10] = {0}, i, j, src;

    // Input number of vertices
    printf("Enter the number of vertices: ");
    scanf("%d", &n);

    // Input adjacency matrix
    printf("Enter the adjacency matrix of the graph (use 999 for infinity):\n");
    for (i = 1; i <= n; i++)
        for (j = 1; j <= n; j++)
            scanf("%d", &cost[i][j]);

    // Input the source vertex
    printf("Enter the source vertex: ");
    scanf("%d", &src);

    // Call Dijkstra’s algorithm
    dijkstra(src, cost, dist, n);

    // Output shortest distances
    printf("\nThe shortest paths from source %d to all other vertices are:\n", src);
    for (i = 1; i <= n; i++)
        printf("%d → %d = %d\n", src, i, dist[i]);

    return 0;
}

/*
6. Result:
   - The program successfully computes the shortest paths from the given source vertex to all other vertices using Dijkstra’s algorithm.
   - The output displays the minimum cost/distance from the source to each destination vertex.
*/
