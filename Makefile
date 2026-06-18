# Render schematic as SVG
#
# Dependencies:
# - https://github.com/INTI-CMNB/KiBot
# - https://www.gnu.org/software/m4/
# - https://www.gnu.org/software/sed/

.DELETE_ON_ERROR:
.SECONDARY:
.PHONY: all

all: \
	render/esp32-door-buzzer-sch.svg \

render/%-sch.svg: build/%-schematic.svg Makefile
	sed \
		-e 's:<title>[^<]*</title>::' \
		< $< > $@

build/%-schematic.svg: %.kicad_sch default.kibot.yaml
	kibot -e $< -b $(word 2,$^)
