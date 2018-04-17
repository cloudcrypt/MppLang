{-# OPTIONS_GHC -w #-}
module Parser where

import Prelude hiding (LT, GT)
import System.Environment
import System.IO
import Data.List
import Lexer
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30
	| HappyAbsSyn31 t31
	| HappyAbsSyn32 t32
	| HappyAbsSyn33 t33
	| HappyAbsSyn34 t34
	| HappyAbsSyn35 t35
	| HappyAbsSyn36 t36
	| HappyAbsSyn37 t37
	| HappyAbsSyn38 t38
	| HappyAbsSyn39 t39
	| HappyAbsSyn40 t40
	| HappyAbsSyn41 t41
	| HappyAbsSyn42 t42
	| HappyAbsSyn43 t43
	| HappyAbsSyn44 t44
	| HappyAbsSyn45 t45
	| HappyAbsSyn46 t46
	| HappyAbsSyn47 t47
	| HappyAbsSyn48 t48
	| HappyAbsSyn49 t49
	| HappyAbsSyn50 t50
	| HappyAbsSyn51 t51

action_0 (91) = happyShift action_8
action_0 (92) = happyShift action_9
action_0 (97) = happyShift action_10
action_0 (4) = happyGoto action_11
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_5
action_0 (14) = happyGoto action_6
action_0 (21) = happyGoto action_7
action_0 _ = happyReduce_4

action_1 (91) = happyShift action_8
action_1 (92) = happyShift action_9
action_1 (97) = happyShift action_10
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (8) = happyGoto action_5
action_1 (14) = happyGoto action_6
action_1 (21) = happyGoto action_7
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (68) = happyShift action_22
action_3 (76) = happyShift action_23
action_3 (78) = happyShift action_24
action_3 (80) = happyShift action_25
action_3 (82) = happyShift action_26
action_3 (84) = happyShift action_27
action_3 (86) = happyShift action_28
action_3 (100) = happyShift action_29
action_3 (27) = happyGoto action_18
action_3 (29) = happyGoto action_19
action_3 (30) = happyGoto action_20
action_3 (31) = happyGoto action_21
action_3 _ = happyReduce_44

action_4 (74) = happyShift action_17
action_4 _ = happyFail

action_5 _ = happyReduce_5

action_6 _ = happyReduce_6

action_7 _ = happyReduce_7

action_8 (100) = happyShift action_16
action_8 (9) = happyGoto action_14
action_8 (11) = happyGoto action_15
action_8 _ = happyFail

action_9 (100) = happyShift action_13
action_9 _ = happyFail

action_10 (100) = happyShift action_12
action_10 _ = happyFail

action_11 (105) = happyAccept
action_11 _ = happyFail

action_12 (66) = happyShift action_66
action_12 (16) = happyGoto action_65
action_12 _ = happyFail

action_13 (60) = happyShift action_64
action_13 _ = happyFail

action_14 (73) = happyShift action_63
action_14 _ = happyFail

action_15 (75) = happyShift action_62
action_15 (10) = happyGoto action_61
action_15 _ = happyReduce_11

action_16 (70) = happyShift action_31
action_16 (12) = happyGoto action_60
action_16 _ = happyReduce_14

action_17 (91) = happyShift action_8
action_17 (92) = happyShift action_9
action_17 (97) = happyShift action_10
action_17 (6) = happyGoto action_59
action_17 (7) = happyGoto action_4
action_17 (8) = happyGoto action_5
action_17 (14) = happyGoto action_6
action_17 (21) = happyGoto action_7
action_17 _ = happyReduce_4

action_18 _ = happyReduce_2

action_19 _ = happyReduce_40

action_20 (74) = happyShift action_58
action_20 _ = happyFail

action_21 (65) = happyShift action_57
action_21 _ = happyFail

action_22 (91) = happyShift action_8
action_22 (92) = happyShift action_9
action_22 (97) = happyShift action_10
action_22 (5) = happyGoto action_56
action_22 (6) = happyGoto action_3
action_22 (7) = happyGoto action_4
action_22 (8) = happyGoto action_5
action_22 (14) = happyGoto action_6
action_22 (21) = happyGoto action_7
action_22 _ = happyReduce_4

action_23 (53) = happyShift action_38
action_23 (59) = happyShift action_39
action_23 (66) = happyShift action_40
action_23 (93) = happyShift action_41
action_23 (94) = happyShift action_42
action_23 (95) = happyShift action_43
action_23 (96) = happyShift action_44
action_23 (99) = happyShift action_45
action_23 (100) = happyShift action_46
action_23 (101) = happyShift action_47
action_23 (102) = happyShift action_48
action_23 (103) = happyShift action_49
action_23 (104) = happyShift action_50
action_23 (38) = happyGoto action_55
action_23 (39) = happyGoto action_33
action_23 (40) = happyGoto action_34
action_23 (42) = happyGoto action_35
action_23 (44) = happyGoto action_36
action_23 (46) = happyGoto action_37
action_23 _ = happyFail

action_24 (53) = happyShift action_38
action_24 (59) = happyShift action_39
action_24 (66) = happyShift action_40
action_24 (93) = happyShift action_41
action_24 (94) = happyShift action_42
action_24 (95) = happyShift action_43
action_24 (96) = happyShift action_44
action_24 (99) = happyShift action_45
action_24 (100) = happyShift action_46
action_24 (101) = happyShift action_47
action_24 (102) = happyShift action_48
action_24 (103) = happyShift action_49
action_24 (104) = happyShift action_50
action_24 (38) = happyGoto action_54
action_24 (39) = happyGoto action_33
action_24 (40) = happyGoto action_34
action_24 (42) = happyGoto action_35
action_24 (44) = happyGoto action_36
action_24 (46) = happyGoto action_37
action_24 _ = happyFail

action_25 (100) = happyShift action_29
action_25 (31) = happyGoto action_53
action_25 _ = happyFail

action_26 (68) = happyShift action_22
action_26 (76) = happyShift action_23
action_26 (78) = happyShift action_24
action_26 (80) = happyShift action_25
action_26 (84) = happyShift action_27
action_26 (86) = happyShift action_28
action_26 (100) = happyShift action_29
action_26 (29) = happyGoto action_52
action_26 (30) = happyGoto action_20
action_26 (31) = happyGoto action_21
action_26 _ = happyReduce_44

action_27 (53) = happyShift action_38
action_27 (59) = happyShift action_39
action_27 (66) = happyShift action_40
action_27 (93) = happyShift action_41
action_27 (94) = happyShift action_42
action_27 (95) = happyShift action_43
action_27 (96) = happyShift action_44
action_27 (99) = happyShift action_45
action_27 (100) = happyShift action_46
action_27 (101) = happyShift action_47
action_27 (102) = happyShift action_48
action_27 (103) = happyShift action_49
action_27 (104) = happyShift action_50
action_27 (38) = happyGoto action_51
action_27 (39) = happyGoto action_33
action_27 (40) = happyGoto action_34
action_27 (42) = happyGoto action_35
action_27 (44) = happyGoto action_36
action_27 (46) = happyGoto action_37
action_27 _ = happyFail

action_28 (53) = happyShift action_38
action_28 (59) = happyShift action_39
action_28 (66) = happyShift action_40
action_28 (93) = happyShift action_41
action_28 (94) = happyShift action_42
action_28 (95) = happyShift action_43
action_28 (96) = happyShift action_44
action_28 (99) = happyShift action_45
action_28 (100) = happyShift action_46
action_28 (101) = happyShift action_47
action_28 (102) = happyShift action_48
action_28 (103) = happyShift action_49
action_28 (104) = happyShift action_50
action_28 (38) = happyGoto action_32
action_28 (39) = happyGoto action_33
action_28 (40) = happyGoto action_34
action_28 (42) = happyGoto action_35
action_28 (44) = happyGoto action_36
action_28 (46) = happyGoto action_37
action_28 _ = happyFail

action_29 (70) = happyShift action_31
action_29 (12) = happyGoto action_30
action_29 _ = happyReduce_14

action_30 _ = happyReduce_52

action_31 (53) = happyShift action_38
action_31 (59) = happyShift action_39
action_31 (66) = happyShift action_40
action_31 (93) = happyShift action_41
action_31 (94) = happyShift action_42
action_31 (95) = happyShift action_43
action_31 (96) = happyShift action_44
action_31 (99) = happyShift action_45
action_31 (100) = happyShift action_46
action_31 (101) = happyShift action_47
action_31 (102) = happyShift action_48
action_31 (103) = happyShift action_49
action_31 (104) = happyShift action_50
action_31 (38) = happyGoto action_115
action_31 (39) = happyGoto action_33
action_31 (40) = happyGoto action_34
action_31 (42) = happyGoto action_35
action_31 (44) = happyGoto action_36
action_31 (46) = happyGoto action_37
action_31 _ = happyFail

action_32 (58) = happyShift action_84
action_32 _ = happyReduce_49

action_33 (57) = happyShift action_114
action_33 _ = happyReduce_63

action_34 _ = happyReduce_65

action_35 (52) = happyShift action_107
action_35 (53) = happyShift action_108
action_35 (60) = happyShift action_109
action_35 (61) = happyShift action_110
action_35 (62) = happyShift action_111
action_35 (63) = happyShift action_112
action_35 (64) = happyShift action_113
action_35 (41) = happyGoto action_105
action_35 (43) = happyGoto action_106
action_35 _ = happyReduce_68

action_36 (54) = happyShift action_103
action_36 (55) = happyShift action_104
action_36 (45) = happyGoto action_102
action_36 _ = happyReduce_75

action_37 _ = happyReduce_79

action_38 (53) = happyShift action_38
action_38 (66) = happyShift action_40
action_38 (93) = happyShift action_41
action_38 (94) = happyShift action_42
action_38 (95) = happyShift action_43
action_38 (96) = happyShift action_44
action_38 (99) = happyShift action_45
action_38 (100) = happyShift action_46
action_38 (101) = happyShift action_47
action_38 (102) = happyShift action_48
action_38 (103) = happyShift action_49
action_38 (104) = happyShift action_50
action_38 (46) = happyGoto action_101
action_38 _ = happyFail

action_39 (53) = happyShift action_38
action_39 (59) = happyShift action_39
action_39 (66) = happyShift action_40
action_39 (93) = happyShift action_41
action_39 (94) = happyShift action_42
action_39 (95) = happyShift action_43
action_39 (96) = happyShift action_44
action_39 (99) = happyShift action_45
action_39 (100) = happyShift action_46
action_39 (101) = happyShift action_47
action_39 (102) = happyShift action_48
action_39 (103) = happyShift action_49
action_39 (104) = happyShift action_50
action_39 (40) = happyGoto action_100
action_39 (42) = happyGoto action_35
action_39 (44) = happyGoto action_36
action_39 (46) = happyGoto action_37
action_39 _ = happyFail

action_40 (53) = happyShift action_38
action_40 (59) = happyShift action_39
action_40 (66) = happyShift action_40
action_40 (93) = happyShift action_41
action_40 (94) = happyShift action_42
action_40 (95) = happyShift action_43
action_40 (96) = happyShift action_44
action_40 (99) = happyShift action_45
action_40 (100) = happyShift action_46
action_40 (101) = happyShift action_47
action_40 (102) = happyShift action_48
action_40 (103) = happyShift action_49
action_40 (104) = happyShift action_50
action_40 (38) = happyGoto action_99
action_40 (39) = happyGoto action_33
action_40 (40) = happyGoto action_34
action_40 (42) = happyGoto action_35
action_40 (44) = happyGoto action_36
action_40 (46) = happyGoto action_37
action_40 _ = happyFail

action_41 (66) = happyShift action_98
action_41 _ = happyFail

action_42 (66) = happyShift action_97
action_42 _ = happyFail

action_43 (66) = happyShift action_96
action_43 _ = happyFail

action_44 (66) = happyShift action_95
action_44 _ = happyFail

action_45 (66) = happyShift action_92
action_45 (48) = happyGoto action_93
action_45 (49) = happyGoto action_94
action_45 _ = happyReduce_98

action_46 (66) = happyShift action_92
action_46 (70) = happyShift action_31
action_46 (12) = happyGoto action_89
action_46 (47) = happyGoto action_90
action_46 (48) = happyGoto action_91
action_46 _ = happyReduce_14

action_47 _ = happyReduce_90

action_48 _ = happyReduce_89

action_49 _ = happyReduce_91

action_50 _ = happyReduce_92

action_51 (58) = happyShift action_84
action_51 (85) = happyShift action_88
action_51 _ = happyFail

action_52 (83) = happyShift action_87
action_52 _ = happyFail

action_53 _ = happyReduce_47

action_54 (58) = happyShift action_84
action_54 (79) = happyShift action_86
action_54 _ = happyFail

action_55 (58) = happyShift action_84
action_55 (77) = happyShift action_85
action_55 _ = happyFail

action_56 (69) = happyShift action_83
action_56 _ = happyFail

action_57 (53) = happyShift action_38
action_57 (59) = happyShift action_39
action_57 (66) = happyShift action_40
action_57 (93) = happyShift action_41
action_57 (94) = happyShift action_42
action_57 (95) = happyShift action_43
action_57 (96) = happyShift action_44
action_57 (99) = happyShift action_45
action_57 (100) = happyShift action_46
action_57 (101) = happyShift action_47
action_57 (102) = happyShift action_48
action_57 (103) = happyShift action_49
action_57 (104) = happyShift action_50
action_57 (38) = happyGoto action_82
action_57 (39) = happyGoto action_33
action_57 (40) = happyGoto action_34
action_57 (42) = happyGoto action_35
action_57 (44) = happyGoto action_36
action_57 (46) = happyGoto action_37
action_57 _ = happyFail

action_58 (68) = happyShift action_22
action_58 (76) = happyShift action_23
action_58 (78) = happyShift action_24
action_58 (80) = happyShift action_25
action_58 (84) = happyShift action_27
action_58 (86) = happyShift action_28
action_58 (100) = happyShift action_29
action_58 (29) = happyGoto action_81
action_58 (30) = happyGoto action_20
action_58 (31) = happyGoto action_21
action_58 _ = happyReduce_44

action_59 _ = happyReduce_3

action_60 _ = happyReduce_12

action_61 _ = happyReduce_9

action_62 (100) = happyShift action_16
action_62 (11) = happyGoto action_80
action_62 _ = happyFail

action_63 (87) = happyShift action_75
action_63 (88) = happyShift action_76
action_63 (89) = happyShift action_77
action_63 (90) = happyShift action_78
action_63 (100) = happyShift action_79
action_63 (13) = happyGoto action_74
action_63 _ = happyFail

action_64 (99) = happyShift action_73
action_64 (22) = happyGoto action_71
action_64 (24) = happyGoto action_72
action_64 _ = happyFail

action_65 (73) = happyShift action_70
action_65 _ = happyFail

action_66 (100) = happyShift action_69
action_66 (17) = happyGoto action_67
action_66 (19) = happyGoto action_68
action_66 _ = happyReduce_24

action_67 (67) = happyShift action_141
action_67 _ = happyFail

action_68 (75) = happyShift action_140
action_68 (18) = happyGoto action_139
action_68 _ = happyReduce_26

action_69 (70) = happyShift action_138
action_69 (20) = happyGoto action_137
action_69 _ = happyReduce_29

action_70 (87) = happyShift action_75
action_70 (88) = happyShift action_76
action_70 (89) = happyShift action_77
action_70 (90) = happyShift action_78
action_70 (100) = happyShift action_79
action_70 (13) = happyGoto action_136
action_70 _ = happyFail

action_71 _ = happyReduce_30

action_72 (72) = happyShift action_135
action_72 (23) = happyGoto action_134
action_72 _ = happyReduce_33

action_73 (85) = happyShift action_133
action_73 _ = happyReduce_35

action_74 _ = happyReduce_8

action_75 _ = happyReduce_15

action_76 _ = happyReduce_17

action_77 _ = happyReduce_18

action_78 _ = happyReduce_16

action_79 _ = happyReduce_19

action_80 (75) = happyShift action_62
action_80 (10) = happyGoto action_132
action_80 _ = happyReduce_11

action_81 _ = happyReduce_43

action_82 (58) = happyShift action_84
action_82 _ = happyReduce_48

action_83 _ = happyReduce_50

action_84 (53) = happyShift action_38
action_84 (59) = happyShift action_39
action_84 (66) = happyShift action_40
action_84 (93) = happyShift action_41
action_84 (94) = happyShift action_42
action_84 (95) = happyShift action_43
action_84 (96) = happyShift action_44
action_84 (99) = happyShift action_45
action_84 (100) = happyShift action_46
action_84 (101) = happyShift action_47
action_84 (102) = happyShift action_48
action_84 (103) = happyShift action_49
action_84 (104) = happyShift action_50
action_84 (39) = happyGoto action_131
action_84 (40) = happyGoto action_34
action_84 (42) = happyGoto action_35
action_84 (44) = happyGoto action_36
action_84 (46) = happyGoto action_37
action_84 _ = happyFail

action_85 (68) = happyShift action_22
action_85 (76) = happyShift action_23
action_85 (78) = happyShift action_24
action_85 (80) = happyShift action_25
action_85 (84) = happyShift action_27
action_85 (86) = happyShift action_28
action_85 (100) = happyShift action_29
action_85 (30) = happyGoto action_130
action_85 (31) = happyGoto action_21
action_85 _ = happyFail

action_86 (68) = happyShift action_22
action_86 (76) = happyShift action_23
action_86 (78) = happyShift action_24
action_86 (80) = happyShift action_25
action_86 (84) = happyShift action_27
action_86 (86) = happyShift action_28
action_86 (100) = happyShift action_29
action_86 (30) = happyGoto action_129
action_86 (31) = happyGoto action_21
action_86 _ = happyFail

action_87 _ = happyReduce_39

action_88 (68) = happyShift action_128
action_88 _ = happyFail

action_89 _ = happyReduce_95

action_90 _ = happyReduce_87

action_91 _ = happyReduce_94

action_92 (53) = happyShift action_38
action_92 (59) = happyShift action_39
action_92 (66) = happyShift action_40
action_92 (93) = happyShift action_41
action_92 (94) = happyShift action_42
action_92 (95) = happyShift action_43
action_92 (96) = happyShift action_44
action_92 (99) = happyShift action_45
action_92 (100) = happyShift action_46
action_92 (101) = happyShift action_47
action_92 (102) = happyShift action_48
action_92 (103) = happyShift action_49
action_92 (104) = happyShift action_50
action_92 (38) = happyGoto action_126
action_92 (39) = happyGoto action_33
action_92 (40) = happyGoto action_34
action_92 (42) = happyGoto action_35
action_92 (44) = happyGoto action_36
action_92 (46) = happyGoto action_37
action_92 (50) = happyGoto action_127
action_92 _ = happyReduce_100

action_93 _ = happyReduce_97

action_94 _ = happyReduce_88

action_95 (53) = happyShift action_38
action_95 (59) = happyShift action_39
action_95 (66) = happyShift action_40
action_95 (93) = happyShift action_41
action_95 (94) = happyShift action_42
action_95 (95) = happyShift action_43
action_95 (96) = happyShift action_44
action_95 (99) = happyShift action_45
action_95 (100) = happyShift action_46
action_95 (101) = happyShift action_47
action_95 (102) = happyShift action_48
action_95 (103) = happyShift action_49
action_95 (104) = happyShift action_50
action_95 (38) = happyGoto action_125
action_95 (39) = happyGoto action_33
action_95 (40) = happyGoto action_34
action_95 (42) = happyGoto action_35
action_95 (44) = happyGoto action_36
action_95 (46) = happyGoto action_37
action_95 _ = happyFail

action_96 (53) = happyShift action_38
action_96 (59) = happyShift action_39
action_96 (66) = happyShift action_40
action_96 (93) = happyShift action_41
action_96 (94) = happyShift action_42
action_96 (95) = happyShift action_43
action_96 (96) = happyShift action_44
action_96 (99) = happyShift action_45
action_96 (100) = happyShift action_46
action_96 (101) = happyShift action_47
action_96 (102) = happyShift action_48
action_96 (103) = happyShift action_49
action_96 (104) = happyShift action_50
action_96 (38) = happyGoto action_124
action_96 (39) = happyGoto action_33
action_96 (40) = happyGoto action_34
action_96 (42) = happyGoto action_35
action_96 (44) = happyGoto action_36
action_96 (46) = happyGoto action_37
action_96 _ = happyFail

action_97 (53) = happyShift action_38
action_97 (59) = happyShift action_39
action_97 (66) = happyShift action_40
action_97 (93) = happyShift action_41
action_97 (94) = happyShift action_42
action_97 (95) = happyShift action_43
action_97 (96) = happyShift action_44
action_97 (99) = happyShift action_45
action_97 (100) = happyShift action_46
action_97 (101) = happyShift action_47
action_97 (102) = happyShift action_48
action_97 (103) = happyShift action_49
action_97 (104) = happyShift action_50
action_97 (38) = happyGoto action_123
action_97 (39) = happyGoto action_33
action_97 (40) = happyGoto action_34
action_97 (42) = happyGoto action_35
action_97 (44) = happyGoto action_36
action_97 (46) = happyGoto action_37
action_97 _ = happyFail

action_98 (100) = happyShift action_122
action_98 _ = happyFail

action_99 (58) = happyShift action_84
action_99 (67) = happyShift action_121
action_99 _ = happyFail

action_100 _ = happyReduce_66

action_101 _ = happyReduce_93

action_102 (53) = happyShift action_38
action_102 (66) = happyShift action_40
action_102 (93) = happyShift action_41
action_102 (94) = happyShift action_42
action_102 (95) = happyShift action_43
action_102 (96) = happyShift action_44
action_102 (99) = happyShift action_45
action_102 (100) = happyShift action_46
action_102 (101) = happyShift action_47
action_102 (102) = happyShift action_48
action_102 (103) = happyShift action_49
action_102 (104) = happyShift action_50
action_102 (46) = happyGoto action_120
action_102 _ = happyFail

action_103 _ = happyReduce_80

action_104 _ = happyReduce_81

action_105 (53) = happyShift action_38
action_105 (66) = happyShift action_40
action_105 (93) = happyShift action_41
action_105 (94) = happyShift action_42
action_105 (95) = happyShift action_43
action_105 (96) = happyShift action_44
action_105 (99) = happyShift action_45
action_105 (100) = happyShift action_46
action_105 (101) = happyShift action_47
action_105 (102) = happyShift action_48
action_105 (103) = happyShift action_49
action_105 (104) = happyShift action_50
action_105 (42) = happyGoto action_119
action_105 (44) = happyGoto action_36
action_105 (46) = happyGoto action_37
action_105 _ = happyFail

action_106 (53) = happyShift action_38
action_106 (66) = happyShift action_40
action_106 (93) = happyShift action_41
action_106 (94) = happyShift action_42
action_106 (95) = happyShift action_43
action_106 (96) = happyShift action_44
action_106 (99) = happyShift action_45
action_106 (100) = happyShift action_46
action_106 (101) = happyShift action_47
action_106 (102) = happyShift action_48
action_106 (103) = happyShift action_49
action_106 (104) = happyShift action_50
action_106 (44) = happyGoto action_118
action_106 (46) = happyGoto action_37
action_106 _ = happyFail

action_107 _ = happyReduce_76

action_108 _ = happyReduce_77

action_109 _ = happyReduce_69

action_110 _ = happyReduce_70

action_111 _ = happyReduce_71

action_112 _ = happyReduce_72

action_113 _ = happyReduce_73

action_114 (53) = happyShift action_38
action_114 (59) = happyShift action_39
action_114 (66) = happyShift action_40
action_114 (93) = happyShift action_41
action_114 (94) = happyShift action_42
action_114 (95) = happyShift action_43
action_114 (96) = happyShift action_44
action_114 (99) = happyShift action_45
action_114 (100) = happyShift action_46
action_114 (101) = happyShift action_47
action_114 (102) = happyShift action_48
action_114 (103) = happyShift action_49
action_114 (104) = happyShift action_50
action_114 (40) = happyGoto action_117
action_114 (42) = happyGoto action_35
action_114 (44) = happyGoto action_36
action_114 (46) = happyGoto action_37
action_114 _ = happyFail

action_115 (58) = happyShift action_84
action_115 (71) = happyShift action_116
action_115 _ = happyFail

action_116 (70) = happyShift action_31
action_116 (12) = happyGoto action_160
action_116 _ = happyReduce_14

action_117 _ = happyReduce_64

action_118 (54) = happyShift action_103
action_118 (55) = happyShift action_104
action_118 (45) = happyGoto action_102
action_118 _ = happyReduce_74

action_119 (52) = happyShift action_107
action_119 (53) = happyShift action_108
action_119 (43) = happyGoto action_106
action_119 _ = happyReduce_67

action_120 _ = happyReduce_78

action_121 _ = happyReduce_82

action_122 (70) = happyShift action_138
action_122 (20) = happyGoto action_159
action_122 _ = happyReduce_29

action_123 (58) = happyShift action_84
action_123 (67) = happyShift action_158
action_123 _ = happyFail

action_124 (58) = happyShift action_84
action_124 (67) = happyShift action_157
action_124 _ = happyFail

action_125 (58) = happyShift action_84
action_125 (67) = happyShift action_156
action_125 _ = happyFail

action_126 (58) = happyShift action_84
action_126 (75) = happyShift action_155
action_126 (51) = happyGoto action_154
action_126 _ = happyReduce_102

action_127 (67) = happyShift action_153
action_127 _ = happyFail

action_128 (99) = happyShift action_152
action_128 (32) = happyGoto action_150
action_128 (34) = happyGoto action_151
action_128 _ = happyFail

action_129 _ = happyReduce_46

action_130 (81) = happyShift action_149
action_130 _ = happyFail

action_131 (57) = happyShift action_114
action_131 _ = happyReduce_62

action_132 _ = happyReduce_10

action_133 (87) = happyShift action_75
action_133 (88) = happyShift action_76
action_133 (89) = happyShift action_77
action_133 (90) = happyShift action_78
action_133 (100) = happyShift action_79
action_133 (13) = happyGoto action_147
action_133 (25) = happyGoto action_148
action_133 _ = happyFail

action_134 _ = happyReduce_31

action_135 (99) = happyShift action_73
action_135 (24) = happyGoto action_146
action_135 _ = happyFail

action_136 (68) = happyShift action_145
action_136 _ = happyFail

action_137 (73) = happyShift action_144
action_137 _ = happyFail

action_138 (71) = happyShift action_143
action_138 _ = happyFail

action_139 _ = happyReduce_23

action_140 (100) = happyShift action_69
action_140 (19) = happyGoto action_142
action_140 _ = happyFail

action_141 _ = happyReduce_22

action_142 (75) = happyShift action_140
action_142 (18) = happyGoto action_176
action_142 _ = happyReduce_26

action_143 (70) = happyShift action_138
action_143 (20) = happyGoto action_175
action_143 _ = happyReduce_29

action_144 (87) = happyShift action_75
action_144 (88) = happyShift action_76
action_144 (89) = happyShift action_77
action_144 (90) = happyShift action_78
action_144 (100) = happyShift action_79
action_144 (13) = happyGoto action_174
action_144 _ = happyFail

action_145 (91) = happyShift action_8
action_145 (92) = happyShift action_9
action_145 (97) = happyShift action_10
action_145 (6) = happyGoto action_172
action_145 (7) = happyGoto action_4
action_145 (8) = happyGoto action_5
action_145 (14) = happyGoto action_6
action_145 (15) = happyGoto action_173
action_145 (21) = happyGoto action_7
action_145 _ = happyReduce_4

action_146 (72) = happyShift action_135
action_146 (23) = happyGoto action_171
action_146 _ = happyReduce_33

action_147 (54) = happyShift action_170
action_147 (26) = happyGoto action_169
action_147 _ = happyReduce_38

action_148 _ = happyReduce_34

action_149 (68) = happyShift action_22
action_149 (76) = happyShift action_23
action_149 (78) = happyShift action_24
action_149 (80) = happyShift action_25
action_149 (84) = happyShift action_27
action_149 (86) = happyShift action_28
action_149 (100) = happyShift action_29
action_149 (30) = happyGoto action_168
action_149 (31) = happyGoto action_21
action_149 _ = happyFail

action_150 (69) = happyShift action_167
action_150 _ = happyFail

action_151 (72) = happyShift action_166
action_151 (33) = happyGoto action_165
action_151 _ = happyReduce_55

action_152 (66) = happyShift action_164
action_152 (35) = happyGoto action_163
action_152 _ = happyReduce_58

action_153 _ = happyReduce_96

action_154 _ = happyReduce_99

action_155 (53) = happyShift action_38
action_155 (59) = happyShift action_39
action_155 (66) = happyShift action_40
action_155 (93) = happyShift action_41
action_155 (94) = happyShift action_42
action_155 (95) = happyShift action_43
action_155 (96) = happyShift action_44
action_155 (99) = happyShift action_45
action_155 (100) = happyShift action_46
action_155 (101) = happyShift action_47
action_155 (102) = happyShift action_48
action_155 (103) = happyShift action_49
action_155 (104) = happyShift action_50
action_155 (38) = happyGoto action_162
action_155 (39) = happyGoto action_33
action_155 (40) = happyGoto action_34
action_155 (42) = happyGoto action_35
action_155 (44) = happyGoto action_36
action_155 (46) = happyGoto action_37
action_155 _ = happyFail

action_156 _ = happyReduce_86

action_157 _ = happyReduce_85

action_158 _ = happyReduce_84

action_159 (67) = happyShift action_161
action_159 _ = happyFail

action_160 _ = happyReduce_13

action_161 _ = happyReduce_83

action_162 (58) = happyShift action_84
action_162 (75) = happyShift action_155
action_162 (51) = happyGoto action_186
action_162 _ = happyReduce_102

action_163 (56) = happyShift action_185
action_163 _ = happyFail

action_164 (100) = happyShift action_184
action_164 (36) = happyGoto action_183
action_164 _ = happyFail

action_165 _ = happyReduce_53

action_166 (99) = happyShift action_152
action_166 (34) = happyGoto action_182
action_166 _ = happyFail

action_167 _ = happyReduce_51

action_168 _ = happyReduce_45

action_169 _ = happyReduce_36

action_170 (87) = happyShift action_75
action_170 (88) = happyShift action_76
action_170 (89) = happyShift action_77
action_170 (90) = happyShift action_78
action_170 (100) = happyShift action_79
action_170 (13) = happyGoto action_181
action_170 _ = happyFail

action_171 _ = happyReduce_32

action_172 (68) = happyShift action_22
action_172 (76) = happyShift action_23
action_172 (78) = happyShift action_24
action_172 (80) = happyShift action_25
action_172 (82) = happyShift action_180
action_172 (84) = happyShift action_27
action_172 (86) = happyShift action_28
action_172 (100) = happyShift action_29
action_172 (28) = happyGoto action_178
action_172 (29) = happyGoto action_179
action_172 (30) = happyGoto action_20
action_172 (31) = happyGoto action_21
action_172 _ = happyReduce_44

action_173 (69) = happyShift action_177
action_173 _ = happyFail

action_174 _ = happyReduce_27

action_175 _ = happyReduce_28

action_176 _ = happyReduce_25

action_177 _ = happyReduce_20

action_178 _ = happyReduce_21

action_179 (98) = happyShift action_194
action_179 _ = happyFail

action_180 (68) = happyShift action_22
action_180 (76) = happyShift action_23
action_180 (78) = happyShift action_24
action_180 (80) = happyShift action_25
action_180 (84) = happyShift action_27
action_180 (86) = happyShift action_28
action_180 (100) = happyShift action_29
action_180 (29) = happyGoto action_193
action_180 (30) = happyGoto action_20
action_180 (31) = happyGoto action_21
action_180 _ = happyReduce_44

action_181 (54) = happyShift action_170
action_181 (26) = happyGoto action_192
action_181 _ = happyReduce_38

action_182 (72) = happyShift action_166
action_182 (33) = happyGoto action_191
action_182 _ = happyReduce_55

action_183 (67) = happyShift action_190
action_183 _ = happyFail

action_184 (75) = happyShift action_189
action_184 (37) = happyGoto action_188
action_184 _ = happyReduce_61

action_185 (68) = happyShift action_22
action_185 (76) = happyShift action_23
action_185 (78) = happyShift action_24
action_185 (80) = happyShift action_25
action_185 (84) = happyShift action_27
action_185 (86) = happyShift action_28
action_185 (100) = happyShift action_29
action_185 (30) = happyGoto action_187
action_185 (31) = happyGoto action_21
action_185 _ = happyFail

action_186 _ = happyReduce_101

action_187 _ = happyReduce_56

action_188 _ = happyReduce_59

action_189 (100) = happyShift action_197
action_189 _ = happyFail

action_190 _ = happyReduce_57

action_191 _ = happyReduce_54

action_192 _ = happyReduce_37

action_193 (98) = happyShift action_196
action_193 _ = happyFail

action_194 (53) = happyShift action_38
action_194 (59) = happyShift action_39
action_194 (66) = happyShift action_40
action_194 (93) = happyShift action_41
action_194 (94) = happyShift action_42
action_194 (95) = happyShift action_43
action_194 (96) = happyShift action_44
action_194 (99) = happyShift action_45
action_194 (100) = happyShift action_46
action_194 (101) = happyShift action_47
action_194 (102) = happyShift action_48
action_194 (103) = happyShift action_49
action_194 (104) = happyShift action_50
action_194 (38) = happyGoto action_195
action_194 (39) = happyGoto action_33
action_194 (40) = happyGoto action_34
action_194 (42) = happyGoto action_35
action_194 (44) = happyGoto action_36
action_194 (46) = happyGoto action_37
action_194 _ = happyFail

action_195 (58) = happyShift action_84
action_195 (74) = happyShift action_200
action_195 _ = happyFail

action_196 (53) = happyShift action_38
action_196 (59) = happyShift action_39
action_196 (66) = happyShift action_40
action_196 (93) = happyShift action_41
action_196 (94) = happyShift action_42
action_196 (95) = happyShift action_43
action_196 (96) = happyShift action_44
action_196 (99) = happyShift action_45
action_196 (100) = happyShift action_46
action_196 (101) = happyShift action_47
action_196 (102) = happyShift action_48
action_196 (103) = happyShift action_49
action_196 (104) = happyShift action_50
action_196 (38) = happyGoto action_199
action_196 (39) = happyGoto action_33
action_196 (40) = happyGoto action_34
action_196 (42) = happyGoto action_35
action_196 (44) = happyGoto action_36
action_196 (46) = happyGoto action_37
action_196 _ = happyFail

action_197 (75) = happyShift action_189
action_197 (37) = happyGoto action_198
action_197 _ = happyReduce_61

action_198 _ = happyReduce_60

action_199 (58) = happyShift action_84
action_199 (74) = happyShift action_201
action_199 _ = happyFail

action_200 _ = happyReduce_42

action_201 (83) = happyShift action_202
action_201 _ = happyFail

action_202 _ = happyReduce_41

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (M_prog happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn27  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ((happy_var_1, happy_var_2)
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  6 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1++happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_0  6 happyReduction_4
happyReduction_4  =  HappyAbsSyn6
		 ([]
	)

happyReduce_5 = happySpecReduce_1  7 happyReduction_5
happyReduction_5 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 8 happyReduction_8
happyReduction_8 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (map (\x -> (M_var ((fst x), (snd x), happy_var_4))) happy_var_2
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_2  9 happyReduction_9
happyReduction_9 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]++happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  10 happyReduction_10
happyReduction_10 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 ([happy_var_2]++happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_0  10 happyReduction_11
happyReduction_11  =  HappyAbsSyn10
		 ([]
	)

happyReduce_12 = happySpecReduce_2  11 happyReduction_12
happyReduction_12 (HappyAbsSyn12  happy_var_2)
	(HappyTerminal (ID _ happy_var_1))
	 =  HappyAbsSyn11
		 ((happy_var_1, happy_var_2)
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 12 happyReduction_13
happyReduction_13 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 ([happy_var_2]++happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_0  12 happyReduction_14
happyReduction_14  =  HappyAbsSyn12
		 ([]
	)

happyReduce_15 = happySpecReduce_1  13 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn13
		 (M_int
	)

happyReduce_16 = happySpecReduce_1  13 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn13
		 (M_real
	)

happyReduce_17 = happySpecReduce_1  13 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn13
		 (M_bool
	)

happyReduce_18 = happySpecReduce_1  13 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn13
		 (M_char
	)

happyReduce_19 = happySpecReduce_1  13 happyReduction_19
happyReduction_19 (HappyTerminal (ID _ happy_var_1))
	 =  HappyAbsSyn13
		 (M_type happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happyReduce 8 14 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyTerminal (ID _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (let tpl = happy_var_7 in M_fun (happy_var_2, happy_var_3, happy_var_5, (fst tpl), (snd tpl))
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_2  15 happyReduction_21
happyReduction_21 (HappyAbsSyn28  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn15
		 ((happy_var_1, happy_var_2)
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  16 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  17 happyReduction_23
happyReduction_23 (HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn17
		 ([happy_var_1]++happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_0  17 happyReduction_24
happyReduction_24  =  HappyAbsSyn17
		 ([]
	)

happyReduce_25 = happySpecReduce_3  18 happyReduction_25
happyReduction_25 (HappyAbsSyn18  happy_var_3)
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn18
		 ([happy_var_2]++happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_0  18 happyReduction_26
happyReduction_26  =  HappyAbsSyn18
		 ([]
	)

happyReduce_27 = happyReduce 4 19 happyReduction_27
happyReduction_27 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	(HappyTerminal (ID _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 ((happy_var_1, happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_3  20 happyReduction_28
happyReduction_28 (HappyAbsSyn20  happy_var_3)
	_
	_
	 =  HappyAbsSyn20
		 (happy_var_3+1
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_0  20 happyReduction_29
happyReduction_29  =  HappyAbsSyn20
		 (0
	)

happyReduce_30 = happyReduce 4 21 happyReduction_30
happyReduction_30 ((HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (M_data (happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_2  22 happyReduction_31
happyReduction_31 (HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn22
		 ([happy_var_1]++happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  23 happyReduction_32
happyReduction_32 (HappyAbsSyn23  happy_var_3)
	(HappyAbsSyn24  happy_var_2)
	_
	 =  HappyAbsSyn23
		 ([happy_var_2]++happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_0  23 happyReduction_33
happyReduction_33  =  HappyAbsSyn23
		 ([]
	)

happyReduce_34 = happySpecReduce_3  24 happyReduction_34
happyReduction_34 (HappyAbsSyn25  happy_var_3)
	_
	(HappyTerminal (CID _ happy_var_1))
	 =  HappyAbsSyn24
		 ((happy_var_1, happy_var_3)
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  24 happyReduction_35
happyReduction_35 (HappyTerminal (CID _ happy_var_1))
	 =  HappyAbsSyn24
		 ((happy_var_1, [])
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  25 happyReduction_36
happyReduction_36 (HappyAbsSyn26  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn25
		 ([happy_var_1]++happy_var_2
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  26 happyReduction_37
happyReduction_37 (HappyAbsSyn26  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn26
		 ([happy_var_2]++happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_0  26 happyReduction_38
happyReduction_38  =  HappyAbsSyn26
		 ([]
	)

happyReduce_39 = happySpecReduce_3  27 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn29  happy_var_2)
	_
	 =  HappyAbsSyn27
		 (happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  27 happyReduction_40
happyReduction_40 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happyReduce 6 28 happyReduction_41
happyReduction_41 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (happy_var_2++[(M_return happy_var_4)]
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 4 28 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyAbsSyn38  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (happy_var_1++[(M_return happy_var_3)]
	) `HappyStk` happyRest

happyReduce_43 = happySpecReduce_3  29 happyReduction_43
happyReduction_43 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn29
		 ([happy_var_1]++happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_0  29 happyReduction_44
happyReduction_44  =  HappyAbsSyn29
		 ([]
	)

happyReduce_45 = happyReduce 6 30 happyReduction_45
happyReduction_45 ((HappyAbsSyn30  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn30  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn30
		 (M_cond (happy_var_2, happy_var_4, happy_var_6)
	) `HappyStk` happyRest

happyReduce_46 = happyReduce 4 30 happyReduction_46
happyReduction_46 ((HappyAbsSyn30  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn30
		 (M_while (happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_2  30 happyReduction_47
happyReduction_47 (HappyAbsSyn31  happy_var_2)
	_
	 =  HappyAbsSyn30
		 (M_read happy_var_2
	)
happyReduction_47 _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  30 happyReduction_48
happyReduction_48 (HappyAbsSyn38  happy_var_3)
	_
	(HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (let tpl = happy_var_1 in M_ass ((fst tpl), (snd tpl), happy_var_3)
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_2  30 happyReduction_49
happyReduction_49 (HappyAbsSyn38  happy_var_2)
	_
	 =  HappyAbsSyn30
		 (M_print happy_var_2
	)
happyReduction_49 _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  30 happyReduction_50
happyReduction_50 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn30
		 (M_block happy_var_2
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happyReduce 6 30 happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyAbsSyn32  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn30
		 (M_case (happy_var_2, happy_var_5)
	) `HappyStk` happyRest

happyReduce_52 = happySpecReduce_2  31 happyReduction_52
happyReduction_52 (HappyAbsSyn12  happy_var_2)
	(HappyTerminal (ID _ happy_var_1))
	 =  HappyAbsSyn31
		 ((happy_var_1, happy_var_2)
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_2  32 happyReduction_53
happyReduction_53 (HappyAbsSyn33  happy_var_2)
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn32
		 ([happy_var_1]++happy_var_2
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  33 happyReduction_54
happyReduction_54 (HappyAbsSyn33  happy_var_3)
	(HappyAbsSyn34  happy_var_2)
	_
	 =  HappyAbsSyn33
		 ([happy_var_2]++happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_0  33 happyReduction_55
happyReduction_55  =  HappyAbsSyn33
		 ([]
	)

happyReduce_56 = happyReduce 4 34 happyReduction_56
happyReduction_56 ((HappyAbsSyn30  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn35  happy_var_2) `HappyStk`
	(HappyTerminal (CID _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 ((happy_var_1, happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_57 = happySpecReduce_3  35 happyReduction_57
happyReduction_57 _
	(HappyAbsSyn36  happy_var_2)
	_
	 =  HappyAbsSyn35
		 (happy_var_2
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_0  35 happyReduction_58
happyReduction_58  =  HappyAbsSyn35
		 ([]
	)

happyReduce_59 = happySpecReduce_2  36 happyReduction_59
happyReduction_59 (HappyAbsSyn37  happy_var_2)
	(HappyTerminal (ID _ happy_var_1))
	 =  HappyAbsSyn36
		 ([happy_var_1]++happy_var_2
	)
happyReduction_59 _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  37 happyReduction_60
happyReduction_60 (HappyAbsSyn37  happy_var_3)
	(HappyTerminal (ID _ happy_var_2))
	_
	 =  HappyAbsSyn37
		 ([happy_var_2]++happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_0  37 happyReduction_61
happyReduction_61  =  HappyAbsSyn37
		 ([]
	)

happyReduce_62 = happySpecReduce_3  38 happyReduction_62
happyReduction_62 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn38
		 (M_app (M_or, [happy_var_1]++[happy_var_3])
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  38 happyReduction_63
happyReduction_63 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn38
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  39 happyReduction_64
happyReduction_64 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (M_app (M_and, [happy_var_1]++[happy_var_3])
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  39 happyReduction_65
happyReduction_65 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn39
		 (happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_2  40 happyReduction_66
happyReduction_66 (HappyAbsSyn40  happy_var_2)
	_
	 =  HappyAbsSyn40
		 (M_app (M_not, [happy_var_2])
	)
happyReduction_66 _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  40 happyReduction_67
happyReduction_67 (HappyAbsSyn42  happy_var_3)
	(HappyAbsSyn41  happy_var_2)
	(HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn40
		 (M_app (happy_var_2, [happy_var_1]++[happy_var_3])
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  40 happyReduction_68
happyReduction_68 (HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  41 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn41
		 (M_eq
	)

happyReduce_70 = happySpecReduce_1  41 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn41
		 (M_lt
	)

happyReduce_71 = happySpecReduce_1  41 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn41
		 (M_gt
	)

happyReduce_72 = happySpecReduce_1  41 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn41
		 (M_le
	)

happyReduce_73 = happySpecReduce_1  41 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn41
		 (M_ge
	)

happyReduce_74 = happySpecReduce_3  42 happyReduction_74
happyReduction_74 (HappyAbsSyn44  happy_var_3)
	(HappyAbsSyn43  happy_var_2)
	(HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn42
		 (M_app (happy_var_2, [happy_var_1]++[happy_var_3])
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  42 happyReduction_75
happyReduction_75 (HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn42
		 (happy_var_1
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_1  43 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn43
		 (M_add
	)

happyReduce_77 = happySpecReduce_1  43 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn43
		 (M_sub
	)

happyReduce_78 = happySpecReduce_3  44 happyReduction_78
happyReduction_78 (HappyAbsSyn46  happy_var_3)
	(HappyAbsSyn45  happy_var_2)
	(HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn44
		 (M_app (happy_var_2, [happy_var_1]++[happy_var_3])
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_1  44 happyReduction_79
happyReduction_79 (HappyAbsSyn46  happy_var_1)
	 =  HappyAbsSyn44
		 (happy_var_1
	)
happyReduction_79 _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_1  45 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn45
		 (M_mul
	)

happyReduce_81 = happySpecReduce_1  45 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn45
		 (M_div
	)

happyReduce_82 = happySpecReduce_3  46 happyReduction_82
happyReduction_82 _
	(HappyAbsSyn38  happy_var_2)
	_
	 =  HappyAbsSyn46
		 (happy_var_2
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happyReduce 5 46 happyReduction_83
happyReduction_83 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	(HappyTerminal (ID _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn46
		 (M_size (happy_var_3, happy_var_4)
	) `HappyStk` happyRest

happyReduce_84 = happyReduce 4 46 happyReduction_84
happyReduction_84 (_ `HappyStk`
	(HappyAbsSyn38  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn46
		 (M_app (M_float, [happy_var_3])
	) `HappyStk` happyRest

happyReduce_85 = happyReduce 4 46 happyReduction_85
happyReduction_85 (_ `HappyStk`
	(HappyAbsSyn38  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn46
		 (M_app (M_floor, [happy_var_3])
	) `HappyStk` happyRest

happyReduce_86 = happyReduce 4 46 happyReduction_86
happyReduction_86 (_ `HappyStk`
	(HappyAbsSyn38  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn46
		 (M_app (M_ceil, [happy_var_3])
	) `HappyStk` happyRest

happyReduce_87 = happySpecReduce_2  46 happyReduction_87
happyReduction_87 (HappyAbsSyn47  happy_var_2)
	(HappyTerminal (ID _ happy_var_1))
	 =  HappyAbsSyn46
		 (let tpl = happy_var_2 in case (fst tpl) of
                                                                    NonFunctionDetected -> M_id (happy_var_1, (snd tpl)) 
                                                                    FunctionDetected -> M_app ((M_fn happy_var_1), (snd tpl))
	)
happyReduction_87 _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_2  46 happyReduction_88
happyReduction_88 (HappyAbsSyn49  happy_var_2)
	(HappyTerminal (CID _ happy_var_1))
	 =  HappyAbsSyn46
		 (M_app ((M_cid happy_var_1), happy_var_2)
	)
happyReduction_88 _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_1  46 happyReduction_89
happyReduction_89 (HappyTerminal (IVAL _ happy_var_1))
	 =  HappyAbsSyn46
		 (M_ival happy_var_1
	)
happyReduction_89 _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_1  46 happyReduction_90
happyReduction_90 (HappyTerminal (RVAL _ happy_var_1))
	 =  HappyAbsSyn46
		 (M_rval happy_var_1
	)
happyReduction_90 _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_1  46 happyReduction_91
happyReduction_91 (HappyTerminal (BVAL _ happy_var_1))
	 =  HappyAbsSyn46
		 (M_bval happy_var_1
	)
happyReduction_91 _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_1  46 happyReduction_92
happyReduction_92 (HappyTerminal (CVAL _ happy_var_1))
	 =  HappyAbsSyn46
		 (M_cval happy_var_1
	)
happyReduction_92 _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_2  46 happyReduction_93
happyReduction_93 (HappyAbsSyn46  happy_var_2)
	_
	 =  HappyAbsSyn46
		 (M_app (M_neg, [happy_var_2])
	)
happyReduction_93 _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_1  47 happyReduction_94
happyReduction_94 (HappyAbsSyn48  happy_var_1)
	 =  HappyAbsSyn47
		 ((FunctionDetected, happy_var_1)
	)
happyReduction_94 _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_1  47 happyReduction_95
happyReduction_95 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn47
		 ((NonFunctionDetected, happy_var_1)
	)
happyReduction_95 _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  48 happyReduction_96
happyReduction_96 _
	(HappyAbsSyn50  happy_var_2)
	_
	 =  HappyAbsSyn48
		 (happy_var_2
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_1  49 happyReduction_97
happyReduction_97 (HappyAbsSyn48  happy_var_1)
	 =  HappyAbsSyn49
		 (happy_var_1
	)
happyReduction_97 _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_0  49 happyReduction_98
happyReduction_98  =  HappyAbsSyn49
		 ([]
	)

happyReduce_99 = happySpecReduce_2  50 happyReduction_99
happyReduction_99 (HappyAbsSyn51  happy_var_2)
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn50
		 ([happy_var_1]++happy_var_2
	)
happyReduction_99 _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_0  50 happyReduction_100
happyReduction_100  =  HappyAbsSyn50
		 ([]
	)

happyReduce_101 = happySpecReduce_3  51 happyReduction_101
happyReduction_101 (HappyAbsSyn51  happy_var_3)
	(HappyAbsSyn38  happy_var_2)
	_
	 =  HappyAbsSyn51
		 ([happy_var_2]++happy_var_3
	)
happyReduction_101 _ _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_0  51 happyReduction_102
happyReduction_102  =  HappyAbsSyn51
		 ([]
	)

happyNewToken action sts stk [] =
	action 105 105 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	ADD _ -> cont 52;
	SUB _ -> cont 53;
	MUL _ -> cont 54;
	DIV _ -> cont 55;
	ARROW _ -> cont 56;
	AND _ -> cont 57;
	OR _ -> cont 58;
	NOT _ -> cont 59;
	EQUAL _ -> cont 60;
	LT _ -> cont 61;
	GT _ -> cont 62;
	LE _ -> cont 63;
	GE _ -> cont 64;
	ASSIGN _ -> cont 65;
	LPAR _ -> cont 66;
	RPAR _ -> cont 67;
	CLPAR _ -> cont 68;
	CRPAR _ -> cont 69;
	SLPAR _ -> cont 70;
	SRPAR _ -> cont 71;
	SLASH _ -> cont 72;
	COLON _ -> cont 73;
	SEMICOLON _ -> cont 74;
	COMMA _ -> cont 75;
	IF _ -> cont 76;
	THEN _ -> cont 77;
	WHILE _ -> cont 78;
	DO _ -> cont 79;
	READ _ -> cont 80;
	ELSE _ -> cont 81;
	BEGIN _ -> cont 82;
	END _ -> cont 83;
	CASE _ -> cont 84;
	OF _ -> cont 85;
	PRINT _ -> cont 86;
	INT _ -> cont 87;
	BOOL _ -> cont 88;
	CHAR _ -> cont 89;
	REAL _ -> cont 90;
	VAR _ -> cont 91;
	DATA _ -> cont 92;
	SIZE _ -> cont 93;
	FLOAT _ -> cont 94;
	FLOOR _ -> cont 95;
	CEIL _ -> cont 96;
	FUN _ -> cont 97;
	RETURN _ -> cont 98;
	CID _ happy_dollar_dollar -> cont 99;
	ID _ happy_dollar_dollar -> cont 100;
	RVAL _ happy_dollar_dollar -> cont 101;
	IVAL _ happy_dollar_dollar -> cont 102;
	BVAL _ happy_dollar_dollar -> cont 103;
	CVAL _ happy_dollar_dollar -> cont 104;
	_ -> happyError' (tk:tks)
	}

happyError_ 105 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = return
    (<*>) = ap
instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

parse tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


-- | Displays ParseErrors with line and column number if present
parseError :: [Token] -> a
parseError (t:ts) = error $ errorString (pos t) "ParseError: Syntax error"
parseError _ = error "ParseError"

-- | Data type definition for detecting modifier_list type
data Detected = FunctionDetected
              | NonFunctionDetected

-- | Data type definitions for the abstract syntax tree
data M_prog = M_prog ([M_decl],[M_stmt])
            deriving (Eq, Show)
data M_decl = M_var (String,[M_expr],M_type)
            | M_fun (String,[(String,Int,M_type)],M_type,[M_decl],[M_stmt])
            | M_data (String,[(String,[M_type])])
            deriving (Eq, Show)
data M_stmt = M_ass (String,[M_expr],M_expr)
            | M_while (M_expr,M_stmt)
            | M_cond (M_expr,M_stmt,M_stmt)
            | M_read (String,[M_expr])
            | M_print M_expr
            | M_return M_expr
            | M_block ([M_decl],[M_stmt])
            | M_case (M_expr,[(String,[String],M_stmt)])
            deriving (Eq, Show)
data M_type = M_int | M_bool | M_real | M_char | M_type String
            deriving (Eq, Show)
data M_expr = M_ival Int
            | M_rval Float
            | M_bval Bool
            | M_cval Char
            | M_size (String,Int)
            | M_id (String,[M_expr])
            | M_app (M_operation,[M_expr])
            deriving (Eq, Show)
data M_operation
            = M_fn String
            | M_cid String
            | M_add | M_mul | M_sub | M_div | M_neg
            | M_lt | M_le | M_gt | M_ge | M_eq | M_not | M_and | M_or
            | M_float | M_floor | M_ceil
            deriving (Eq, Show)

-- class DeclContainer a where
--     getDecls :: a -> [M_decl]

-- instance DeclContainer M_prog where
--     getDecls (M_prog (decls,_)) = decls

-- -- instance DeclContainer M_decl where
-- --     getDecls (M_fun (_,_,_, decls,_)) = decls
-- instance DeclContainer M_decl

{-|
    Function to convert the abstract syntax tree back to readable code.
    Recursively traverses the M_prog abstarct syntax tree and generates code as a string.
-}
printAST :: M_prog -> String
printAST (M_prog (decls, stmts)) = (ifExists decls ((intercalate ";\n" (map printDecl decls))++";\n"))++"begin\n"++(ifExists stmts ((intercalate ";\n" (map printStmt stmts))++";\n"))++"end"

-- | Function to convert a declaration back to readable code
printDecl :: M_decl -> String
printDecl (M_var (s, arraydims, t)) = "var "++(printArrayDecl s arraydims)++":"++(printType t)
printDecl (M_fun (s, args, t, decls, stmts)) = "fun "++s++"("++(intercalate ", " $ map printArg args)++")"++":"++(printType t)++"\n{\n"++(ifExists decls ((indent $ intercalate ";\n" (map printDecl decls))++";\n"))++(ifExists stmts ((indent $ intercalate ";\n" (map printStmt stmts))++";\n"))++"}"
printDecl (M_data (s, dataline:datalines)) = "data "++s++"\n"++"\t= "++(printDataLine dataline)++"\n"++(indent (intercalate "\n" (map (\d -> "| "++(printDataLine d)) datalines)))

-- | Function to convert a data type definition line back to readable code
printDataLine :: (String, [M_type]) -> String
printDataLine (s, ts) = s++" of "++(intercalate " * " $ map printType ts)

-- | Function to convert a function argument back to readable code
printArg :: (String, Int, M_type) -> String
printArg (s, n, t) = s++(concat $ replicate n "[]")++":"++(printType t)

-- | Function to convert a statment back to readable code
printStmt :: M_stmt -> String
printStmt (M_ass (s, arraydims, expr)) = (printArrayDecl s arraydims)++":="++(printExpr expr)
printStmt (M_while (expr, stmt)) = "while "++(printExpr expr)++" do\n"++(indent $ printStmt stmt)
printStmt (M_cond (expr, stmt1, stmt2)) = "if "++(printExpr expr)++" then\n"++(indent $ printStmt stmt1)++"\nelse\n"++(indent $ printStmt stmt2)
printStmt (M_read (s, arraydims)) = "read "++(printArrayDecl s arraydims)
printStmt (M_print expr) = "print "++(printExpr expr)
printStmt (M_return expr) = "return "++(printExpr expr)
printStmt (M_block (decls, stmts)) = (ifExists decls ("{\n"++(indent $ intercalate ";\n" (map printDecl decls))++";\n}\n"))++"begin\n"++(ifExists stmts ((indent $ intercalate ";\n" (map printStmt stmts))++";\n"))++"end"
printStmt (M_case (expr, caselines)) = "case "++(printExpr expr)++" of {\n"++(indent $ intercalate "\n" (map printCase caselines))++"\n}"

-- | Function to convert a case of caseline back to readable code
printCase :: (String, [String], M_stmt) -> String
printCase (s, args, stmt) = s++"("++(intercalate "," args)++") => "++(printStmt stmt)

-- | Function that returns the given string if the list contains items. Returns the empty string otherwise.
ifExists :: [a] -> String -> String
ifExists (a:as) str = str
ifExists [] str = ""

-- | Function to convert a type back to readable code
printType :: M_type -> String
printType M_int = "int"
printType M_bool = "bool"
printType M_real = "real"
printType M_char = "char"
printType (M_type s) = s

-- | Function to convert a expression back to readable code
printExpr :: M_expr -> String
printExpr (M_ival i) = show i
printExpr (M_rval f) = show f
printExpr (M_bval True) = "true"
printExpr (M_bval False) = "false"
printExpr (M_cval c) = show c
printExpr (M_size (s, i)) = "size("++s++(concat $ replicate i "[]")++")"
printExpr (M_id (s, exprs)) = printArrayDecl s exprs
printExpr (M_app (M_fn s, exprs)) = s++"("++(intercalate "," $ map (\e -> printExpr e) exprs)++")"
printExpr (M_app (M_cid s, exprs)) = s++"("++(intercalate "," $ map (\e -> printExpr e) exprs)++")"
printExpr (M_app (M_float, exprs)) = "float"++"("++(intercalate "," $ map (\e -> printExpr e) exprs)++")"
printExpr (M_app (M_ceil, exprs)) = "ceil"++"("++(intercalate "," $ map (\e -> printExpr e) exprs)++")"
printExpr (M_app (M_floor, exprs)) = "floor"++"("++(intercalate "," $ map (\e -> printExpr e) exprs)++")"
printExpr (M_app (M_neg, exprs)) = (printOp M_neg)++(printExpr (exprs !! 0))
printExpr (M_app (M_not, exprs)) = (printOp M_not)++" "++(printExpr (exprs !! 0))
printExpr (M_app (op, exprs)) = (printExpr (exprs !! 0))++(printOp op)++(printExpr (exprs !! 1))

-- | Function to convert a identifier or identifier with array dimensions and info back to readable code
printArrayDecl :: String -> [M_expr] -> String
printArrayDecl s exprs = s++(concat $ (map (\e -> "["++(printExpr e)++"]") exprs))

-- | Function to convert an operation back to readable code
printOp :: M_operation -> String
printOp (M_fn s) = s
printOp (M_cid s) = s
printOp M_add = "+"
printOp M_mul = "*"
printOp M_sub = "-"
printOp M_div = "/"
printOp M_neg = "-"
printOp M_lt = "<"
printOp M_le = "=<"
printOp M_gt = ">"
printOp M_ge = ">="
printOp M_eq = "="
printOp M_not = "not"
printOp M_and = "&&"
printOp M_or = "||"
printOp M_float = "float"
printOp M_floor = "floor"
printOp M_ceil = "ceil"

-- | Takes a newline-separated string, and inserts 1 tab character at the start of each line
indent :: String -> String
indent s = intercalate "\n" $ map (\line -> (replicate 1 '\t')++line) (lines s)

intersperse :: String -> String -> String
intersperse s str = (head ls)++nl++(intercalate "\n" $ map (\line -> s++line) (tail ls))
    where 
        ls = lines str
        nl = case (length ls) > 1 of
                True -> "\n"
                _ -> ""

--main :: IO ()
--main = do
--    args <- getArgs
--    -- Check if proper number of args were supplied
--    case (length args) of
--        1 -> do
--            -- Perform lexing and get tokens
--            ts <- lexer (head args)
--            -- | Check if there are any errors in the list of tokens
--            case (length (filter isError ts)) of
--                0 -> do
--                    -- Recognize grammar, and build abstract syntax tree
--                    let ast = parse ts
--                    -- Print syntax tree (converted back to readable code)
--                    putStr "Parsed Syntax Tree:\n\n"
--                    putStr $ printAST ast
--                _ -> printErrors (filter isError ts)
--        _ -> do
--            putStrLn "Usage: inputFilename"
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "G:\\GitHub\\haskell-platform\\build\\ghc-bindist\\local\\lib/include\\ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "C:\\Users\\randy\\AppData\\Local\\Temp\\ghc8056_0\\ghc_2.h" #-}




























































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates\\GenericTemplate.hs" #-}

{-# LINE 46 "templates\\GenericTemplate.hs" #-}








{-# LINE 67 "templates\\GenericTemplate.hs" #-}

{-# LINE 77 "templates\\GenericTemplate.hs" #-}

{-# LINE 86 "templates\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates\\GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
