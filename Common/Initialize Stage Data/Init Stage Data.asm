################################################################################
# Address: 801c154c
# Playback: Include
################################################################################
.include "Common/Common.s"

#Initialize data
  li  r4,516
  branchl r12, Zero_AreaLength

Exit:
  cmplwi	r26, 0
