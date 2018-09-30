/// @description Get the BGR of the ZX spectrum colour
// @param col The ZX Spectrum colour

switch(argument0)
{
	case 0: return $000000;	// black
	case 1: return $c00000;	// blue
	case 2: return $0000c0;	// red
	case 3: return $c000c0;	// purple
	case 4: return $00c000;	// green
	case 5: return $c0c000;	// cyan
	case 6: return $00c0c0;	// yellow
	case 7: return $c0c0c0; // grey
	case 8: return $000000;	// bright black
	case 9: return $ff0000;	// blue
	case 10: return $0000ff;	// red
	case 11: return $ff00ff;	// purple
	case 12: return $00ff00;	// green
	case 13: return $ffff00;	// cyan
	case 14: return $00ffff;	// yellow
	case 15: return $ffffff; // grey	
	default:
		return 0;
}