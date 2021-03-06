CPPFLAGS=-I /opt/local/include -Wall -g

vserver: media.o g711.o main.o
	g++ media.o g711.o main.o -L/opt/local/lib -l boost_system-mt -l boost_thread-mt -l boost_date_time -o vserver

media.o: src/media.cpp src/media.hpp
	g++ -c $(CPPFLAGS) src/media.cpp -o media.o

main.o: src/main.cpp src/json.hpp
	g++ -c $(CPPFLAGS) src/main.cpp -o main.o

g711.o: src/g711.cpp
	g++ -c $(CPPFLAGS) src/g711.cpp -o g711.o

json-test: src/json-test.cpp src/json.hpp
	g++ $(CPPFLAGS) src/json-test.cpp -L/opt/local/lib -l boost_system-mt -l boost_thread-mt -l boost_date_time -o json-test
clean: 
	rm -f *.o

