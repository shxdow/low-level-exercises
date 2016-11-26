
/*
 * This doesn't look like a function as it doesn't save the register state
 */
mistery3 ()
{
    [R3 + 0x8] = [R0 + 0x8];
    R0 = 0;
    [R3 + 0xC] = [R4 + 0x4];
}
