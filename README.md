# light-puzzle-clingo
This project involves solving a grid-based logic puzzle using ASP, where the goal is to illuminate all non-predefined cells with lights, adhering to constraints on visibility and adjacency.

## Project Overview
This project involves solving a logic puzzle where the objective is to illuminate a two-dimensional grid using lights. The grid is square and contains some cells that are predefined. These predefined cells might be empty or have an integer ranging from 0 to 4.

The main challenge is to position lights on the grid's non-predefined cells ensuring that each of these cells is lit by at least one light. The lights can illuminate horizontally or vertically, but their beams cannot pass through any of the predefined cells, whether they are empty or contain a number.

Moreover, no two lights should be able to illuminate each other. For cells that contain a number n, it is required that exactly n cells adjacent to it (either horizontally or vertically) contain a light.

## ASP Representation
To represent this puzzle in Answer Set Programming (ASP), the grid dimensions, the cells with numbers, and the empty predefined cells are defined with the following facts:

rows(R). % Defines R as the total number of rows in the grid
cols(C). % Defines C as the total number of columns in the grid
digit(X,Y,D). % Indicates that there is a digit D in the cell at position (X,Y) within the grid
empty(X,Y). % Indicates an empty cell at the coordinates (X,Y) in the grid
