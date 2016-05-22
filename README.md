# amaze

amaze is a maze generator that generates mazes using a few different
algorithms.  Currently, it can use a recursive backtracking algorithm, or a
modified version of Prim's minimum spanning tree algorithm. 

The maze is displayed to the terminal in simple ascii art.

#### Command line arguments

| Argument        | Value          | Description                                 |
| --------------- | -------------- | ------------------------------------------- |
| --height=       | &lt;height&gt; | Set the height of the maze                  |
| --width=        | &lt;width&gt;  | Set the width of the maze                   |
| --genAlgorithm= | 0              | Select the recursive backtracking algorithm |
| --genAlgorithm= | 1              | Select the modified Prim algorithm          |
| --showSteps     |                | Print the maze after each creation step     |

Compiling this program requires a working Chapel compiler. See
http://chapel.cray.com to download the Chapel compiler and for instructions
for using it.  Once you have a working Chapel compiler this program can be
built with: ``cd src; make maze``.  It can be built and executed with:
``cd src; make HEIGHT=<height> WIDTH=<width> ALGORITHM=<0|1>``.

An example maze using the recursive backtracker algorithm:

     _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
    |   |   |    _ _|    _  |  _  |    _  |_   _ _ _ _ _  |   |_  |  _   _  |  _  |
    | |_ _|  _|_   _ _| |  _| |  _|_|   |_  | |  _ _ _  |_ _|_  |_ _ _|_  | |_|   |
    |  _| |_|   |_ _ _| |_  | |_ _  |_| | | |  _ _|  _ _|_ _  | |  _ _  | |_ _ _| |
    |_|  _|  _|_ _  |  _| | | |_ _ _ _ _| | |_  |  _|_   _  | | | |_   _|_  |  _| |
    |  _|  _  |  _|_ _|   | |  _ _ _ _  |  _| | | |   | |_ _  | |_  | |  _ _|_ _ _|
    | | | | | |  _ _   _| | |_ _ _|   | |_  |_ _| | | |_ _  | |_ _ _| |   |   |   |
    | |_ _ _| |_ _  |_  |_|_ _ _  | |_ _| | |  _ _| |_ _ _ _| |   |  _| |_ _|_  | |
    |_ _ _  |  _  |_  |_ _   _ _| | | |  _ _ _|   |_  |  _  |_ _| | |_ _  |   | | |
    |  _  | |_|  _|  _|_  |_  |  _| |  _|  _  | |_  |  _| | |_ _ _|_  |  _| | | | |
    |_|   |_  |_  |_  |  _  | |_  | |_|  _ _|_ _|  _| |_  |_ _  |  _ _|_ _| | |_| |
    |   |_ _|_ _ _| |_ _| | |_ _ _|_ _ _|  _  |  _| |_ _  |_  |_ _|  _ _ _ _|_ _  |
    | |_|   |  _ _ _   _|  _|  _ _   _  |_  |_ _|   |   |_  |  _ _ _|  _   _ _ _| |
    |  _ _|_ _|   |  _|  _| |_  |  _| |_  | |    _|_ _| | | | | |  _ _|  _|  _ _ _|
    |_ _   _|   |_ _|  _|  _  | | |_ _ _ _ _| |_|  _  |_  | | |_  |   |_ _ _|  _  |
    |  _ _|  _|_|   | |  _|  _| | |  _  |_    |  _| | |_ _| |_  | |_|_ _ _ _ _  | |
    | |_  |_  |  _|_ _| |_  |  _|_ _ _|_  |_| |_ _  | |  _ _|  _|_ _ _ _ _  |  _| |
    |_ _  |   |_  |_ _ _  |_|_  |_  |   |   |  _  | |_ _|  _ _|   |   |  _ _|_  | |
    |_  | | |_ _|_ _ _  | |   | |  _| | | | |_  |_ _|_ _ _ _  | |_| | | |  _   _| |
    |  _| |_  |  _ _ _ _|  _|_ _|_  | | |_| | |_  |   |   |  _| |  _|_ _|_ _| |_ _|
    | |  _| | | |  _  |_  |    _ _  | |  _ _|  _|_ _| | |_ _|_  |_  |    _  |  _  |
    |  _|  _|_ _|_  |_  | |_|_ _  |_| |_|   |_   _ _ _|_  |_     _| |_| | | |_|   |
    |_  |_   _ _ _ _|  _|_ _ _  |_  |_  | |_  |_ _ _  |  _|  _|_|  _|  _| |_  | | |
    | |_ _ _| |  _ _ _|_    |_ _ _  | |_ _| |_  | |  _|_  |_  |  _|_    |_ _ _ _| |
    |  _|  _ _ _|  _   _ _|_  | |  _|_   _ _ _| |  _|   | |   | |   |_|_ _  | |  _|
    | |  _|   |  _  |_|   |  _|  _|_    |  _  | |_ _ _|_ _| | | | |_  |  _  |_ _ _|
    |  _|_  | | |  _|  _| | |_  |_   _| | | |_ _| |  _ _    |_| | | | | |_ _|  _  |
    | |    _|_| | |  _|  _|_  |_   _|_ _| |    _ _|_   _| | |  _| |  _|  _ _ _ _| |
    | |_|_ _ _  |_ _|  _| |  _|_ _|  _ _ _| | |    _| |  _|_| |  _|_  |_|  _ _ _  |
    |_ _  |   |_ _ _| |  _|_  |  _ _|  _   _|_| | |  _|_ _  | | |  _ _|  _|  _|  _|
    |_ _ _ _|_ _ _ _ _|_ _ _ _ _|_ _ _ _|_ _ _ _|_ _ _ _ _|_ _ _|_ _ _ _|_ _ _ _ _|


Ideas for future work:

  * Add more generation algorithms.
    * Kruskal
    * Prim direct algorithm
    * etc.
  * Add solvers.
    * Recursive backtracker
    * Touch the wall and walk
    * Others?
  * Generate 2D graphic mazes instead of ascii art.
    * Display an auto-solver in 2D.
    * Allow manual solving in 2D.
  * Generate 3D views of 2D mazes
    * Create an automatic walkthrough solver in 3D mode.
    * Allow manual solving in 3D mode.
  * Generate 3D or higher dimensional mazes
