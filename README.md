# amaze

amaze is a maze generator that generates mazes using a few different
algorithms.  Currently, it can use a recursive backtracking algorithm, or a
modified version of Prim's minimum spanning tree algorithm. You can select
the algorithm to use by setting the command line argument '--genAlgorithm'.

The maze is displayed to the terminal in simple ascii art.

The height and width of the maze can be set with command line arguments 
'--height=<heightVal>' and '--width=<widthVal>'

'--genAlgorithm=0' will use the recursive backtracking algorithm.
'--genAlgorithm=1' will use the modified Prim algorithm.

'--showSteps' will print the maze after each wall is removed, showing the
steps in the creation of the maze.

Compiling this program requires a working Chapel compiler. See
http://chapel.cray.com to download the Chapel compiler and for instructions
for using it.  Once you have a working Chapel compiler this program can be
built with: "cd src; make maze".  It can be built and executed with:
"cd src; make HEIGHT=<heightVal> WIDTH=<widthVal> ALGORITHM=<0|1>".
