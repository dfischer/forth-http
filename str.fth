\ string utils

\ copy string constant to string variable
: place$ over over >r >r char+ swap chars cmove r> r> c! ;

\ append two strings
: append$ ( addr1 n2 addr2 -- )
    over over >r >r
    count chars +
    swap chars move
    r> r> dup >r
    c@ + r> c!
;

\ copy string variable to another string variable
: copy$ ( addr1 addr2 -- ) swap dup count 1+ swap drop rot swap cmove ;

\ print string
: print$ ( addr -- ) count type ;

\ get length of string
: length$ ( addr -- ) count swap drop ;

\ check if two strings are equal
: eq$ ( addr1 len1 addr2 len2 -- ? ) compare 0= ;

\ check if two string are not equal
: neq$ ( addr1 len1 addr2 len2 -- ? ) compare 0<> ;

\ convert string to uppercase
: upper$ ( addr -- ) dup length$ over + swap do i c@ toupper i c! loop dup ;

\ skip leading space characters
: -leading ( addr len -- addr' len' ) bl skip ;

\ fetch substring after c
: after$ ( addr u c -- addr' u' ) scan 1- swap 1+ swap ;

\ strip character from string
: -strip ( addr u c -- addr u' )
    swap 0 do
        2dup swap I + c@ = if
            drop I leave
        then
    loop
;
