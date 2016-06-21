EXECUTABLE = testlib

HDRS = p7_bg.h\
	p7_oprofile.h\
	p7_profile.h\
	p7_hmm.h\
	p7_trace.h\
	p7_anchors.h\
	p7_hmmfile.h\
	p7_mpas.h\
	p7_sparsemx.h\
	p7_checkptmx.h\
	p7_anchorhash.h\
	p7_envelopes.h\
	p7_filtermx.h\
	p7_engine.h\
	simdvec.h\
	modelconfig.h\
	modelsample.h\
	modelstats.h\
	emit.h\
	evalues.h\
	general.h\
	logsum.h

OBJS = p7_bg.o\
	p7_oprofile.o\
	p7_profile.o\
	p7_hmm.o\
	p7_trace.o\
	p7_anchors.o\
	p7_sparsemx.o\
	p7_checkptmx.o\
	p7_anchorhash.o\
	p7_envelopes.o\
	p7_filtermx.o\
	p7_engine.o\
	p7_hmmfile.o\
	p7_mpas.o\
	simdvec.o\
	evalues.o\
	modelconfig.o\
	modelsample.o\
	modelstats.o\
	emit.o\
	general.o\
	logsum.o
 
CC     = gcc
CFLAGS = -O3 -g -mfpu=neon
ESLDIR = easel
AR = /usr/bin/ar
MYLIBDIRS = -L./${ESLDIR} -I./${ESLDIR} 
RANLIB = ranlib
myexe: ${OBJS}
	${CC} ${CFLAGS} -o $@ ${OBJS} -lm -leasel  

#all:   px px_serial
#all: ${SOURCES} ${EXECUTABLE}

#${EXECUTABLE}: ${OBJECTS}
#	${CC} ${CFLAGS} ${LDFLAGS} ${OBJS} -o $@

.FORCE:

${OBJS}: ${HDRS} p7_config.h

#libtest: ${OBJS}
#	${CC} ${CFLAGS} -o libtest -lm -leasel ${OBJS}
.c.o:
	${CC} -c ${CFLAGS} ${MYLIBDIRS} -o $@ $< -lm -leasel 

libtest.a: ${OBJS}
	${AR} -r libtest.a ${OBJS} 
	@${RANLIB} libtest.a

#px:     px.c
#	${CC} ${CFLAGS} -o px -L ${HOME}/Documents/research/hmmer-port/code/hmmer/src -L ${HOME}/Documents/research/hmmer-port/code/easel -I ${HOME}/Documents/research/hmmer-port/code/hmmer/src -I ${HOME}/Documents/research/hmmer-port/code/easel px.c -leasel -lm -lpthread

px: px.c
	${CC} ${CFLAGS} -o px px.c ${MYLIBDIRS} -ltest -leasel -lm -lpthread

px_serial: px_serial.c
	${CC} ${CFLAGS} -o px_serial px_serial.c ${MYLIBDIRS} -ltest -leasel -lm -lpthread

#px_serial:  px_serial.c
#	${CC} ${CFLAGS} -o px_serial -L ${HOME}/Documents/research/hmmer-port/code/hmmer/src -L ${HOME}/Documents/research/hmmer-port/code/easel -I ${HOME}/Documents/research/hmmer-port/code/hmmer/src -I ${HOME}/Documents/research/hmmer-port/code/easel px_serial.c -leasel -lm -lpthread

clean:
	-rm *.o *~
	-rm px px_serial
