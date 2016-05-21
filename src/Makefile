CHPL=chpl
#OPTS=--fast
OPTS=
HEIGHT=4
WIDTH=5

run: maze
	./maze --height=$(HEIGHT) --width=$(WIDTH)

maze: maze.chpl
	chpl maze.chpl -o maze

clean:
	rm -f maze
