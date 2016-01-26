
.PHONY: all

all:
	g++ -c -I/archive/kof/src/supercollider/include/lang -I/archive/kof/src/supercollider/include/common -I/archive/kof/src/supercollider/include helloSc.cpp -o helloSc.o 
	g++ helloSc.o -o helloSc -Wall -L/home/kof/src/supercollider/bare/lang -L/home/kof/src/supercollider/bare/external_libraries -L/home/kof/src/supercollider/bare/external_libraries/hidapi/linux/ -L/home/kof/src/supercollider/bare/server/scsynth -lm -lboost_thread -lboost_system -lboost_program_options -lboost_filesystem -ltlsf -lsndfile -lsclang -lscsynth -lpthread -lyaml -loscpack -lhidapi -ludev -lz -lrt -lreadline -ldl -ljack -lasound -lfftw3 /home/kof/src/supercollider/bare/external_libraries/libboost_program_options.a /home/kof/src/supercollider/bare/external_libraries/libtlsf.a /home/kof/src/supercollider/bare/external_libraries/libyaml.a /home/kof/src/supercollider/bare/external_libraries/libboost_thread.a /home/kof/src/supercollider/bare/external_libraries/libboost_system.a /home/kof/src/supercollider/bare/external_libraries/libboost_filesystem.a /home/kof/src/supercollider/bare/external_libraries/hidapi/hidapi_parser/libhidapi_parser.a /home/kof/src/supercollider/bare/external_libraries/hidapi/linux/libhidapi.a /home/kof/src/supercollider/bare/external_libraries/liboscpack.a
clean:
	rm *.o helloSc

