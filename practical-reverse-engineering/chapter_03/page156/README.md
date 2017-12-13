1. - [ ] After reading some online forums, you notice some people suggesting
		 that PsCreateSystemThread will create a thread in the context of the
		 calling process. In other words, they are suggesting that if you call 
		 PsCreateSystemThread in an IOCTL handler, the new thread will be in 
		 the context of the requesting user-mode application. Assess the
		 validity of this statement by writing a driver that calls 
		 PsCreateSystemThread in the IOCTL handler. Next, experiment with a
		 non-NULL ProcessHandle and determine if the context differs.


2. - [ ] Cross-reference as many calls to PsCreateSystemThread as possible in 
		 the kernel image. Determine whether any of them pass a non-NULL
		 ProcessHandle parameter. Explain the purpose of these routines. Repeat 
		 the exercise for as many functions as possible.
