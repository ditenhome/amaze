use Random;
config const showSteps = false;

enum Direction {
  north,
  east,
  south,
  west
}

record Node {
  var position_x, position_y: int;
  var DirectionDom: domain(Direction);
  var Walls: [DirectionDom] bool = true;
  var visited: bool = false;
}

config const height=10, width = 10;

record MazeRec {
  var height, width: int;
  var MazeDom: domain(2, stridable=true); // {0..#height, 0..#width};
  var Maze: [MazeDom] Node;
  proc MazeRec(height, width) {
    this.height = height;
    this.width = width;
    MazeDom = {0..#height by -1, 0..#width};
    for (y,x) in MazeDom {
      Maze[y,x].position_x = x;
      Maze[y,x].position_y = y;
    }
  }
  proc removeWall(x: int, y: int, dir: Direction) {
    if (!Maze[y,x].Walls[dir]) {
      writeln((y,x,dir), " is not a wall");
      printMaze();
      assert(Maze[y, x].Walls[dir]);
    }
    Maze[y, x].Walls[dir] = false;

    if dir == Direction.north {
      if Maze.domain.member((y+1, x)) {
        assert(Maze[y+1, x].Walls[Direction.south]);
        Maze[y+1, x].Walls[Direction.south] = false;
      }
    } else if dir == Direction.east {
      if Maze.domain.member((y, x+1)) {
        assert(Maze(y, x+1).Walls[Direction.west]);
        Maze[y, x+1].Walls[Direction.west] = false;
      }
    } else if dir == Direction.south {
      if Maze.domain.member((y-1, x)) {
        assert(Maze[y-1, x].Walls[Direction.north]);
        Maze[y-1, x].Walls[Direction.north] = false;
      }
    } else if dir == Direction.west {
      if Maze.domain.member((y, x-1)) {
        assert(Maze[y, x-1].Walls[Direction.east]);
        Maze[y, x-1].Walls[Direction.east] = false;
      }
    }
  }
  proc printMaze() {
    const mazeTop    = MazeDom.dim(1).high,
          mazeBottom = MazeDom.dim(1).low,
          mazeRight  = MazeDom.dim(2).high,
          mazeLeft   = MazeDom.dim(2).low;

    // print maze top walls
    for i in 0..mazeRight {
      write(' _');
    }
    writeln();

    for (y,x) in MazeDom {
      //if Maze[y,x].Walls
      if x == mazeLeft {
        if Maze[y,x].Walls[Direction.west] {
          write('|');
        } else {
          write(' ');
        }
      }
      if Maze[y,x].Walls[Direction.south] {
        write('_');
      } else {
        write(' ');
      }
      if Maze[y,x].Walls[Direction.east] {
        write('|');
      } else {
        write(' ');
      }
      if x == mazeRight {
        writeln();
      }
    }
  }
}

proc recursiveBacktracker(ref maze: MazeRec) {
  var stack: [1..0] 2*int;
  var rand = new RandomStream(eltType=int);
  // pick a random starting position
  
  var x = rand.getNext(0, maze.width-1) , y = rand.getNext(0, maze.height-1);

  proc pushIfLegal(y, x, legalMoves) {
    if maze.MazeDom.member((y,x)) && !maze.Maze[y,x].visited {
      legalMoves.push_back((y,x));
    }
  }

  do {
    var legalMoves: [0..-1] 2*int;
    var newx = x, newy = y;

    maze.Maze[y,x].visited = true;
    pushIfLegal(y+1, x, legalMoves);
    pushIfLegal(y-1, x, legalMoves);
    pushIfLegal(y, x+1, legalMoves);
    pushIfLegal(y, x-1, legalMoves);

    if legalMoves.numElements > 0 {
      // pick a move randomly out of the legalMoves array and move there
      var move = legalMoves[rand.getNext(0,legalMoves.numElements-1)];
      if showSteps {
        maze.printMaze();
      }
      if move(1) > y {
        maze.removeWall(x, y, Direction.north);
        newy = move(1);
      } else if move(1) < y {
        maze.removeWall(x, y, Direction.south);
        newy = move(1);
      } else if move(2) > x {
        maze.removeWall(x, y, Direction.east);
        newx = move(2);
      } else if move(2) < x {
        maze.removeWall(x, y, Direction.west);
        newx = move(2);
      } else {
        assert(false);
      }
      stack.push_back((y,x));
    } else {
      // back up to the last position in the stack
      newy = stack[stack.numElements](1);
      newx = stack[stack.numElements](2);
      stack.pop_back();
    }
    y = newy;
    x = newx;
  } while (stack.numElements > 0);
}

var m = new MazeRec(height, width);
recursiveBacktracker(m);
m.printMaze();

