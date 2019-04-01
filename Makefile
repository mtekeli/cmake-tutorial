CMAKE_OPTIONS = 
ifdef USE_MYMATH
	CMAKE_OPTIONS += -DUSE_MYMATH=${USE_MYMATH}
endif

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
	@ cd bin && cmake ${CMAKE_OPTIONS} ../

clean:
	@ rm -rf ./bin || true
