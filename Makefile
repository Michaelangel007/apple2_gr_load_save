all: gr_load_save dsk
.PHONY: clean

clean:
	rm -f gr_load_save

gr_load_save: gr_load_save.s
	merlin32 $<

# a2tools
dsk: gr_load_save
	-a2rm       gr_demo.dsk GR_LOAD_SAVE.BIN > /dev/null 2>&1
	a2in B.0300 gr_demo.dsk GR_LOAD_SAVE.BIN gr_load_save

