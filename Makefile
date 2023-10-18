
.PHONY : debug release clean

debug:
	mkdir -p debug
	cd debug ; cmake -DCMAKE_BUILD_TYPE=Debug .. ; make --no-print-directory ; ./tests

release:
	mkdir -p release
	cd release ; cmake -DCMAKE_BUILD_TYPE=Release .. ; make --no-print-directory ; ./tests

clean:
	rm -rf debug
	rm -rf release
