module src.kernel;
import core.volatile; // will be core.volatile in later gdc
import src.idt;
import src.ports;

extern (C) void main(uint magic, uint addr)
{
	int ypos = 0;
	int xpos = 0;
	const uint COLUMNS = 80;
	const uint LINES = 25;

	ubyte* vidmem = cast(ubyte*) 0xb8000;
	
	for (int i = 0; i < COLUMNS * LINES * 2; i++)
	{
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
