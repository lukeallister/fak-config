# A trivial layout for 3x4+3 keys thanks to @rgoulter
# used to check the keyswitches have all been soldered directly.
#
# Additionally, the bootloader can be entered by tapping the two leftmost corner keys.

let { combo, tap, .. } = import "fak/keycode.ncl" in

# Prelude aliases
let kc = tap.reg.kc in

let lhs_corner_indices = [0, 2] in

# Keymap definition
{
  virtual_keys = [
    # four corners
    combo.make 255 lhs_corner_indices
  ],
  layers = [
    [
      kc.Q,  kc.W,  kc.E,  kc.R,      kc.U,  kc.I,    kc.O,   kc.P,
      kc.A,  kc.S,  kc.D,  kc.F,      kc.J,  kc.K,    kc.L,   kc.SCLN,
      kc.Z,  kc.X,  kc.C,  kc.V,      kc.M,  kc.COMM, kc.DOT, kc.SLSH,
             kc.N1, kc.N2, kc.N3,     kc.N5, kc.N6,   kc.N7,

      # combo key: four corners to enter bootloader
      tap.custom.fak.BOOT,
    ],
  ]
}
