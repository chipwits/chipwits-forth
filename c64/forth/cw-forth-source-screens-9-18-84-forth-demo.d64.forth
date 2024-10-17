

























( chipwits demo  9-18-84)               
forget it : it ;                        
2 6 thru   ( vars)                      
100 107 thru ( head sprites)            
108 115 thru ( feet sprites)            
116 120 thru ( obj sprites)             
10 40 thru                              
                                        


















 ( variables)                           
: var variable ; : is constant ;        
var robot.square                        
var robot.orientation                   
var robot.x var robot.y                 





















( room vars, room)                      
                                        
8 is sqs.wd@ 8 is sqs.hi@               
sqs.wd@ sqs.hi@ * is squ.cnt@           
squ.cnt@ 16 + is room.size@             
                                        
                                        
: t, 1 c, ; ( top)                      
: w, 2 c, ; ( wall)                     
: f, 3 c, ; ( floor)                    
create room.data(                       
                                        
t, w, w, t, w, w, w, t,                 
t, f, f, t, f, f, f, t,                 
t, f, f, w, f, f, f, t,                 
                                        
t, f, f, f, f, t, t, t,                 
t, f, f, f, f, t, w, t,                 
t, f, f, f, f, w, f, t,                 
t, f, t, f, f, f, f, t,                 
w, w, w, w, w, w, w, w,                 

16 allot ( door data)                   



( orientation constants)                
                                        
7 is w 6 is sw 5 is s 4 is se           
3 is e 2 is ne 1 is n 0 is nw           
















































( move.sound)                           
                                        
: move.sound ;                          











































































( char.copy)                            
                                        
: char.copy  ( bank# charbase# --)      
 ( see p134 mem map)                    
 56334 c@  254 and 56334 c!             
 1 c@  251 and 1 c!                     
 2dup                                   
 2048 * ( charbase)                     
 swap 16384 * + ( bottom of set)        
 256 0 do  ( characters)                
  8 0 do ( bytes/char)                  
    dup                                 
    j 8 * i + ( byte index)             
    dup >r                              
    53248 + c@    (  rom charset)       
    swap r> + c!  ( ram charset)        
  loop                                  
 loop drop                              
 1 c@ 4 or 1 c!                         
 56334 c@ 1 or 56334 c!                 
 charbase bank ;                        
                                        
                                        
                                        
                                        

( char.copy)                            
                                        
: char.copy  ( bank# charbase# --)      
 ( see p134 mem map)                    
 56334 c@  254 and 56334 c!             
 1 c@  251 and 1 c!                     
 2dup                                   
 2048 * ( charbase)                     
 swap 16384 * + ( bottom of set)        
 256 0 do  ( characters)                
  8 0 do ( bytes/char)                  
    dup                                 
    j 8 * i + ( byte index)             
    dup >r                              
    53248 + c@    (  rom charset)       
    swap r> + c!  ( ram charset)        
  loop                                  
 loop drop                              
 1 c@ 4 or 1 c!                         
 56334 c@ 1 or 56334 c!                 
 drop drop  ;                           
                                        
                                        
                                        
                                        

( head.init)                            
( initialize head sprite)               
hex : head.load ( ---)                  
    8000 head0 8040 head1               
    8080 head2 80c0 head3               
    8100 head4 8140 head5               
    8180 head6 81c0 head7               
; decimal                               
: s.head s4 ;                           
: head.init ( ---) head.load            
  s.head on s-multi ( multicolor)       
  med.gray s-color  ( 2)                
                                        
  off s-yexp off s-xexp                 
  0 s-pointer ;                         
                                        










( feet.init)                            
( initialize feet sprite)               
hex  : feet.load ( ---)                 
    8200 feet0 8240 feet1               
    8280 feet2 82c0 feet3               
    8300 feet4 8340 feet5               
    8380 feet6 83c0 feet7               
; decimal                               
: s.feet s3 ;                           
: feet.init ( ---) feet.load            
  s.feet on s-multi ( multicolor)       
  red s-color  ( 2)                     
                                        
  off s-yexp off s-xexp                 
  8 s-pointer ;                         
                                        










( obj.init)                             
hex : obj.load                          
    8800 pie.s                          
    8840 coffee.s                       
    8880 brick.s                        
    88c0 coffee2.s                      
; decimal                               
: obj.s  ( color pointer ---)           
  s-pointer s-color                     
  off s-yexp off s-xexp                 
  on s-multi ;                          
                                        
: obj.init ( ---) obj.load              
  s5 brown 32 obj.s ( pie)              
  s8 black 33 obj.s ( coffee)           
  s1 lt.red 34 obj.s ( brick)           
  s2 lt.red 34 obj.s ( brick)           
  s7 brown 32 obj.s ( pie)              
  s6 blue 35 obj.s ( blue cup)          
  ;                                     
































( b2.init  bank 2 initializer)          
( see p 48, 64 sound & graphics)        
                                        
: b2.init  ( ---)                       
  ( 56576 c@ 253 and 56576 c!)          
  1 16 * 4 + 53272 c!                   
  132 648 c! ( output to 132 * 356)     
  147 emit   ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        


                                        
                                        







( s.in   s.test cw.plop)                
 : s.in  (  s-pointer---)               
    dup s.head s-pointer                
    s.feet 8 + s-pointer ;              
                                        
 : s.test ( ---)                        
  3 0 do                                
   8 0 do i s.in 10 wait loop           
  loop ;                                
                                        
 : cw.plop ( ---)                       
   s.head 100 127 s-position            
   on s-enable                          
   s.feet 100 110 s-position            
   on s-enable ;                        











( color.test sprites.off)               
                                        
: color.test ( ---)                     
 0 0 d-position                         
 ."                 "          
 0 1 d-position                         
 ."                 "          
 ;                                      
                                        
 : sprites.off ( ---)                   
   s1 off s-enable                      
   s2 off s-enable                      
   s3 off s-enable                      
   s4 off s-enable                      
   s5 off s-enable                      
   s6 off s-enable                      
   s7 off s-enable                      
   s8 off s-enable ;                    








                                        
                                        
                                        
                                        























                                        
























( graph.init)                           
( setup graphics)                       
: graph.init ( ---)                     
                                        
 white 0 s-multir ( 1 color)            
 green 1 s-multir ( 3)                  
 2 4 char.copy                          
 head.init                              
 feet.init                              
 obj.init ;                             
                                        
                                        
                                        
                                        
                                        











( game stuff ,vars)                     
                                        
: $is $constant ;                       
$is f$ "P  "                   
                                        
$is w$ "▂▂✓  ▕"                 
                                        
                                        
$is t$ "▂▂✓▂▂✓"                  
                                        
$is r$ "          "              
$is r1$ "     "                   
                                        
                                        
                                        
: r$.? r$ $. r1$ $. ;                   










( draw.room)                            
                                        
: draw.room ( ---)                      
  room.data( 1-                         
  sqs.hi@ 0 do                          
   sqs.wd@ 0 do                         
   i 3 * 1 + j 2 * 5 + d-position       
   1+ dup c@                            
   case                                 
     1 of t$ $. ;;                      
     2 of w$ $. ;;                      
     3 of f$ $. ;;                      
   endcase                              
 loop loop drop ." " ;                 












( game.bk)                              
                                        
: game.bk ( ---)                        
  black bkgnd purple border             
  33832 960 160 fill                    
  ( fill screen inverse blanks)         
  55336 960 36 fill                     
  ( fill color mem w cyan)              
  ;                                     
                                        
                                        















 ( game.wndw stat.wndws)                
: game.wndw ( ---)                      
  0 2 d-position                        
  ."                           "      
  0 3 d-position                        
  ."  ====== greedville ====== "        
  0 4 d-position                        
  ."                           "        
  1 5 d-position                        
  ."                          "       
  0 5 d-position                        
  16 0 do ."   " loop              
  24 5 d-position                       
  16 0 do ."   " loop              
  0 21 d-position                       
  ."                           "       
  1 22 d-position                       
  ." ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▘"     
  26 3 d-position                       
  19 0 do ." ▌" loop                  
  ;                                     































( score.wndw)                           
                                        
: score.wndw ( ---)                     
27 2 d-position                         
." "                                  
27 2 d-position                         
." cycles score"                        
27 3 d-position                         
."  1291   170 ▌"                     
28 4 d-position                         
." ▄▄▄▄▄▄▄▄▄▄▄▘"                     
;                                       














 ( status.wndw)                         
                                        
: status.wndw ( ---)                    
 27 5 d-position                        
 ."    status   "                     
 27 6 d-position                        
 6 0 do                                 
  27 6 i + d-position                   
 ."             ▌"               
 loop                                   
 27 12 d-position                       
 ."             ▌"                  
 28 13 d-position                       
 ." ▄▄▄▄▄▄▄▄▄▄▄▘"                    
 28 6 d-position                        
 ." "  r$.?                            
 33 6 d-position                        
 ." "  r$.?                            
 28 9 d-position                        
 ." "  r$.?                            
 33 9 d-position                        
 ." "  r$.? ;                          




 ( memory.wndw)                         
                                        
: memory.wndw ( ---)                    
 27 14 d-position                       
 ."    memory   "                     
 27 15 d-position                       
 6 0 do                                 
  27 15 i + d-position                  
 ."             ▌"               
 loop                                   
 27 21 d-position                       
 ."             ▌"                  
 28 22 d-position                       
 ." ▄▄▄▄▄▄▄▄▄▄▄▘"                    
 28 15 d-position                       
 ." "  r$.?                            
 28 18 d-position                       
 r$.?                                   
 33 15 d-position                       
 ." " r$.?                             
 33 18 d-position                       
 r$.? ;                                 




( s.square.xy obj.put)                  
: s.square.xy ( sq# ---x/y)             
  dup 8 mod 24 * 7 + 24 + ( x)          
  swap 8 / 16 * 40 + 50 + ( y) ;        
 ( see p 140 c64 prog ref)              
                                        
: room.put ( obj# sq# ---)              
  room.data( + c! ;                     
                                        
: obj.put ( ---)                        
  50 s.square.xy s1 s-position          
  on s-enable  ( brick)                 
  29 s.square.xy s2 s-position          
  on s-enable ( brick)                  
  34 s.square.xy s6 s-position          
  on s-enable   1 22 room.put           
  22 s.square.xy s5 s-position          
  on s-enable ( coffee)                 
  1 34 room.put                         
  34 s.square.xy s8 s-position          
  on s-enable                           
  1 12 room.put                         
  12 s.square.xy s7 s-position          
  on s-enable ;                         
                                        

( game.init)                            
                                        
: game.init ( ---)                      
 0 0 d-position                         
 ."  options  game  workshop  "       
 ."                "                    
  game.bk                               
  game.wndw                             
  draw.room                             
  score.wndw                            
  status.wndw                           
  memory.wndw                           
  obj.put ;                             













(  cw.square.put)                       
                                        
: cw.position ( x/y ---)                
  2dup 16 -                             
  s.head s-position on s-enable         
  s.feet s-position on s-enable ;       

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        










( cw.square.put)                        
                                        
: cw.square.put ( sq# ---)              
  s.square.xy                           
  2dup robot.y !                        
  robot.x !                             
  cw.position ;                         

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        










( square.object next.square)            
                                        
: square.object ( sq# ---obj#)          
  room.data( + c@ ;                     
                                        
: next.square ( orient/sq--nextsq#)     
 swap                                   
 case n of 8 - ;; e of 1 + ;;           
      s of 8 + ;; w of 1 - ;;           
      ne of 7 - ;;                      
      se of 9 + ;;                      
      sw of 7 + ;;                      
      nw of 9 - ;;                      
 endcase ;                              






































 ( slide)                               
                                        
                                        
 : slide ( x/ydeltas---)                
   8 0 do 2dup                          
                                        
   robot.y @ + dup robot.y !            
   swap robot.x @ + dup robot.x !       
   swap                                 
   cw.position                          
    move.sound 1 wait                   
   loop drop drop ;                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        


 ( cw.slide)                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
 : cw.slide ( ---)                      
   robot.orientation @                  
   case n of 0 -2 slide ;;              
        ne of 3 -2 slide ;;             
        e of 3 0 slide ;;               
        se of 3 2 slide ;;              
        s of 0 2 slide ;;               
        sw of -3 2 slide ;;             
        w of -3 0 slide ;;              
        nw of -3 -2 slide ;;            
   endcase                              
   ;                                    


( cw.turn)                              
                                        
: cw.turn ( ---)                        
  robot.orientation @                   
  osc3@ 2 mod ( pseudornd)              
  case 0 of 1 + ;;                      
       1 of 1 - ;;                      
  endcase                               
  dup 7 > if drop 0 then                
  dup 0 < if drop 7 then                
  dup s.in 5 wait                       
  robot.orientation ! ;                 














( cw.init)                              
                                        
: cw.init                               
  9 robot.square !                      
  9 cw.square.put                       
  sw robot.orientation !                
  sw s.in                               
  s.head on s-enable                    
  s.feet on s-enable ;                  

















( cw.chug)                              
                                        
: cw.chug ( ---)                        
  begin                                 
    robot.orientation @                 
    robot.square @                      
    next.square dup square.object       
    3 = if  ( floor)                    
      cw.slide                          
      robot.square !                    
      rdtim drop 10 mod                 
      1 < if cw.turn  then              
    else                                
      drop cw.turn                      
    then                                
  again ;                               










( cw.demo)                              
: cw.demo ( ---)                        
 ."    chipwits demo by interacti"     
 ." ve arts."                           
  graph.init                            
  b2.init                               
  game.init                             
  2 bank                                
  cw.init                               
  sound.init                            
  v3 noise v-ctrl 65535 v-freq          
  ( set up for random numbers)          
  ( see p 103 c64 forth manual)         
  cw.chug ;                             
















































































































































































































































































































































































































































































































































































































































































































































▝▒".!

lnB
┤:mt┤:mt$9
nB
%o
f├nB
"┐""$▎+tlXhhh".!Sq+a*9
fpsWPlG hfbasE▄l▗lfreseT└lB
finiT▃lB
E▄lB
VmB
"▒SV:l$l┘9sfN.mB
"SboundSlwG  notE[wB
"%69next-pointeRKwB
/▒9
D┬5Rw9drawlinE▍wB
point▚UwB
"▒▒>S*"▒▒>S/T$
oinT┐wB

JSDL£
fXH
tablEWjB
8┌├jB
H$/▌

4D▎4D▎4─▒││9ellipsE▗tB
▏┤
'"D"%G$"!;k"'"%*"
D"%▎4G$▒│││9circlE
uB
tt"D"kI%I%I%u9+90deG
deG0v▒directionS=vG▒▒▒▒r*9d
iNFhB
R
$G$"
$

hB
"▖2sX1arraY£sB

&D
$$$K┬▒▃ X*"?W9strinG▝sB
 b
 tplay.notEtB
6s37$tD379v-defaulT(
4QfB
<f97fB
fB
f912fB
gB
X:gB
"0"!"!b
519s▎WqB
sqB
"k519trianglEJqsawtootH┼q!
pulsEqanoisE▃qrinGrrese
TrsynCrfilt┴(rfilt┬3r
filt┤?rfilteXkrlowpj4XA4
iqp4▌4" " ▎49directions-iniTcyB
hwDwv/" *0/"!D"!R
$9csound-iniTUyB
7$r37r37X"▒79curve-iniT▍yB
w1y6sGw1qy!yCy9c-curvE└yB
call-rdragoNzB
x
rscalEMoB
oB


Mz&Lm9fnegatE pB

"@l$l┘9@exponenTvmB
"▒S"tm
!exponenTmB
"l┘*/"▒S/
l┘$"▒S$4m£m9<roT─mB
nB
▌
;w1R

irectioNxB

sprites-iniT▌xB
O5s59hi-res-iniTyB
"z;k9d2OkB
0t
k
k┼%▒/▌
T▒92's-biTkB
k/▌
k┼%▒
I%b
k┼%,
's-biTWkB
k"┼%;
┤I%9sqrTlB
l92roo▒▒▒▒drago
n┴jv▄sA─▌─┴ ▃▒▒▒▘?? 
?<X┌ ─P88P*dragon┬Yv▄
s── ▒▒ ▒┌▒▒▝│▘▒
┌> ──P8PtPx-neWDvGvay-n
eWwGotx-inCwGnty-inC'wGrilengtH3
wG  dir-indX?wG  in-
$┤
"
coMbiB
tablEFiB
sintableA┬ij[H2 B C  !!T!*"│"N"
#G#▂#▍#8$X$▍$▂$'%[%
%▖%▕%&5&x&X&&▂&E&
Y&&&''''stB
t1X"▒79s.disTztG ll.disTtGce
acCtGe b-linE▄tB
*4D▒9
I%I%I%I%z&*"&
4Dt1$XtDtD$tD▒t1tDX
0tDt$tD▌
▒>g9MHgB

WgB
9P┌gB
/Lg▒eW9sMhB
I%jg%1L)19giNfGe gin├£hB
R
asSRrnotcHrnote-valueSrG
▒✓┤▗┘┤H▒T▌┐.┘note─rB
3ofFDrv┴XrB
9v┤┬rB
sEstruE#sjoy┴/sjoy┬:s
uporTes│color-meMp
▌o
x
✓ygz9wait-5-seCzB
▒9demO▂zB
9
↑q"v"@NvXV5Kp.6sO5s59hi-res-
iniTyB
XPpB
whitE pbrowN└preD▃plt.
reDEpcyaNOpgray┴ppurplE▕
pgray┬┤pgreeNqlt.greeNq

gray┤@qs┴mqB
.S
9B
!DX┴[
.indeX▌9B
[
stack9bmovE(:B
9copYh:B
z&z&b
7B
1"1"1X6D"XJX619
sound.iniTH7B
rwsecT(8B
>
writedsTM8B
G$"▒Saa
addressing▒g@▒@▒Kg@▒"S
g@▒"S"└
b─Nand▗bOb Ncmp▗cOb─Neor▗cOb@N
lda▗cOb Nora▗'cObNsbc▗3cOb Nsta
▗?cObLasl▗kcOb
b▌lsr▗OcOba
multI5B
5D┘9s-poSJ5B
"Pk5Dn.."Pk5DD
"'Pk5D┘9
s-s-collisioN$6B

s-b-collisioN>6B
ER6Gidsid▌6B
g@19x@B
├@B
@[
"S┤
0/✓▒G$b
KN@9brk▗iawaclc▗Bawacld▗Lawa▒cl
i▗VawaxeNS3B
┘9bitmaP▄3B
sEI3B
3B
b-graphicS"4B
"@z&J9b-coloRx4B
-filLO4B
92─>B
P >B
aPM>B
?9emptY▖>B
0W9erasE?B
B
9C['│Q?B
"o
9applicatioN▔1B

!/✓$"D*/▒"Sb
swapouT▗1B
─2B
┌▒$"r*"X0/"!▒/" └
"▒>$
£▒$I%19'titlE4<G=titlE▖<B
"r*Rsuper-forth 64 version 1.1.0
9triaD=B
0"!$"
it7▘==B
noT┼dB
>┘EdvSNdpagain▗WdB
while▗ dB
t9
10*R
epth change9entercodE
0"!G$S:b
&9d└├:B
V:9d▘▒:B
nstanT:B
R;B
│9dmiNj;B
t"I%I%"calcnexT8B
G$G$*▒/
z&z&*9
"D+*$z&G$▒9copysdisK8B
8Rinsert source diskF!$W8Rinse
rt dest diskF!$808D
.sLQ9B
cOb!
cpy▗├cOb─ldx▗cOb▄ldy▗CcOb s
ty▗OcObjsr▗┼cObjmp▗▕cOb@bit▗┤
cOb begin▗▒cB
I%K▄ b
;dB
lse▗odB
69sid─6B
X▖69v-pWV6B
"▖69v-sR7B
▖69f-freQ*7B
resfilT=7B
69paddle─T7B
clv▗awadex▗awaJdey▗awainx▗awa
iny▗awaHnop▗┬awapha▗▝awahphp▗Fawa
pla▗PawaHplp▗Zawa(rti▗▁awa@rts▗┐aw
a─sec▗▃awa8sed▗bwasei▗
atay▗!bwatsx▗+bwa✓txa▗5bwatxs▗?bw
atya▗ibwam/cpUsbB
"S
peN┐4Gasb-erasE4B
9
*"SG$"S33─4D*z&"S
"*▒n..9spritE├4G ss-fseTb5B
5Dn..9s-enablEo5B

bleR?▒ 0e xsavE W▔?uaP▂?
▘iP?▖NA?poPJ?poptwOR?
puT?pusH?nexT┤?set
upN▘?OindeX@G
,modE@G.A@@B
@B
19,YX
B
▒"S"-"┐"9'screeN▌2B
"┌S"┐"29'bitmaP3B
S"┐"29'charbasE)3B
"┐"29banKm3B
│▒"▝S$"│┘9scre
"Sj9id┐=B
"l19vleN=G(vtaBE=G
P=B
└
/┤▘;$
*0$R
▒▒*$92▌n>B
▄ /
liN▕eB
e/%1L)D└b,9pPeB
FeditoR▖e▒ /h▌?C B
E#fB
f92wfB
dvariablE▒;B
"X0▘▒
;B
. error0"!✓9▘;
XDt┌ 0/"!/X"[
X0/"!▒"┌▒$a*/""X
0/"!┤$I$▍h▍lpaD─$B
pagEQ$B
cK▎$B
9preV%G▝JquerY5%B
quiT@%B
k
r/W%B
DlooP▃"B
"▎l▃"6▃lm▏"B
m*▂▒"B
+z&I%+z&X▝┼%D+z&z&I%D+*$*z& 9m├
#B
*I%a*9m/moDQ#B
maX#B
┼┬-B
found$9│V-B
*0"!▎+"!─"
││9masK3.B
9sbiTx.B
S+9fbiT.B
 ▒lherE▘ B
hlD O,fholD▝ B
%i▕!+!✓┘h┘▒lBiF$!B
[
init-fortHG!init-useRT!inter
preT!B
Y├!B
*66&8▍▍▍▍h▏H66
FPlu▝▝+B

$<%D19usE9,G ┐useRx,B
▘hE▒lvariablEB,B
,O,vocabularY,B
▒┴E┌┤▍┴P▍UP▍UP
Plh▍HP▒HEPMlexecu
tE▂%▍▍lexiT;H▖H▝lex
pecT2B

X9firsT ┐flasTGLflD▕O,dfo
rgeT┤B
▝ 2dvGXsigN)B
!9smudgE▏)B
sp┌*O,sp─!*2*hlspacE**B
spaceS9*B
*T*▍l3*statEJ*O,psysdeV┼*GswaP
**▍h▍▍▎ltexT*B
*▒
hlhlHdliteraL▄B
▕"9dnegatE;8▍▍lk$BdO/B
▄ "9Edoes▘iB
▏IE8HHlB
*I┌ K' ┤' C▒▒ldPO,dpL✓O,b
dr┌BB
 ┘▒ ─▒ ┤'─ ┤'▒(─▄ F▒ O▒I0┌ P O▒ 
R▒I
▒
8
▃F
I:m▏
0l─
 ┴
I£P─ R▒▒
P┬▒
le(s->D▌&B
P l( ✓▒└r)▄s ) ┘▒▁▒ X▒▒l
sySI(└( Ol▁▒▏
 ( coffee obj)                          
 4 base !                               
                                        
 0000 0000 0000                         
 1111 1111 1110                         
 1111 1111 1110                         
 1113 3311 1110                         
 1133 3331 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
                                        
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110 decimal                 
                                        
 obj.stuff                              
                                        
 create pie$ obj$,                      


#9latesT─!B
┘▒llfA▔!B
OlisT"B

L)D
▝┴▖▒▖P▒▝lGliteraL"B
loaD"B
,B

 
D▄ ▒/t▒▄ ┼%b
%X0"↑A▒9widtHU,O,worD-B
#9─-B
I%$9DZ┤
knot in current vocabulary$↑$/←D,
kin protected dictionaryt┼%2D,
 ┼%D,
,1/"▒✓$"D/┼%,

"▘D"!"0W" R
▍▍b
DtheN▗*B
calC┬*B
versE+B
#+B
uj+▒+▍▍ 666▏U▏
UUP lu┐W+B
X$19dr┴KB
9dr┤├B
P&lduP1▍h▍lDelsE)B
▄ X*[
empty
-bufferSzB
X"!"1"▒▒9enclosEK▖ O
8FVHP
 h▒Hl
s┌▏(B
+$▒9save-fortH(B
/
amE)Gsuper-forth 64     scRe)O,nsec
/blKF)Gset-drXO)B
G▒▒*?tI▒┘R▕▝-neWV0
B
-appenD├0B

f-savE1B

9
f-numbeG  ┘▒ ─▒ ▕'┌qF▏E▏E▒h▏
)8▃)▃)HE▏▒l│& I' L▒FF
F▏)8▃)▃)FFP┼ C▒ C▒ L▒▒
lI▍▎JJ0HH0
m▍▍
▍I ▎─▏)  $(▏  $(▏ 
'┌ ├'─▄ I▒▄]  ?( ┐▒ ▖'▄ I▒▄l  ?( L▒
 ▕'─▄ F▒  ▁▒HP─▄ I

.▃z!f[2┼jLdF<▚QHCu
1:4 0 03 14
HDP▍ ─lJJH ┴▖┴▖▏▖I
▖▒▝l ebs# ▒▒▒▒▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒K▒▒
▒▒▒▒▒▒▒▒no. error+"&$9
<t&scalc▘IB
"#D
*)▒
X▄ 1
>kinput > 255b
B
P#▒JJJJIE E┴hl┌H
┴▖H┴H┴P▍▒hl<interpret▘Q
B
Db
R! F▒ ▁▒I┌▃▒l3*<line▘B
9<load▘▁B
tXl1
$kuse only when loading9?pairS┴B
kconditionals not paired9?stacKB
*W(*,kempty stack0*W("U▒,kfull
 stack9?streaMgB
usted9?terminaLB
P▌laborT─B
l┐┴▏┌FFF ▒l┐l<?termin
al▘G ▁▒▒l3*<abort▘B
<abort"▘(B
▒b
▒D
D

bpdrV▏brancH┴▖E▖hH┴▖E▝▝H▖
lbuffeRB
↑,D/D"▒2T$($DSkbuffers full/t
t
%1┼%<%1I%R
▍lc▗B
PHl0▘┐B
▏▖I▖▒▝ll┴
1└=

ndarD
▝h▏▖h▏I▖E▝lA▖▒
W
1"▝$1$"▕"┐"ARh       
   super-forth 64 v1.1.1
3 by elliot b. schneider
Q!D"
 1▒29compilEB
D9configurEB
? F!/"1▒/",T$k
▁B
+▌&▌UP▌Ul+└B
h$9+buF<B
▒9E+looPmB
 1"E9└8▍▍▍U▍U
l-finD▄B
X0o

"▒S"┘2
b
▏IhElcsP▁O,>currenTSO,@d▌
▍P▍P▍P▍l
d├▘▍U▍U▍U▍U▒▒▒
▒▒O▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▌▌3▍P▍l▔-B
"G$└
W$G$▒9#bufFN#SB
A▕B
'?terminaL─O,'aborTLO,'blocKO,
'cROXR
└" D▄ ,D,1▃ XR
┘┴B
▍h▍hl▚oB
k
Rdrives9?csPB
on not finished9?duP┴
P1▌!I%l1I%P19<loop▘┘✓▘P
▘┘┘┘┘▒HHHHl$
▘▒B
▒>
XH1?/▒>knot recognized$I%
99<page▘1A R▒l<r/w▘B
>G$▌$k
▒""2
G$▒""2T$
E9abS▒B
5B
]U▍5h▍5lbasEMO,8EbegiNB
▄ 9
B
B
▘M✓ Ol
┐!
it▘)l┐▘$ I▒▒▍ R▒┐jOl<expect▘aB

X"!b
FHP▒DP▍F┴l<find▘ O 
┴q)?P-@c─W▌lcatniB▌▝▍
lcfA┴B
▒"▏1┼9chariNa┐R! F▒ O▒▒
l3*cleaR6B
qB
▏)▘@
▃▒▒ ▃✓▒
▖▒▘▒
▒▒


▏└▘└▒▃▘
▍▍piHl<▔
oop▘!▍▒hh▍▘✓│H│H┘
┘┘┘l"l<-find▘B
9<."▘qB
▍▒h▍▘✓│H│l<;code▘
B
E▏E┌┴out of range*Ab
#1QR
▃ ┴hH┴lcontexTO,<converT(B
b
Db
▒9cRB
▒X2kattempted to redefine n


$▒""2T$
*D
.linEB
H*$9E/looPB
D▏B
0┘▍ld+└B
a*9d.R▗B
G$/ z&▗)SI%G$▒r*q+9d▝▖B

B
h▍ldecimaLB
SB






























































































































































































































































































( sprites -- head0)                     
4 base !                                
s-def head0                             
0000 0000 0000                          
0222 2220 0000                          
0122 2222 0000                          
0112 2222 2000                          
0311 2222 2200                          
0131 2111 1110                          
0111 2111 1110                          
1111 2111 1110                          
2111 2222 2220                          
1211 2111 1110                          
1121 2111 1110                          
0112 2111 1112                          
0111 2111 1112                          
0011 2111 1112                          
0002 1111 1110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
decimal                                 
                        
( sprites -- head1)                     
4 base !                                
s-def head1                             
0000 0000 0000                          
0022 2222 2200                          
0022 2222 2200                          
0022 2222 2200                          
0022 2222 2200                          
0011 1111 1100                          
0011 1111 1100                          
0011 1111 1100                          
0222 2222 2220                          
0211 1111 1120                          
0211 1111 1120                          
0211 1111 1120                          
0011 1111 1100                          
0011 1111 1100                          
0022 2002 2200                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
decimal                                 
                        
( sprites -- head2)                     
4 base !                                
s-def head2                             
0000 0000 0000                          
0000 0222 2220                          
0000 2222 2210                          
0002 2222 2110                          
0022 2222 1130                          
0111 1112 1310                          
0111 1113 1110                          
0111 1112 1111                          
0222 2222 1112                          
0111 1112 1121                          
0111 1111 2211                          
2111 1112 1110                          
2111 1112 1110                          
2111 1112 1100                          
0111 1111 2000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
decimal                                 
                        
( sprites -- head3)                     
4 base !                                
s-def head3                             
0000 0000 0000                          
0002 2222 2200                          
0222 2222 2100                          
1111 1121 1100                          
1111 1121 1330                          
1113 3333 3330                          
1131 1123 3330                          
1111 1123 3100                          
1111 1121 1110                          
0111 1112 1111                          
0111 1111 2112                          
0222 1112 2221                          
1111 2221 2111                          
1221 1111 2110                          
1111 1112 1000                          
1111 2220 0000                          
0222 2220 0000                          
0211 2110 0000                          
0211 2110 0000                          
0211 2110 0000                          
0211 2110 0000                          
decimal                                 
                        
( sprites -- head4)                     
4 base !                                
s-def head4                             
0000 0000 0000                          
0222 2222 0000                          
0122 2222 2000                          
0112 2222 2200                          
0112 1111 1110                          
0312 1111 1110                          
0133 3333 3330                          
0113 3333 3330                          
0112 3331 3330                          
2212 1111 1110                          
1121 1111 1111                          
1112 1111 1112                          
1111 2222 2221                          
0211 1111 1110                          
0221 2111 1110                          
0222 0222 0000                          
0212 0222 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
decimal                                 
                        
( sprites -- head5)                     
4 base !                                
s-def head5                             
0000 0000 0000                          
0022 2222 2200                          
0022 2222 2200                          
0022 2222 2200                          
0011 1111 1100                          
0011 1111 1100                          
0033 3333 3300                          
0033 3113 3300                          
0233 3113 3320                          
0211 1111 1120                          
0211 1111 1120                          
0221 1111 1220                          
0212 2222 2120                          
0011 1111 1100                          
0011 1111 1100                          
0022 2002 2200                          
0022 2002 2200                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
decimal                                 
                        
( sprites -- head6)                     
4 base !                                
s-def head6                             
0000 0000 0000                          
0000 2222 2220                          
0002 2222 2210                          
0022 2222 2110                          
0111 1111 1110                          
0111 1111 2130                          
0333 3333 3310                          
0333 3333 3110                          
0333 1333 2110                          
0111 1111 2122                          
1111 1111 1211                          
2111 1112 2111                          
1222 2222 1111                          
0111 1111 1120                          
0111 1112 1220                          
0000 2220 2220                          
0000 2220 2120                          
0000 1120 1120                          
0000 1120 1120                          
0000 1120 1120                          
0000 1120 1120                          
decimal                                 
                        
( sprites -- head7)                     
4 base !                                
s-def head7                             
0000 0000 0000                          
0022 2222 2000                          
0012 2222 2220                          
0011 1211 1111                          
0331 1211 1111                          
0333 3333 3111                          
0333 3211 1311                          
0013 3211 1111                          
0111 1211 1111                          
1111 2111 1110                          
2112 1111 1110                          
1222 2111 2220                          
1112 1222 1111                          
0112 1111 1221                          
0001 2111 1111                          
0000 0222 1111                          
0000 0222 2220                          
0000 0211 2110                          
0000 0211 2110                          
0000 0211 2110                          
0000 0211 2110                          
decimal                                 
                        
( sprites -- feet0)                     
4 base !                                
s-def feet0                             
0000 2000 2000                          
0000 2220 2220                          
0000 2220 2220                          
0110 1220 1220                          
1122 1222 1220                          
1222 2222 2220                          
0222 2222 2220                          
0122 2222 2220                          
0112 2222 2220                          
0110 2220 2220                          
0000 1220 1220                          
0000 1100 1100                          
0000 1100 1100                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet1)                     
4 base !                                
s-def feet1                             
0020 2002 0200                          
0022 2002 2200                          
0022 2002 2200                          
0022 2002 2100                          
0012 2002 2100                          
0012 2012 2210                          
0122 2112 2210                          
0122 2112 2210                          
0122 2102 2200                          
0022 2012 2210                          
0122 2112 2210                          
0122 2111 0110                          
0110 1100 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet2)                     
4 base !                                
s-def feet2                             
0002 0002 0000                          
0222 0222 0000                          
0222 0222 0000                          
0221 0221 0110                          
0221 2221 2211                          
0222 2222 2221                          
0222 2222 2220                          
0222 2222 2210                          
0222 2222 2110                          
0222 0222 0110                          
0221 0221 0000                          
0011 0011 0000                          
0011 0011 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet3)                     
4 base !                                
s-def feet3                             
0000 0020 0000                          
0002 2220 0000                          
0222 2220 0000                          
0222 2120 0000                          
0212 2120 0000                          
0212 2220 0000                          
0222 2222 2110                          
0222 2221 2211                          
0222 2221 1211                          
0222 2221 1222                          
0222 2222 2110                          
0111 0111 1110                          
0111 0111 0100                          
0010 0010 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet4)                     
4 base !                                
s-def feet4                             
0200 0200 0000                          
0222 0222 0000                          
0222 0222 0000                          
0122 0122 0000                          
0122 0122 0000                          
0222 2222 0000                          
0222 2222 2000                          
0122 2211 2110                          
0112 2111 1111                          
0110 2111 1111                          
0000 1222 2222                          
0000 1100 1100                          
0000 1100 1100                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet5)                     
4 base !                                
s-def feet5                             
0020 2002 0200                          
0022 2002 2200                          
0022 2002 2200                          
0022 2002 2200                          
0012 2002 2100                          
0012 2002 2100                          
0122 2112 2210                          
0122 2112 2210                          
0122 2112 2210                          
0021 2002 1200                          
0111 1111 1110                          
0122 2112 2210                          
0110 1111 0010                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet6)                     
4 base !                                
s-def feet6                             
0000 0020 0020                          
0000 2220 2220                          
0000 2220 2220                          
0000 2210 2210                          
0000 2210 2210                          
0000 2222 2220                          
0002 2222 2220                          
0112 1122 2210                          
1111 1112 2110                          
1111 1112 0110                          
2222 2221 0000                          
0011 0011 0000                          
0011 0011 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet7)                     
4 base !                                
s-def feet7                             
0000 0200 0000                          
0000 0222 2000                          
0000 0222 2220                          
0000 0212 2220                          
0000 0212 2120                          
0000 0222 2120                          
0112 2222 2220                          
1122 1222 2220                          
1121 1222 2220                          
2221 1222 2220                          
0112 2222 2220                          
0111 1110 1110                          
0010 1110 1110                          
0000 0100 0100                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( pie.s)                                
4 base !                                
s-def pie.s                             
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0022 0000                          
0000 0022 2000                          
0000 0212 2200                          
0000 2221 2220                          
0002 2222 1222                          
0222 2222 2122                          
2222 2222 2212                          
0111 3113 1112                          
0131 1111 1312                          
0311 1311 3112                          
2222 2222 2222                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( coffee.s)                             
4 base !                                
s-def coffee.s                          
0000 0000 0000                          
0000 0100 1000                          
0000 1001 0000                          
0000 1001 0000                          
0000 0000 0000                          
0003 3330 0000                          
0033 2233 0000                          
0332 2223 3000                          
0332 2223 3330                          
0333 3333 3033                          
0333 3313 3033                          
0333 3313 3033                          
0333 3313 3330                          
0333 3313 3000                          
0033 3333 0000                          
0003 3330 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( brick.s)                              
4 base !                                
s-def brick.s                           
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( coffee2.s)                            
4 base !                                
s-def coffee2.s                         
0000 0000 0000                          
0000 0100 1000                          
0000 1001 0000                          
0000 1001 0000                          
0000 0000 0000                          
0002 2220 0000                          
0022 0022 0000                          
0220 0002 2000                          
0220 0002 2220                          
0222 2222 2022                          
0222 2212 2022                          
0222 2212 2022                          
0222 2212 2220                          
0222 2212 2000                          
0022 2222 0000                          
0002 2220 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































( editor patches)                       
                        : se dup r# ! pp
 quit ;                                 
        : 16) 16 se ; : 17) 17 se ;     
                                : 18) 18
 se ; : 19) 19 se ;                     
                : 20) 20 se ; : 21) 21 s
e ;                                     
: 22) 22 se ; : 23) 23 se ;             
                        : 24) 24 se ; : 
25) 25 se ;                             
                                        
                                : s-c/l 
40 ' c/l ! ;                            
                : n-c/l 64 ' c/l ! ;    
                                        










( printer opener)                       
." 4 close --- turns off printer."      
4 4 3 " 0" open                         
4 cmd                                   
                                        




































































































































































































































