CHPL=chpl
#OPTS=--fast
OPTS=
HEIGHT=4
WIDTH=5
ALGORITHM=0

run: maze
	./maze --height=$(HEIGHT) --width=$(WIDTH) --genAlgorithm=$(ALGORITHM)

maze: maze.chpl
	chpl maze.chpl -o maze

clean:
	rm -f maze
