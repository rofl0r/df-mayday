import text/Opts
import structs/ArrayList
import text/StringTokenizer
import BufferFile
import nconv

charok := "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890[]{}():\0" 
charOk?: func(c:Char) -> Bool { charok contains?(c) }
debugbuf: func(b:Buffer) {
	ob := Buffer new()
	for (i in 0 .. b size) ob append("\\x" + numberToString(b[i] as UInt64, 16, 2, true))
	"ptr: %p, size: %d, buf: %s" format(b, b size, ob data) println()
}


main: func( args: ArrayList<String>) {
	opts := Opts new(args)
	oldchars := Buffer new()	
	newchars := Buffer new()
	if(!opts set?("new")) {
		assert(oldchars fromFile("oldchars"))
		assert(newchars fromFile("newchars"))
	}
	debugbuf(newchars)
	if (opts args size < 2 ) exit(1)
	x := Buffer new() 
	x fromFile(opts args get(0))
	org := x toString() split('\n')
	y := Buffer new()
	y fromFile(opts args get(1))
	dfg := y toString() split('\n')
	for (lineno in 0..org size) {
		orgline := org get(lineno)
		dfgline := dfg get(lineno)
		found := false
		for (i in 0..orgline size) {
			if (orgline[i] != dfgline[i]) {
				if (!charOk?(orgline[i])) {
					if (!oldchars contains?(orgline[i])) {
						oldchars append(orgline[i])
						newchars append(dfgline[i])
					}
//					s := numberToString(orgline[i] as UInt64,16,2) + '=' + numberToString(dfgline[i] as UInt64,16,2)
//					s println()
					found = true	
					break	
				} else break
			}		
		}
//		if (found) orgline println()
//		if (found) dfgline println()
	}
	
	("oldchars: " + oldchars toString()) println()
	("newchars: " + newchars toString()) println()	
	if (newchars contains?('\0')) "something went wrong" println()
	debugbuf(oldchars)	
	debugbuf(newchars)
	assert(oldchars toFile("oldchars"))
	assert(newchars toFile("newchars"))
	
}