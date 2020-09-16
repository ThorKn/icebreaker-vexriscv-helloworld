all: bitstream hello_world

bitstream:
	cd vexriscv/rtl ; $(MAKE)

hello_world:
	cd hello_world ; $(MAKE)

clean:
	cd vexriscv/rtl ; $(MAKE) clean
	cd hello_world ; $(MAKE) clean
