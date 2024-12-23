════════════════════════════════════════════════════════════════   SCREEN 000
Forth Blocks  Default Extension File              ( 080885 drc) 
                                                                
By default, if no blocks file is double.clicked, MacFORTH       
extends from this File.                                         
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 001
( macforth system load up )                       ( 010104 dws) 
find >event15                                                   
iftrue token.for >event15 event.table 30 + w!  ifend            
  ." Extending System..."       DECIMAL                         
   FIND APPLE.MENU                                              
      NOT IFTRUE INCLUDE" KERNEL EXTENSIONS" IFEND              
   APPLE.MENU    OPTIONS.MENU                                   
   FORTH DEFINITIONS  SET.FENCE                                 
   1000 MINIMUM.VOCAB  8192 MINIMUM.OBJECT                      
                                                                
1 2 +THRU                                                       
    5 load ( custom)                                            
   2048 MINIMUM.OBJECT                                          
                                                                
init.cursor  @INIT  ( obtain initials )                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 002
( SNAPSHOT & EXTENSION )  FORTH DEFINITIONS       ( 111385 glg) 
                                                                
 FIND EDIT.WINDOW                                               
     IFTRUE      4096 MINIMUM.OBJECT                            
       EDIT.WINDOW ADD.WINDOW  EDIT.WINDOW  RE.EDIT             
     OTHERWISE   INCLUDE" EDITOR BLOCKS"    IFEND               
                                                                
{ FIND FILE.MENU  NOT                                           
     IFTRUE  INCLUDE" FILE MENU" IFEND    FILE.MENU  }          
                                                                
{ FIND SELECT.MENU  NOT                                         
     IFTRUE  INCLUDE" SELECT MENU" IFEND    SELECT.MENU  }      
                                                                
  FIND ASSEMBLER         ( and Assembler Vocab )                
     IFTRUE  " ASSEMBLER" GET.VOCAB ' ASSEMBLER !               
             cr  ." Reconfiguring Assembler..."  IFEND          
════════════════════════════════════════════════════════════════   SCREEN 003
                                                  ( 090785 drc) 
 FIND HELP.MENU                                                 
     IFTRUE                                                     
      H.WINDOW ADD.WINDOW  H.WINDOW HIDE.WINDOW                 
      HW ADD.WINDOW  HELP.MENU   HW HIDE.WINDOW                 
     IFEND                                                      
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 004
                                                  ( 083085 drc) 
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 005
                                                  ( 010104 dws) 
                                                                
                                                                
: fb use" forth blocks" ;                                       
: cw use" chipwits" ;                                           
: ex use" extension" ;                                          
( : ed include" macforth3:editor blocks" ;  )                   
( : cc use" macforth3:chipwit create" ;    )                    
( : eb use" macforth3:editor blocks" ;   )                      
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 008
( Formatted DUMP of Memory )                      ( 030784 DFC) 
DECIMAL                                                         
  16 CONSTANT DUMP.WIDTH                                        
  VARIABLE  P-COUNT  ( count of 256 byte "pages"  )             
                                                                
: (RANGE) ( addr -- addr+dumpwidth\addr )                       
   DUMP.WIDTH  OVER  +  SWAP  ;                                 
                                                                
: HEADER  ( --- |  inserts header & pages as needed )           
    P-COUNT  @  1+  DUP  4  =  IF   0=  THEN  P-COUNT !         
    CR  5  SPACES  DUMP.WIDTH  0  DO  I  3  .R  LOOP  CR  ;     
                                                                
: ALPHA-FIELD ( addr --- | print all displayable  characters)   
     (RANGE)  DO  IC@  DUP  BL  <  IF DROP BL THEN EMIT         
              LOOP ;  -->                                       
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
(    Formatted DUMP of Memory, Continued )        ( 061083 DFC) 
: HEX-FIELD   (RANGE)  DO  IC@  <# # # BL HOLD #> TYPE  LOOP ;  
                                                                
: 1-LINE   ( addr -- | dump 1 line, insert header if needed )   
    DUP   255  AND  0=  IF  HEADER  THEN                        
    DUP    5  .R                                                
    DUP  HEX-FIELD  SPACE  SPACE  ALPHA-FIELD    CR  ;          
                                                                
: DUMP   ( start\end -- | dump memory between start and end )   
   get.textsize >r  9 textsize                                  
     CR  3  P-COUNT  ! 1+  SWAP  DUP 255 AND                    
    IF HEADER THEN                                              
    BASE @ >R HEX DO I 1-LINE DUMP.WIDTH +LOOP R> BASE !        
    r> textsize   ;                                             
: +DUMP   ( addr\cnt -- | dump cnt bytes starting at addr )     
    OVER +  DUMP  ;                                             
════════════════════════════════════════════════════════════════   SCREEN 010
( Block Copy Utilities )                                        
                                                                
: >>COPY  ( first\target\count -- | "forward copy" ) CR         
   0 DO GET.TEXTMODE >R  SRCCOPY TEXTMODE                       
         13 EMIT OVER . ." -> "  DUP .  R> TEXTMODE             
          OVER OVER   COPY    PAUSE  SWAP 1+ SWAP               
     1+ LOOP    DROP DROP  SAVE-BUFFERS  ;                      
                                                                
: <<COPY  ( first\target\count -- | "reverse copy" )  CR        
   DUP  >R +  SWAP  R>  DUP  >R  +  SWAP  R>  ( last scr's )    
   0 DO GET.TEXTMODE >R  SRCCOPY TEXTMODE                       
         13 EMIT SWAP 1- SWAP 1- OVER . ." ->"                  
         DUP .  R> TEXTMODE                                     
         OVER OVER    COPY PAUSE   SAVE-BUFFERS                 
      LOOP   DROP  DROP  ;                                      
1 +LOAD                                                         
════════════════════════════════════════════════════════════════   SCREEN 011
( ** Multiple Screen COPY Utility            ** ) ( 041084 DFC) 
                                                                
: CLEAR.BLOCKS ( first\last -- | clears specified blocks )      
    1+ SWAP  CR                                                 
    DO CR  I . ." Cleared "  I BLOCK 1024 BLANKS UPDATE         
    LOOP  SAVE-BUFFERS  ;                                       
                                                                
: COPY.BLOCKS  ( first\last\target -- | "normal copy" )         
    SWAP 3 PICK - 1+     ( convert to first\target\count )      
    >R  OVER OVER <  R> SWAP                                    
      IF  <<COPY   ELSE  >>COPY  THEN   ;                       
                                                                
 DECIMAL                                                        
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 012
( Block Transfer Between Files Routines )         ( 083085 drc) 
VARIABLE SRC-FILE        VARIABLE DEST-FILE                     
VARIABLE DEST-START      VARIABLE SRC-START   VARIABLE SRC-END  
                                                                
: ?ENTRY  ( addr -- )                                           
    5 ASK.NUMBER NOT ABORT"  Block Xfer Aborted!!" SWAP ! ;     
                                                                
: (XFER.BLOCKS)   ( --- )                                       
    FLUSH  GET.TEXTMODE >R  SRCCOPY TEXTMODE                    
    CR  SRC-END @ 1+  SRC-START @                               
     DO  FIRST  I SRC-FILE @  READ.FIXED  ?FILE.ERROR           
          13 EMIT  I .  ." ->"                                  
         FIRST DEST-START @ DEST-FILE @ WRITE.FIXED ?FILE.ERROR 
         DEST-START @ .   1 DEST-START +!                       
     LOOP  R>  TEXTMODE  ;                                      
 1 2 +THRU                                                      
════════════════════════════════════════════════════════════════   SCREEN 013
(   Block Transfer Primitives )                   ( 010785 DFC) 
: GET.XFER.INFO  ( --- )                                        
    CR ." Block Transfer Routine: "  CR                         
    CR ."  Source File Number ? "       SRC-FILE  ?ENTRY        
     SRC-FILE @  ?OPEN        NOT ABORT"  File Not Open!"       
     SRC-FILE @  ?BLOCKS.FILE NOT ABORT"  Non-Blocks File!"     
    CR ."  Destination File Number ? "  DEST-FILE ?ENTRY        
     DEST-FILE @  ?OPEN        NOT ABORT"  File Not Open!"      
     DEST-FILE @  ?BLOCKS.FILE NOT ABORT"  Non-Blocks File!"    
   CR CR ."   Source File Start Block # ? " SRC-START ?ENTRY    
      CR ."   Source File End   Block # ? " SRC-END   ?ENTRY    
   CR CR ."   Destination File Start Block # ? "                
                                         DEST-START ?ENTRY ;    
                                                                
: .FILE.NAME  ( file# -- | display file name in quotes )        
    34 EMIT  @FILE.NAME  COUNT  TYPE  34 EMIT   ;               
════════════════════════════════════════════════════════════════   SCREEN 014
(   XFER.BLOCKS )                                 ( 010785 DFC) 
: VERIFY.XFER.INFO  ( --- )                                     
    CR CR ."  Copying blocks "  SRC-START @       3 .R          
     ."  thru " SRC-END @  3 .R  ."  in " SRC-FILE @ .FILE.NAME 
    CR    ."       To blocks "  DEST-START @  DUP 3 .R          
     ."  thru "  SRC-END @  SRC-START @ -  +  3 .R              
     ."  in "    DEST-FILE @  .FILE.NAME                        
    CR ." Press Return to begin copying, space bar to abort."   
    KEY 13 = NOT ABORT"  Block Transfer Aborted!"   ;           
                                                                
: XFER.BLOCKS  ( --- )                                          
    GET.XFER.INFO  VERIFY.XFER.INFO   (XFER.BLOCKS)    ;        
                                                                
AXE SRC-FILE   AXE DEST-FILE  AXE DEST-START     AXE SRC-START  
AXE SRC-END    AXE ?ENTRY     AXE (XFER.BLOCKS)  AXE .FILE.NAME 
AXE GET.XFER.INFO             AXE VERIFY.XFER.INFO              
