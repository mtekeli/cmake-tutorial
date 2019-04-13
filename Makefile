CMAKE_OPTIONS = 
ifdef USE_MYMATH
	CMAKE_OPTIONS += -DUSE_MYMATH=${USE_MYMATH}
endif

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: build, qtc, config, clean, install, docker, config-rpi

build:
	@ cd bin && make

install: build
	@ cd bin && make install

qtc:
	@ qtcreator $(ROOT_DIR)/CMakeLists.txt

config: clean
	@ mkdir -p bin
	@ cd bin && cmake ${CMAKE_OPTIONS} ../

docker:
	@ docker build -t mustafatekeli/tutorial-cross-compile:latest ./rpi
	@ docker run -it \
		-v /Users/mustafatekeli/dev/ws/cmake-tutorial:/root/cmake-tutorial \
		--workdir=//root/cmake-tutorial \
		--env BUILD_NAME=linux-armhf-rpi \
		mustafatekeli/tutorial-cross-compile:latest 

config-rpi: clean
	@ mkdir -p bin
	@ cd bin && cmake ${CMAKE_OPTIONS} -DCMAKE_TOOLCHAIN_FILE=rpi/toolchain-rpi.cmake ../

clean:
	@ rm -rf ./bin || true
