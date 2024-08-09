# 20240729 Luke Miller
# This is a wired split (only one microcontroller) that is meant to be
# a simplification of the movements used in a planck. 
# There are 30 keys, 3x8 for the fingers and then two 3 key clusters for
# thumbs.
# Copying ideas and config from @rgoulter

let { combo, tap, hold, .. } = import "fak/keycode.ncl" in

# aliases
let kc = tap.reg.kc in
let ks = tap.reg.ks in
let mod = hold.reg.mod in
let mtp = tap.reg.mod in
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
let CW = tap.custom.fak.CWTG in

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
  LTH_R = tap.custom.fak.REP & MO 4 & hr,
  LTH_MID = kc.ENT & mod.lalt & hr,
  LTH_L = MO 2 & hr,
  RTH_R = mod.lctl,
  RTH_MID = kc.ESC & MO 3 & hr,
  RTH_L = kc.SPC & MO 1 & hr,
} in

let home = { # homerow mods
    A = kc.A & hold.reg.mod.lsft & hr,
    S = kc.S & hold.reg.mod.lgui & hr,
    D = kc.D & hold.reg.mod.lalt & hr,
    F = kc.F & hold.reg.mod.lctl & hr,
    J = kc.J & hold.reg.mod.lctl & hr,
    K = kc.K & hold.reg.mod.lalt & hr,
    L = kc.L & hold.reg.mod.lgui & hr,
    SCLN = kc.SCLN & hold.reg.mod.lsft & hr,
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
      kc.Q,   kc.W,   kc.E,   kc.R,               kc.U,   kc.I,    kc.O,   kc.P,
      home.A, home.S, home.D, home.F,             home.J, home.K,  home.L, home.SCLN,
      kc.Z,   kc.X,   kc.C,   kc.V,               kc.M,   kc.COMM, kc.DOT, kc.SLSH,
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
      kc.TAB,  TTTT,  kc.UP,   TTTT,              mod.lsft & mod.lctl, TTTT,   TTTT,   TTTT,
      kc.DEL,  kc.LEFT, kc.DOWN, kc.RIGHT,        TTTT, TTTT,   TTTT,   kc.BSPC,
      TTTT,  TTTT,  TTTT,  TTTT,              TTTT, TTTT,   TTTT, kc.ENT,
             TTTT,  TTTT, TTTT,              TTTT, TTTT, TTTT,

      # combo 
      kc.PSCR,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
      TTTT,
    ],
    [ # layer 2
      kc.TAB & mtp.lalt,  TTTT,  TTTT,  TTTT,      kc.N7,  kc.N8,    kc.N9,   mod.lsft & kc.MINS & hr,
      kc.ESC,  TTTT,  kc.DOT & mtp.lctl, kc.I & mtp.lctl,      kc.N4,  kc.N5,    kc.N6,   kc.MINS,
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
      TTTT,  TTTT,  TTTT,  TTTT,      kc.HOME, kc.PGUP, kc.PGDN, kc.END,
      TTTT,  TTTT,  TTTT,  kc.F5,      kc.MINS, kc.EQL, kc.LBRC, kc.RBRC,
      TTTT,  TTTT,  TTTT,  TTTT,      kc.BSLS,  ks.PIPE, TTTT, TTTT,
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
      ks.EXLM,  ks.AT,  ks.HASH,  ks.DLR,     ks.AMPR, ks.ASTR, ks.LPRN, ks.RPRN,
      kc.DEL,  TTTT,  TTTT,  kc.CAPS,      ks.LPRN, ks.RPRN, ks.LCBR, ks.RCBR,
      kc.TAB & mtp.lctl,  TTTT,  TTTT,  TTTT,      kc.QUOT,  ks.DQUO, TTTT, TTTT,
             TTTT, TTTT, TTTT,     TTTT, MO 5 & hr,   TTTT,

      # combo 
      TTTT,
      ks.PERC,
      TTTT,
      TTTT,
      ks.CIRC,
      TTTT,
      TTTT,
    ],
    [ # layer 5
      TTTT,  TTTT,  TTTT,  TTTT,        TTTT,  TTTT,  TTTT,  TTTT,        
      TTTT,  TTTT,  TTTT,  TTTT,        TTTT,  TTTT,  TTTT,  TTTT,       
      TTTT,  TTTT,  TTTT,  TTTT,        TTTT,  TTTT,  TTTT,  TTTT,        
             TTTT,  TTTT, TTTT,         TTTT, TTTT, TTTT,          

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
