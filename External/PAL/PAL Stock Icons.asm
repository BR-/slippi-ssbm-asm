#To be inserted at 802f9a28

#stock icon scale [float]
lis r0,0x3f59
ori r0,r0,0x999a
#store x scale
stw r0,0x2c(r29)
#store y scale
stw r0,0x30(r29)
#load stock icon height offset [float]
lis r0,0xc1b0
ori r0,r0,0x0000
