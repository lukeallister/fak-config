# 20240729 Luke Miller
# This is a wired split (only one microcontroller) that is meant to be
# a simplification of the movements used in a planck. 
# There are 30 keys, 3x8 for the fingers and then two 3 key clusters for
# thumbs.
# Copying ideas and config from @rgoulter

let { combo, tap, hold, .. } = import "fak/keycode.ncl" in

# aliases
let kc = tap.reg.kc in
let mod = hold.reg.mod in
let MO = hold.reg.layer in
#let tg = tap.layer.TG in
#
##let fk = tap.custom.fak in
##let me = tap.custom.media in
##let ms = tap.custom.mouse in
#
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in

let BOOT = tap.custom.fak.BOOT in
#let CW = tap.custom.fak.CWTG in

# Tap hold behaviors
let holdtap_behavior_common = {
  timeout_ms = 250,
} in

let hr = hold.reg.behavior {} in 

let sticky_shift =
  tap.sticky.mod.lsft
  & hold.reg.mod.lsft
  & hr in

let shift_mod =
  tap.custom.fak.REP
  & hold.reg.mod.lsft
  & hr in

let lh_corners = [0, 16] in


let cu = { # thumb clusters
  LTH_R = shift_mod,
  LTH_MID = mod.lalt,
  LTH_L = MO 2 & hr,
  RTH_R = mod.lctl,
  RTH_MID = kc.ESC & MO 3 & hr,
  RTH_L = kc.SPC & MO 1 & hr,
} in

# Keymap definition
{
  virtual_keys = [
    # indices:
    #  0  1  2  3      4  5  6  7
    #  8  9 10 11     12 13 14 15
    # 16 17 18 19     20 21 22 23
    #    24 25 26     27 28 29

    # four corners
    combo.make 255 lh_corners,
    combo.make 30  [2,  3],
    combo.make 30 [10, 11],
    combo.make 30 [18, 19],
    combo.make 30  [4,  5],
    combo.make 30 [12, 13],
    combo.make 30 [20, 21],
  ],
  layers = [
    [ # layer 0
      kc.Q,  kc.W,  kc.E,  kc.R,                  kc.U,  kc.I,    kc.O,   kc.P,
      kc.A & MO 1 & hr,  kc.S,  kc.D,  kc.F & hold.reg.mod.lctl & hr,      kc.J & hold.reg.mod.lctl & hr,  kc.K,    kc.L,   kc.SCLN & MO 1 & hr,
      kc.Z,  kc.X,  kc.C,  kc.V,                  kc.M,  kc.COMM, kc.DOT, kc.SLSH,
             cu.LTH_L, cu.LTH_MID, cu.LTH_R,   cu.RTH_L, cu.RTH_MID, cu.RTH_R,

      # combo key: two left top and bottom corners 
      BOOT, 
      kc.T,
      kc.G,
      kc.B,
      kc.Y,
      kc.H,
      kc.N,
    ],
    [ # layer 1
      kc.TAB,  TTTT,  TTTT,  TTTT,      TTTT, TTTT,   TTTT,   TTTT,
      kc.DEL,  TTTT,  TTTT,  TTTT,      TTTT, TTTT,   TTTT,   kc.BSPC,
      TTTT,  TTTT,  TTTT,  TTTT,        TTTT, TTTT,   TTTT, kc.ENT,
             mod.lgui, mod.lctl, TTTT,      TTTT, TTTT,   TTTT,

      # combo 
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
    ],
    [ # layer 2
      TTTT,  TTTT,  TTTT,  TTTT,      kc.N7,  kc.N8,    kc.N9,   mod.lsft & kc.MINS & hr,
      TTTT,  TTTT,  TTTT,  TTTT,      kc.N4,  kc.N5,    kc.N6,   kc.MINS,
      TTTT,  TTTT,  TTTT,  TTTT,      kc.N1,  kc.N2,    kc.N3,   kc.ENT,
             TTTT, TTTT, TTTT,     kc.N0, mod.lsft,   TTTT,

      # combo 
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
    ],
    [ # layer 3
      TTTT,  TTTT,  TTTT,  TTTT,      TTTT,  TTTT,    TTTT,   TTTT,
      TTTT,  TTTT,  TTTT,  TTTT,      kc.LEFT, kc.DOWN, kc.UP, kc.RIGHT,
      TTTT,  TTTT,  TTTT,  TTTT,      TTTT,  TTTT, TTTT, TTTT,
             TTTT, TTTT, TTTT,     TTTT, TTTT,   TTTT,

      # combo 
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
    ],
    [ # layer 4
      TTTT,  TTTT,  TTTT,  TTTT,      TTTT,  TTTT,    TTTT,   TTTT,
      TTTT,  TTTT,  TTTT,  TTTT,      kc.LEFT, kc.DOWN, kc.UP, kc.RIGHT,
      TTTT,  TTTT,  TTTT,  TTTT,      TTTT,  TTTT, TTTT, TTTT,
             TTTT, TTTT, TTTT,     TTTT, TTTT,   TTTT,

      # combo 
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
    ],
  ]
}
