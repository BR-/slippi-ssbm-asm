#To be inserted at 801a5b14
.include "../../Common/Common.s"

#Get all players inputs
  li  r3,4
  branchl r12,0x801a3680

#Check Inputs
  rlwinm. r0, r4, 0, 23, 23 #check A
  beq- LoadCSS
  rlwinm. r0, r4, 0, 22, 22 #check B
  bne- Runback
  rlwinm. r0, r4, 0, 21, 21 #check X
  bne RandomStage
  b LoadCSS

Runback:
  li r27,0x2 #reload match scene
  b exit

RandomStage:
  branchl r12,0x802599EC #get random stage ID

#convert SSS ID to internal stage ID
  load r4,0x803f06D0   #load stage ID table
  mulli	r3, r3, 28     #stage ID to offset
  add r4,r4,r3         #add to start of table
  lbz r3,0xB(r4)       #get internal stage ID

  load r4,0x8045AC64     #load VS match struct

  sth r3,0x2(r4)             #store stage half to struct

  li r27,0x2                  #reload match scene
  b exit

LoadCSS:
  li r27,0x0  #load CSS

exit:
Original:
  li	r29, 0
