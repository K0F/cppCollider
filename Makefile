
.PHONY: all

all:
	g++ -c -I/archive/kof/src/supercollider/include/lang -I/archive/kof/src/supercollider/include/common -I/archive/kof/src/supercollider/include helloSc.cpp -o helloSc.o 
	g++ helloSc.o -o helloSc -Wall -L/home/kof/src/supercollider/bare/lang -L/home/kof/src/supercollider/bare/external_libraries -L/home/kof/src/supercollider/bare/external_libraries/hidapi/linux/ -L/home/kof/src/supercollider/bare/server/scsynth -lm -lboost_thread -lboost_system -lboost_program_options -lboost_filesystem -ltlsf -lsndfile -lsclang -lscsynth -lpthread -lyaml -loscpack -lhidapi -ludev -lz -lrt -lreadline -ldl -ljack -l/home/kof/src/supercollider/bare/external_libraries/libboost_program_options.a \
-l/home/kof/src/supercollider/bare/external_libraries/libtlsf.a\
-l/home/kof/src/supercollider/bare/external_libraries/libyaml.a\
-l/home/kof/src/supercollider/bare/external_libraries/libboost_thread.a\
-l/home/kof/src/supercollider/bare/external_libraries/libboost_system.a\
-l/home/kof/src/supercollider/bare/external_libraries/libboost_filesystem.a\
-l/home/kof/src/supercollider/bare/external_libraries/hidapi/hidapi_parser/libhidapi_parser.a\
-l/home/kof/src/supercollider/bare/external_libraries/hidapi/linux/libhidapi.a\
-l/home/kof/src/supercollider/bare/external_libraries/liboscpack.a
clean:
	rm *.o helloSc

