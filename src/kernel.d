module src.kernel;
import core.volatile; // will be core.volatile in later gdc
import src.idt;
import src.ports;

extern (C) void main(uint magic, uint addr)
{
	int ypos = 0; //Starting points of the cursor
	int xpos = 0;
	const uint COLUMNS = 80; //Screensize
	const uint LINES = 25;

	ubyte* vidmem = cast(ubyte*) 0xFFFF_8000_000B_8000; //Video memory address

	for (int i = 0; i < COLUMNS * LINES * 2; i++)
	{ //Loops through the screen and clears it
		volatileStore(vidmem + i, 0);
	}

	IDT idt = void;
	idt.init(() {

	});
 
	asm
	{
		hlt;
	}
}
