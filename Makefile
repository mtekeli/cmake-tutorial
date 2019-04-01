ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: qtc, config

qtc:
	@ qtcreator $(ROOT_DIR)/CMakeLists.txt

config:
	@ mkdir -p output & cd output
	@ cmake -DUSE_MYMATH=OFF ../
