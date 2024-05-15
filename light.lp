%Place a light in a cell
{ light(X,Y) : rows(R), cols(C), X=1..R, Y=1..C, not digit(X,Y,_), not empty(X,Y), not adjacent_to_zero(X,Y), not light_in_line(X,Y) } .

%Define when there is a light in the same row or column without a wall between
light_in_line(X,Y) :- rows(R), cols(C), X=1..R, Y=1..C, light(X1,Y), X1 != X, not block(X,Y,X1,Y).
light_in_line(X,Y) :- rows(R), cols(C), X=1..R, Y=1..C, light(X,Y1), Y1 != Y, not block(X,Y,X,Y1).

%Define when a cell is adjacent to a cell with a digit 0
adjacent_to_zero(X,Y) :- rows(R), cols(C), X=1..R, Y=1..C, X1=1..R, Y1=1..C, digit(X1,Y1,0), adjacent(X,Y,X1,Y1).

%A cell is illuminated if it has a light or if it is adjacent to an illuminated cell
illuminated(X,Y) :- light(X,Y).
illuminated(X,Y) :- rows(R), cols(C), X=1..R, Y=1..C, light(X,Y1), Y1 < Y, not block(X,Y,X,Y1).
illuminated(X,Y) :- rows(R), cols(C), X=1..R, Y=1..C, light(X,Y1), Y1 > Y, not block(X,Y,X,Y1).
illuminated(X,Y) :- rows(R), cols(C), X=1..R, Y=1..C, light(X1,Y), X1 < X, not block(X,Y,X1,Y).
illuminated(X,Y) :- rows(R), cols(C), X=1..R, Y=1..C, light(X1,Y), X1 > X, not block(X,Y,X1,Y).

% Define when there is a predetermined cell between two cells
block(X,Y,X1,Y1) :- rows(R), cols(C), X=1..R, Y=1..C, X1=1..R, Y1=1..C, digit(Z,W,_), Z = X, Z = X1, W > Y, W < Y1.
block(X,Y,X1,Y1) :- rows(R), cols(C), X=1..R, Y=1..C, X1=1..R, Y1=1..C, digit(Z,W,_), Z = X, Z = X1, W < Y, W > Y1.
block(X,Y,X1,Y1) :- rows(R), cols(C), X=1..R, Y=1..C, X1=1..R, Y1=1..C, digit(Z,W,_), W = Y, W = Y1, Z > X, Z < X1.
block(X,Y,X1,Y1) :- rows(R), cols(C), X=1..R, Y=1..C, X1=1..R, Y1=1..C, digit(Z,W,_), W = Y, W = Y1, Z < X, Z > X1.
block(X,Y,X1,Y1) :- rows(R), cols(C), X=1..R, Y=1..C, X1=1..R, Y1=1..C, empty(Z,W), Z = X, Z = X1, W > Y, W < Y1.
block(X,Y,X1,Y1) :- rows(R), cols(C), X=1..R, Y=1..C, X1=1..R, Y1=1..C, empty(Z,W), Z = X, Z = X1, W < Y, W > Y1.
block(X,Y,X1,Y1) :- rows(R), cols(C), X=1..R, Y=1..C, X1=1..R, Y1=1..C, empty(Z,W), W = Y, W = Y1, Z > X, Z < X1.
block(X,Y,X1,Y1) :- rows(R), cols(C), X=1..R, Y=1..C, X1=1..R, Y1=1..C, empty(Z,W), W = Y, W = Y1, Z < X, Z > X1.

% Define when two cells are adjacent
adjacent(X,Y,X1,Y) :- rows(R), cols(C), X=1..R, Y=1..C, X1 = X+1, X1 <= R.
adjacent(X,Y,X1,Y) :- rows(R), cols(C), X=1..R, Y=1..C, X1 = X-1, X1 >= 1.
adjacent(X,Y,X,Y1) :- rows(R), cols(C), X=1..R, Y=1..C, Y1 = Y+1, Y1 <= C.
adjacent(X,Y,X,Y1) :- rows(R), cols(C), X=1..R, Y=1..C, Y1 = Y-1, Y1 >= 1.

%For each cell with a number d, exactly d horizontally or vertically adjacent cells must each contain a light
:- digit(X,Y,D), D != #count { X1,Y1 : light(X1,Y1), adjacent(X,Y,X1,Y1), rows(R), cols(C), X=1..R, Y=1..C, not adjacent_to_zero(X1,Y1) }.

%All non-predetermined cells must be illuminated
:- rows(R), cols(C), X=1..R, Y=1..C, not digit(X,Y,_), not empty(X,Y), not illuminated(X,Y).

%Show the positions of the lights in the solution
#show light/2.
