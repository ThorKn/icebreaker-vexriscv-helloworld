ICESTORM_TARGET = PQVexRiscvUP5K

YOSYS = yosys
NEXTPNR = nextpnr-ice40
ICETIME = icetime
ICEPACK = icepack

SCALA_SOURCES := $(shell find ../src -name "*.scala")

GENERATOR_NAME = $(ICESTORM_TARGET)
GENERATED_FILE = $(GENERATOR_NAME).v

PCF_FILE = $(ICESTORM_TARGET)_icebreaker.pcf

GENERATOR_FLAGS=--mul
YOSYSFLAGS=-dsp
PACKAGE=sg48
DEVICE=up5k

all: $(ICESTORM_TARGET).bit

.SECONDEXPANSION:

%.v: ../build.sbt $(SCALA_SOURCES)
	cd ../;	sbt "runMain mupq.$(GENERATOR_NAME) $(GENERATOR_FLAGS)"

TOPLEVEL_MODULE = $*

%.json %_yosys.log: %.v
	$(YOSYS) -q -l $*_yosys.log -p "synth_ice40 -top $(TOPLEVEL_MODULE) -json $@ $(YOSYSFLAGS)" $<


%.asc %_pnr.log: %.json $$(PCF_FILE)
	$(NEXTPNR) -l $*_pnr.log --$(DEVICE) --package $(PACKAGE) --json $< --pcf $(PCF_FILE) --asc $@

%.bit: %.asc
	$(ICEPACK) $< $@

clean:
	rm -f *.asc *.bit *.json *.log *.v *.dcp *.mcs *.util *.time

.SECONDARY:
