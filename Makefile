CXX=g++
CXXFLAGS=-Isrc/includes -O3 -march=native -pthread -lntl -lgmpxx -lgmp -lrelic 


ALL: test_security_param test_vec_length
	
test_security_param: BlackH19.o HenryOG11.o GrothK15.o pedersen.o utils.o ./src/test_security_param.cc
	$(CXX)  BlackH19.o HenryOG11.o GrothK15.o pedersen.o utils.o ./src/test_security_param.cc $(CXXFLAGS) -o test_security_param

test_vec_length: BlackH19.o HenryOG11.o GrothK15.o pedersen.o utils.o ./src/test_vec_length.cc
	$(CXX)   BlackH19.o HenryOG11.o GrothK15.o pedersen.o utils.o ./src/test_vec_length.cc $(CXXFLAGS) -o test_vec_length

pedersen.o: ./src/pedersen.cc
	$(CXX) $(CXXFLAGS) -c ./src/pedersen.cc -o pedersen.o

HenryOG11.o: ./src/HenryOG11.cc
	$(CXX) $(CXXFLAGS) -c ./src/HenryOG11.cc -o HenryOG11.o

BlackH19.o: ./src/BlackH19.cc
	$(CXX) $(CXXFLAGS) -c ./src/BlackH19.cc -o BlackH19.o

GrothK15.o: ./src/GrothK15.cc
	$(CXX) $(CXXFLAGS) -c ./src/GrothK15.cc -o GrothK15.o

utils.o: ./src/utils.cc
	$(CXX) $(CXXFLAGS) -c ./src/utils.cc -o utils.o

clean:
	rm -f *.o test_security_param test_vec_length
