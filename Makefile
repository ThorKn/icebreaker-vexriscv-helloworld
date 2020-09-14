all: bitstream

bitstream:
	cd vexriscv/rtl ; $(MAKE)

clean:
	cd vexriscv/rtl ; $(MAKE) clean
