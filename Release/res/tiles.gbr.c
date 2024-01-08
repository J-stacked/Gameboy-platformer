#pragma bank 255
#include <gb/gb.h>
#include <gb/cgb.h>


const UINT16 tiles_palettes[4] = {
	RGB(28, 29, 5), RGB(7, 23, 8), RGB(4, 14, 6), RGB(0, 7, 5)
};

const unsigned char tilesCGB[] = {
	0x00,0x00
};

const unsigned char tiles_tiles[] = {
	//Frame 0
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	
	//Frame 1
	0xcf,0x20,0xc3,0x20,0x00,0xff,0xfb,0x04,
	0xf9,0x04,0x78,0x04,0x00,0xff,0xdf,0x20
};

#include "TilesInfo.h"
const void __at(255) __bank_tiles;
const struct TilesInfo tiles = {
	2, //num_tiles
	tiles_tiles, //tiles
	1, //num_palettes
	tiles_palettes, //palettes
	tilesCGB, //CGB palette
};