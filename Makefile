CPPFLAGS=-std=c++1y
THRIFT_GEN+= -Igen-cpp
CPP=g++
LDFLAGS=-g $(THRIFT_GEN)
LDLIBS=-lfolly -lgflags -lpthread -lthrift -ldouble-conversion -lglog
THRIFT=thrift

all: upingpong

upingpong:
	cd uping/ && $(MAKE)
	cd upong/ && $(MAKE)

install:
	cp uping/uping /usr/local/bin
	cp upong/upong /usr/local/bin

uninstall:
	rm /usr/local/bin/uping 
	rm /usr/local/bin/upong

clean:
	cd uping/ && $(MAKE) clean
	cd upong/ && $(MAKE) clean
