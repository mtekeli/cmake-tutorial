ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: build, qtc, config, clean, install

build: config
	@ cd bin && make

install: build
	@ cd bin && make install

qtc:
	@ qtcreator $(ROOT_DIR)/CMakeLists.txt

config: clean
	@ mkdir -p bin
	@ cd bin && cmake -DUSE_MYMATH=OFF ../

clean:
	@ rm -rf ./bin || true
