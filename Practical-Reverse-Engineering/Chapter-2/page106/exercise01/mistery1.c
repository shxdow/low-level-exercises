

type mistery1(int8_t * arg0, arg1)
{
    // line 2: save registers R4 - R8
    if (*(arg0) == 0x2D) {
        *(++arg0) = *(arg0);
        return 1;
    }
    if (*(arg0) <= 0x2B) {
        *(++arg0) = *(arg0);
    }

}
