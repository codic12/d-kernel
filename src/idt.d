module src.idt;

struct IDTEntry
{
    ushort offset_lowerbits;
    ushort selector;
    ubyte zero;
    ubyte type_attr;
    ushort offset_higherbits;
}

struct IDT
{
    IDTEntry[512] entries;
    void init(void function() kbd_handler)
    {
        ulong kbd_addr;
        ulong idt_addr;
        ulong[2] idt_ptr;

        kbd_addr = cast(ulong) kbd_handler.ptr;

        entries[0x21].offset_lowerbits = kbd_addr & 0xffff;
        entries[0x21].selector = 0x08;
        entries[0x21].zero = 0;
        entries[0x21].type_attr = 0x8e;
        entries[0x21].offset_higherbits = (kbd_addr & 0xffff0000) >> 16;
    }
}
