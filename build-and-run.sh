set -x

gcc -O2 ./src/CLoop.c -o ./bin/CLoop && bench -L60 ./bin/CLoop
gcc -O2 ./src/CLoop.c -S
gcc -O2 ./src/CLoopVolatile.c -o ./bin/CLoopVolatile && bench -L60 ./bin/CLoopVolatile
gcc -O2 ./src/CLoopVolatile.c -S
nasm -fmacho src/AsmLoop.asm  && ld -o ./bin/AsmLoop -macosx_version_min 10.7.0 ./src/AsmLoop.o && bench -L60 ./bin/AsmLoop
nasm -fmacho64 src/FastAsmLoop.asm && ld -o ./bin/FastAsmLoop -macosx_version_min 10.7.0 ./src/FastAsmLoop.o && bench ./bin/FastAsmLoop
stack install
bench -L60 ./bin/ioref-loop
stack exec ghc-core -- --no-syntax -- -O2 -dsuppress-all src/IORefLoop.hs > core/IORefLoop.core
bench -L60 ./bin/mutable-byte-buffer-loop
stack exec ghc-core -- --no-syntax -- -O2 -dsuppress-all src/MutableByteBufferLoop.hs > core/MutableByteBufferLoop.core
bench -L60 ./bin/ptr-loop
stack exec ghc-core -- --no-syntax -- -O2 -dsuppress-all src/PtrLoop.hs > core/PtrLoop.core
bench -L60 ./bin/vector-loop
stack exec ghc-core -- --no-syntax -- -O2 -dsuppress-all src/VectorLoop.hs > core/VectorLoop.core
