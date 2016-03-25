#!/bin/sh
export COPROCESSORS="mic0 mic1"
export BINDIR="/opt/intel/impi/5.1.1.109/mic/bin"
export LIBDIR="/opt/intel/impi/5.1.1.109/mic/lib"
export COMPILERLIB="/opt/intel/compilers_and_libraries/linux/lib/mic"
export MICLIB="/opt/intel/lib/mic" 
for coprocessor in `echo $COPROCESSORS`
do
   for prog in mpiexec mpiexec.hydra pmi_proxy mpirun
   do
      sudo scp $BINDIR/$prog $coprocessor:/bin/$prog
   done

   for lib in libmpi.so.12 libmpifort.so.12 libmpicxx.so.12
   do
      sudo scp $LIBDIR/$lib $coprocessor:/lib64/$lib
   done

   for lib in libimf.so libsvml.so libintlc.so.5
   do
      sudo scp $COMPILERLIB/$lib $coprocessor:/lib64/$lib
   done

   for lib in libiomp5.so
   do
      sudo scp $MICLIB/$lib $coprocessor:/lib64/$lib
   done
done
