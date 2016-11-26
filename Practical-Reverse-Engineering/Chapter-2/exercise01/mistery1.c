/* ARM code
 * R4-R8 are saved
 *
 * R6: should be a variable or sth
 *
 *
 */

unknown_type sub_1234(int32_t arg0, arg1, arg2, int32_t arg3)
{
		// line 4
		if (arg4 == 0x2D) {
    			arg0.field0_c = R3;
	    		R6 = 1;
		} else {
		    	// line 6
			    if (arg4 == 0x2B) {
				        R6 = 0;
			    }
		}
		// line 10
		if (arg4 == 0x30) {
				// line 12
				arg4 = arg0 + 1;
				do {
						arg0 = arg4;

						++arg3;
				} while (arg3 == 0x30);
		}
		// line 18 - 22 initialize some registers
		R12 = 0;
		R4 = 0;
		R5 = 0;
		R8 = 0xA;

		// all registers are set to R7 (it may be 0)
		// line 27 - 32 (some calculations are done)
		if (R7 == 9) {
			    // line 46
			    if (arg2 >= 0x80000000) {
                        return 0;
                } else {
                        // line 49
                        if (R6 != 0) {
                            // line 51 - 52 set some regs to zero
                        }
				        R4 = *arg2;
			    		return 1;
			    }
		}
