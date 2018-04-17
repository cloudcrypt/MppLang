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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51 t52 t53 t54
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
	| HappyAbsSyn52 t52
	| HappyAbsSyn53 t53
	| HappyAbsSyn54 t54

action_0 (94) = happyShift action_8
action_0 (95) = happyShift action_9
action_0 (100) = happyShift action_10
action_0 (4) = happyGoto action_11
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_5
action_0 (14) = happyGoto action_6
action_0 (24) = happyGoto action_7
action_0 _ = happyReduce_4

action_1 (94) = happyShift action_8
action_1 (95) = happyShift action_9
action_1 (100) = happyShift action_10
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (8) = happyGoto action_5
action_1 (14) = happyGoto action_6
action_1 (24) = happyGoto action_7
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (71) = happyShift action_22
action_3 (79) = happyShift action_23
action_3 (81) = happyShift action_24
action_3 (83) = happyShift action_25
action_3 (85) = happyShift action_26
action_3 (87) = happyShift action_27
action_3 (89) = happyShift action_28
action_3 (103) = happyShift action_29
action_3 (30) = happyGoto action_18
action_3 (32) = happyGoto action_19
action_3 (33) = happyGoto action_20
action_3 (34) = happyGoto action_21
action_3 _ = happyReduce_48

action_4 (77) = happyShift action_17
action_4 _ = happyFail

action_5 _ = happyReduce_5

action_6 _ = happyReduce_6

action_7 _ = happyReduce_7

action_8 (103) = happyShift action_16
action_8 (9) = happyGoto action_14
action_8 (11) = happyGoto action_15
action_8 _ = happyFail

action_9 (103) = happyShift action_13
action_9 _ = happyFail

action_10 (103) = happyShift action_12
action_10 _ = happyFail

action_11 (108) = happyAccept
action_11 _ = happyFail

action_12 (69) = happyShift action_66
action_12 (16) = happyGoto action_65
action_12 _ = happyFail

action_13 (63) = happyShift action_64
action_13 _ = happyFail

action_14 (76) = happyShift action_63
action_14 _ = happyFail

action_15 (78) = happyShift action_62
action_15 (10) = happyGoto action_61
action_15 _ = happyReduce_11

action_16 (73) = happyShift action_31
action_16 (12) = happyGoto action_60
action_16 _ = happyReduce_14

action_17 (94) = happyShift action_8
action_17 (95) = happyShift action_9
action_17 (100) = happyShift action_10
action_17 (6) = happyGoto action_59
action_17 (7) = happyGoto action_4
action_17 (8) = happyGoto action_5
action_17 (14) = happyGoto action_6
action_17 (24) = happyGoto action_7
action_17 _ = happyReduce_4

action_18 _ = happyReduce_2

action_19 _ = happyReduce_44

action_20 (77) = happyShift action_58
action_20 _ = happyFail

action_21 (68) = happyShift action_57
action_21 _ = happyFail

action_22 (94) = happyShift action_8
action_22 (95) = happyShift action_9
action_22 (100) = happyShift action_10
action_22 (5) = happyGoto action_56
action_22 (6) = happyGoto action_3
action_22 (7) = happyGoto action_4
action_22 (8) = happyGoto action_5
action_22 (14) = happyGoto action_6
action_22 (24) = happyGoto action_7
action_22 _ = happyReduce_4

action_23 (56) = happyShift action_38
action_23 (62) = happyShift action_39
action_23 (69) = happyShift action_40
action_23 (96) = happyShift action_41
action_23 (97) = happyShift action_42
action_23 (98) = happyShift action_43
action_23 (99) = happyShift action_44
action_23 (102) = happyShift action_45
action_23 (103) = happyShift action_46
action_23 (104) = happyShift action_47
action_23 (105) = happyShift action_48
action_23 (106) = happyShift action_49
action_23 (107) = happyShift action_50
action_23 (41) = happyGoto action_55
action_23 (42) = happyGoto action_33
action_23 (43) = happyGoto action_34
action_23 (45) = happyGoto action_35
action_23 (47) = happyGoto action_36
action_23 (49) = happyGoto action_37
action_23 _ = happyFail

action_24 (56) = happyShift action_38
action_24 (62) = happyShift action_39
action_24 (69) = happyShift action_40
action_24 (96) = happyShift action_41
action_24 (97) = happyShift action_42
action_24 (98) = happyShift action_43
action_24 (99) = happyShift action_44
action_24 (102) = happyShift action_45
action_24 (103) = happyShift action_46
action_24 (104) = happyShift action_47
action_24 (105) = happyShift action_48
action_24 (106) = happyShift action_49
action_24 (107) = happyShift action_50
action_24 (41) = happyGoto action_54
action_24 (42) = happyGoto action_33
action_24 (43) = happyGoto action_34
action_24 (45) = happyGoto action_35
action_24 (47) = happyGoto action_36
action_24 (49) = happyGoto action_37
action_24 _ = happyFail

action_25 (103) = happyShift action_29
action_25 (34) = happyGoto action_53
action_25 _ = happyFail

action_26 (71) = happyShift action_22
action_26 (79) = happyShift action_23
action_26 (81) = happyShift action_24
action_26 (83) = happyShift action_25
action_26 (87) = happyShift action_27
action_26 (89) = happyShift action_28
action_26 (103) = happyShift action_29
action_26 (32) = happyGoto action_52
action_26 (33) = happyGoto action_20
action_26 (34) = happyGoto action_21
action_26 _ = happyReduce_48

action_27 (56) = happyShift action_38
action_27 (62) = happyShift action_39
action_27 (69) = happyShift action_40
action_27 (96) = happyShift action_41
action_27 (97) = happyShift action_42
action_27 (98) = happyShift action_43
action_27 (99) = happyShift action_44
action_27 (102) = happyShift action_45
action_27 (103) = happyShift action_46
action_27 (104) = happyShift action_47
action_27 (105) = happyShift action_48
action_27 (106) = happyShift action_49
action_27 (107) = happyShift action_50
action_27 (41) = happyGoto action_51
action_27 (42) = happyGoto action_33
action_27 (43) = happyGoto action_34
action_27 (45) = happyGoto action_35
action_27 (47) = happyGoto action_36
action_27 (49) = happyGoto action_37
action_27 _ = happyFail

action_28 (56) = happyShift action_38
action_28 (62) = happyShift action_39
action_28 (69) = happyShift action_40
action_28 (96) = happyShift action_41
action_28 (97) = happyShift action_42
action_28 (98) = happyShift action_43
action_28 (99) = happyShift action_44
action_28 (102) = happyShift action_45
action_28 (103) = happyShift action_46
action_28 (104) = happyShift action_47
action_28 (105) = happyShift action_48
action_28 (106) = happyShift action_49
action_28 (107) = happyShift action_50
action_28 (41) = happyGoto action_32
action_28 (42) = happyGoto action_33
action_28 (43) = happyGoto action_34
action_28 (45) = happyGoto action_35
action_28 (47) = happyGoto action_36
action_28 (49) = happyGoto action_37
action_28 _ = happyFail

action_29 (73) = happyShift action_31
action_29 (12) = happyGoto action_30
action_29 _ = happyReduce_14

action_30 _ = happyReduce_56

action_31 (56) = happyShift action_38
action_31 (62) = happyShift action_39
action_31 (69) = happyShift action_40
action_31 (96) = happyShift action_41
action_31 (97) = happyShift action_42
action_31 (98) = happyShift action_43
action_31 (99) = happyShift action_44
action_31 (102) = happyShift action_45
action_31 (103) = happyShift action_46
action_31 (104) = happyShift action_47
action_31 (105) = happyShift action_48
action_31 (106) = happyShift action_49
action_31 (107) = happyShift action_50
action_31 (41) = happyGoto action_117
action_31 (42) = happyGoto action_33
action_31 (43) = happyGoto action_34
action_31 (45) = happyGoto action_35
action_31 (47) = happyGoto action_36
action_31 (49) = happyGoto action_37
action_31 _ = happyFail

action_32 (61) = happyShift action_86
action_32 _ = happyReduce_53

action_33 (60) = happyShift action_116
action_33 _ = happyReduce_67

action_34 _ = happyReduce_69

action_35 (55) = happyShift action_109
action_35 (56) = happyShift action_110
action_35 (63) = happyShift action_111
action_35 (64) = happyShift action_112
action_35 (65) = happyShift action_113
action_35 (66) = happyShift action_114
action_35 (67) = happyShift action_115
action_35 (44) = happyGoto action_107
action_35 (46) = happyGoto action_108
action_35 _ = happyReduce_72

action_36 (57) = happyShift action_105
action_36 (58) = happyShift action_106
action_36 (48) = happyGoto action_104
action_36 _ = happyReduce_79

action_37 _ = happyReduce_83

action_38 (56) = happyShift action_38
action_38 (69) = happyShift action_40
action_38 (96) = happyShift action_41
action_38 (97) = happyShift action_42
action_38 (98) = happyShift action_43
action_38 (99) = happyShift action_44
action_38 (102) = happyShift action_45
action_38 (103) = happyShift action_46
action_38 (104) = happyShift action_47
action_38 (105) = happyShift action_48
action_38 (106) = happyShift action_49
action_38 (107) = happyShift action_50
action_38 (49) = happyGoto action_103
action_38 _ = happyFail

action_39 (56) = happyShift action_38
action_39 (62) = happyShift action_39
action_39 (69) = happyShift action_40
action_39 (96) = happyShift action_41
action_39 (97) = happyShift action_42
action_39 (98) = happyShift action_43
action_39 (99) = happyShift action_44
action_39 (102) = happyShift action_45
action_39 (103) = happyShift action_46
action_39 (104) = happyShift action_47
action_39 (105) = happyShift action_48
action_39 (106) = happyShift action_49
action_39 (107) = happyShift action_50
action_39 (43) = happyGoto action_102
action_39 (45) = happyGoto action_35
action_39 (47) = happyGoto action_36
action_39 (49) = happyGoto action_37
action_39 _ = happyFail

action_40 (56) = happyShift action_38
action_40 (62) = happyShift action_39
action_40 (69) = happyShift action_40
action_40 (96) = happyShift action_41
action_40 (97) = happyShift action_42
action_40 (98) = happyShift action_43
action_40 (99) = happyShift action_44
action_40 (102) = happyShift action_45
action_40 (103) = happyShift action_46
action_40 (104) = happyShift action_47
action_40 (105) = happyShift action_48
action_40 (106) = happyShift action_49
action_40 (107) = happyShift action_50
action_40 (41) = happyGoto action_101
action_40 (42) = happyGoto action_33
action_40 (43) = happyGoto action_34
action_40 (45) = happyGoto action_35
action_40 (47) = happyGoto action_36
action_40 (49) = happyGoto action_37
action_40 _ = happyFail

action_41 (69) = happyShift action_100
action_41 _ = happyFail

action_42 (69) = happyShift action_99
action_42 _ = happyFail

action_43 (69) = happyShift action_98
action_43 _ = happyFail

action_44 (69) = happyShift action_97
action_44 _ = happyFail

action_45 (69) = happyShift action_94
action_45 (51) = happyGoto action_95
action_45 (52) = happyGoto action_96
action_45 _ = happyReduce_102

action_46 (69) = happyShift action_94
action_46 (73) = happyShift action_31
action_46 (12) = happyGoto action_91
action_46 (50) = happyGoto action_92
action_46 (51) = happyGoto action_93
action_46 _ = happyReduce_14

action_47 _ = happyReduce_94

action_48 _ = happyReduce_93

action_49 _ = happyReduce_95

action_50 _ = happyReduce_96

action_51 (61) = happyShift action_86
action_51 (88) = happyShift action_90
action_51 _ = happyFail

action_52 (86) = happyShift action_89
action_52 _ = happyFail

action_53 _ = happyReduce_51

action_54 (61) = happyShift action_86
action_54 (82) = happyShift action_88
action_54 _ = happyFail

action_55 (61) = happyShift action_86
action_55 (80) = happyShift action_87
action_55 _ = happyFail

action_56 (72) = happyShift action_85
action_56 _ = happyFail

action_57 (56) = happyShift action_38
action_57 (62) = happyShift action_39
action_57 (69) = happyShift action_40
action_57 (96) = happyShift action_41
action_57 (97) = happyShift action_42
action_57 (98) = happyShift action_43
action_57 (99) = happyShift action_44
action_57 (102) = happyShift action_45
action_57 (103) = happyShift action_46
action_57 (104) = happyShift action_47
action_57 (105) = happyShift action_48
action_57 (106) = happyShift action_49
action_57 (107) = happyShift action_50
action_57 (41) = happyGoto action_84
action_57 (42) = happyGoto action_33
action_57 (43) = happyGoto action_34
action_57 (45) = happyGoto action_35
action_57 (47) = happyGoto action_36
action_57 (49) = happyGoto action_37
action_57 _ = happyFail

action_58 (71) = happyShift action_22
action_58 (79) = happyShift action_23
action_58 (81) = happyShift action_24
action_58 (83) = happyShift action_25
action_58 (87) = happyShift action_27
action_58 (89) = happyShift action_28
action_58 (103) = happyShift action_29
action_58 (32) = happyGoto action_83
action_58 (33) = happyGoto action_20
action_58 (34) = happyGoto action_21
action_58 _ = happyReduce_48

action_59 _ = happyReduce_3

action_60 _ = happyReduce_12

action_61 _ = happyReduce_9

action_62 (103) = happyShift action_16
action_62 (11) = happyGoto action_82
action_62 _ = happyFail

action_63 (90) = happyShift action_77
action_63 (91) = happyShift action_78
action_63 (92) = happyShift action_79
action_63 (93) = happyShift action_80
action_63 (103) = happyShift action_81
action_63 (13) = happyGoto action_76
action_63 _ = happyFail

action_64 (102) = happyShift action_75
action_64 (25) = happyGoto action_73
action_64 (27) = happyGoto action_74
action_64 _ = happyFail

action_65 (76) = happyShift action_72
action_65 _ = happyFail

action_66 (103) = happyShift action_71
action_66 (17) = happyGoto action_67
action_66 (19) = happyGoto action_68
action_66 (20) = happyGoto action_69
action_66 (22) = happyGoto action_70
action_66 _ = happyReduce_24

action_67 (70) = happyShift action_146
action_67 _ = happyFail

action_68 (78) = happyShift action_145
action_68 (18) = happyGoto action_144
action_68 _ = happyReduce_26

action_69 (76) = happyShift action_143
action_69 _ = happyFail

action_70 (78) = happyShift action_142
action_70 (21) = happyGoto action_141
action_70 _ = happyReduce_30

action_71 (73) = happyShift action_140
action_71 (23) = happyGoto action_139
action_71 _ = happyReduce_33

action_72 (90) = happyShift action_77
action_72 (91) = happyShift action_78
action_72 (92) = happyShift action_79
action_72 (93) = happyShift action_80
action_72 (103) = happyShift action_81
action_72 (13) = happyGoto action_138
action_72 _ = happyFail

action_73 _ = happyReduce_34

action_74 (75) = happyShift action_137
action_74 (26) = happyGoto action_136
action_74 _ = happyReduce_37

action_75 (88) = happyShift action_135
action_75 _ = happyReduce_39

action_76 _ = happyReduce_8

action_77 _ = happyReduce_15

action_78 _ = happyReduce_17

action_79 _ = happyReduce_18

action_80 _ = happyReduce_16

action_81 _ = happyReduce_19

action_82 (78) = happyShift action_62
action_82 (10) = happyGoto action_134
action_82 _ = happyReduce_11

action_83 _ = happyReduce_47

action_84 (61) = happyShift action_86
action_84 _ = happyReduce_52

action_85 _ = happyReduce_54

action_86 (56) = happyShift action_38
action_86 (62) = happyShift action_39
action_86 (69) = happyShift action_40
action_86 (96) = happyShift action_41
action_86 (97) = happyShift action_42
action_86 (98) = happyShift action_43
action_86 (99) = happyShift action_44
action_86 (102) = happyShift action_45
action_86 (103) = happyShift action_46
action_86 (104) = happyShift action_47
action_86 (105) = happyShift action_48
action_86 (106) = happyShift action_49
action_86 (107) = happyShift action_50
action_86 (42) = happyGoto action_133
action_86 (43) = happyGoto action_34
action_86 (45) = happyGoto action_35
action_86 (47) = happyGoto action_36
action_86 (49) = happyGoto action_37
action_86 _ = happyFail

action_87 (71) = happyShift action_22
action_87 (79) = happyShift action_23
action_87 (81) = happyShift action_24
action_87 (83) = happyShift action_25
action_87 (87) = happyShift action_27
action_87 (89) = happyShift action_28
action_87 (103) = happyShift action_29
action_87 (33) = happyGoto action_132
action_87 (34) = happyGoto action_21
action_87 _ = happyFail

action_88 (71) = happyShift action_22
action_88 (79) = happyShift action_23
action_88 (81) = happyShift action_24
action_88 (83) = happyShift action_25
action_88 (87) = happyShift action_27
action_88 (89) = happyShift action_28
action_88 (103) = happyShift action_29
action_88 (33) = happyGoto action_131
action_88 (34) = happyGoto action_21
action_88 _ = happyFail

action_89 _ = happyReduce_43

action_90 (71) = happyShift action_130
action_90 _ = happyFail

action_91 _ = happyReduce_99

action_92 _ = happyReduce_91

action_93 _ = happyReduce_98

action_94 (56) = happyShift action_38
action_94 (62) = happyShift action_39
action_94 (69) = happyShift action_40
action_94 (96) = happyShift action_41
action_94 (97) = happyShift action_42
action_94 (98) = happyShift action_43
action_94 (99) = happyShift action_44
action_94 (102) = happyShift action_45
action_94 (103) = happyShift action_46
action_94 (104) = happyShift action_47
action_94 (105) = happyShift action_48
action_94 (106) = happyShift action_49
action_94 (107) = happyShift action_50
action_94 (41) = happyGoto action_128
action_94 (42) = happyGoto action_33
action_94 (43) = happyGoto action_34
action_94 (45) = happyGoto action_35
action_94 (47) = happyGoto action_36
action_94 (49) = happyGoto action_37
action_94 (53) = happyGoto action_129
action_94 _ = happyReduce_104

action_95 _ = happyReduce_101

action_96 _ = happyReduce_92

action_97 (56) = happyShift action_38
action_97 (62) = happyShift action_39
action_97 (69) = happyShift action_40
action_97 (96) = happyShift action_41
action_97 (97) = happyShift action_42
action_97 (98) = happyShift action_43
action_97 (99) = happyShift action_44
action_97 (102) = happyShift action_45
action_97 (103) = happyShift action_46
action_97 (104) = happyShift action_47
action_97 (105) = happyShift action_48
action_97 (106) = happyShift action_49
action_97 (107) = happyShift action_50
action_97 (41) = happyGoto action_127
action_97 (42) = happyGoto action_33
action_97 (43) = happyGoto action_34
action_97 (45) = happyGoto action_35
action_97 (47) = happyGoto action_36
action_97 (49) = happyGoto action_37
action_97 _ = happyFail

action_98 (56) = happyShift action_38
action_98 (62) = happyShift action_39
action_98 (69) = happyShift action_40
action_98 (96) = happyShift action_41
action_98 (97) = happyShift action_42
action_98 (98) = happyShift action_43
action_98 (99) = happyShift action_44
action_98 (102) = happyShift action_45
action_98 (103) = happyShift action_46
action_98 (104) = happyShift action_47
action_98 (105) = happyShift action_48
action_98 (106) = happyShift action_49
action_98 (107) = happyShift action_50
action_98 (41) = happyGoto action_126
action_98 (42) = happyGoto action_33
action_98 (43) = happyGoto action_34
action_98 (45) = happyGoto action_35
action_98 (47) = happyGoto action_36
action_98 (49) = happyGoto action_37
action_98 _ = happyFail

action_99 (56) = happyShift action_38
action_99 (62) = happyShift action_39
action_99 (69) = happyShift action_40
action_99 (96) = happyShift action_41
action_99 (97) = happyShift action_42
action_99 (98) = happyShift action_43
action_99 (99) = happyShift action_44
action_99 (102) = happyShift action_45
action_99 (103) = happyShift action_46
action_99 (104) = happyShift action_47
action_99 (105) = happyShift action_48
action_99 (106) = happyShift action_49
action_99 (107) = happyShift action_50
action_99 (41) = happyGoto action_125
action_99 (42) = happyGoto action_33
action_99 (43) = happyGoto action_34
action_99 (45) = happyGoto action_35
action_99 (47) = happyGoto action_36
action_99 (49) = happyGoto action_37
action_99 _ = happyFail

action_100 (103) = happyShift action_124
action_100 _ = happyFail

action_101 (61) = happyShift action_86
action_101 (70) = happyShift action_123
action_101 _ = happyFail

action_102 _ = happyReduce_70

action_103 _ = happyReduce_97

action_104 (56) = happyShift action_38
action_104 (69) = happyShift action_40
action_104 (96) = happyShift action_41
action_104 (97) = happyShift action_42
action_104 (98) = happyShift action_43
action_104 (99) = happyShift action_44
action_104 (102) = happyShift action_45
action_104 (103) = happyShift action_46
action_104 (104) = happyShift action_47
action_104 (105) = happyShift action_48
action_104 (106) = happyShift action_49
action_104 (107) = happyShift action_50
action_104 (49) = happyGoto action_122
action_104 _ = happyFail

action_105 _ = happyReduce_84

action_106 _ = happyReduce_85

action_107 (56) = happyShift action_38
action_107 (69) = happyShift action_40
action_107 (96) = happyShift action_41
action_107 (97) = happyShift action_42
action_107 (98) = happyShift action_43
action_107 (99) = happyShift action_44
action_107 (102) = happyShift action_45
action_107 (103) = happyShift action_46
action_107 (104) = happyShift action_47
action_107 (105) = happyShift action_48
action_107 (106) = happyShift action_49
action_107 (107) = happyShift action_50
action_107 (45) = happyGoto action_121
action_107 (47) = happyGoto action_36
action_107 (49) = happyGoto action_37
action_107 _ = happyFail

action_108 (56) = happyShift action_38
action_108 (69) = happyShift action_40
action_108 (96) = happyShift action_41
action_108 (97) = happyShift action_42
action_108 (98) = happyShift action_43
action_108 (99) = happyShift action_44
action_108 (102) = happyShift action_45
action_108 (103) = happyShift action_46
action_108 (104) = happyShift action_47
action_108 (105) = happyShift action_48
action_108 (106) = happyShift action_49
action_108 (107) = happyShift action_50
action_108 (47) = happyGoto action_120
action_108 (49) = happyGoto action_37
action_108 _ = happyFail

action_109 _ = happyReduce_80

action_110 _ = happyReduce_81

action_111 _ = happyReduce_73

action_112 _ = happyReduce_74

action_113 _ = happyReduce_75

action_114 _ = happyReduce_76

action_115 _ = happyReduce_77

action_116 (56) = happyShift action_38
action_116 (62) = happyShift action_39
action_116 (69) = happyShift action_40
action_116 (96) = happyShift action_41
action_116 (97) = happyShift action_42
action_116 (98) = happyShift action_43
action_116 (99) = happyShift action_44
action_116 (102) = happyShift action_45
action_116 (103) = happyShift action_46
action_116 (104) = happyShift action_47
action_116 (105) = happyShift action_48
action_116 (106) = happyShift action_49
action_116 (107) = happyShift action_50
action_116 (43) = happyGoto action_119
action_116 (45) = happyGoto action_35
action_116 (47) = happyGoto action_36
action_116 (49) = happyGoto action_37
action_116 _ = happyFail

action_117 (61) = happyShift action_86
action_117 (74) = happyShift action_118
action_117 _ = happyFail

action_118 (73) = happyShift action_31
action_118 (12) = happyGoto action_166
action_118 _ = happyReduce_14

action_119 _ = happyReduce_68

action_120 (57) = happyShift action_105
action_120 (58) = happyShift action_106
action_120 (48) = happyGoto action_104
action_120 _ = happyReduce_78

action_121 (55) = happyShift action_109
action_121 (56) = happyShift action_110
action_121 (46) = happyGoto action_108
action_121 _ = happyReduce_71

action_122 _ = happyReduce_82

action_123 _ = happyReduce_86

action_124 (73) = happyShift action_140
action_124 (23) = happyGoto action_165
action_124 _ = happyReduce_33

action_125 (61) = happyShift action_86
action_125 (70) = happyShift action_164
action_125 _ = happyFail

action_126 (61) = happyShift action_86
action_126 (70) = happyShift action_163
action_126 _ = happyFail

action_127 (61) = happyShift action_86
action_127 (70) = happyShift action_162
action_127 _ = happyFail

action_128 (61) = happyShift action_86
action_128 (78) = happyShift action_161
action_128 (54) = happyGoto action_160
action_128 _ = happyReduce_106

action_129 (70) = happyShift action_159
action_129 _ = happyFail

action_130 (102) = happyShift action_158
action_130 (35) = happyGoto action_156
action_130 (37) = happyGoto action_157
action_130 _ = happyFail

action_131 _ = happyReduce_50

action_132 (84) = happyShift action_155
action_132 _ = happyFail

action_133 (60) = happyShift action_116
action_133 _ = happyReduce_66

action_134 _ = happyReduce_10

action_135 (90) = happyShift action_77
action_135 (91) = happyShift action_78
action_135 (92) = happyShift action_79
action_135 (93) = happyShift action_80
action_135 (103) = happyShift action_81
action_135 (13) = happyGoto action_153
action_135 (28) = happyGoto action_154
action_135 _ = happyFail

action_136 _ = happyReduce_35

action_137 (102) = happyShift action_75
action_137 (27) = happyGoto action_152
action_137 _ = happyFail

action_138 (71) = happyShift action_151
action_138 _ = happyFail

action_139 _ = happyReduce_31

action_140 (74) = happyShift action_150
action_140 _ = happyFail

action_141 _ = happyReduce_28

action_142 (103) = happyShift action_71
action_142 (22) = happyGoto action_149
action_142 _ = happyFail

action_143 (90) = happyShift action_77
action_143 (91) = happyShift action_78
action_143 (92) = happyShift action_79
action_143 (93) = happyShift action_80
action_143 (103) = happyShift action_81
action_143 (13) = happyGoto action_148
action_143 _ = happyFail

action_144 _ = happyReduce_23

action_145 (103) = happyShift action_71
action_145 (19) = happyGoto action_147
action_145 (20) = happyGoto action_69
action_145 (22) = happyGoto action_70
action_145 _ = happyFail

action_146 _ = happyReduce_22

action_147 (78) = happyShift action_145
action_147 (18) = happyGoto action_182
action_147 _ = happyReduce_26

action_148 _ = happyReduce_27

action_149 (78) = happyShift action_142
action_149 (21) = happyGoto action_181
action_149 _ = happyReduce_30

action_150 (73) = happyShift action_140
action_150 (23) = happyGoto action_180
action_150 _ = happyReduce_33

action_151 (94) = happyShift action_8
action_151 (95) = happyShift action_9
action_151 (100) = happyShift action_10
action_151 (6) = happyGoto action_178
action_151 (7) = happyGoto action_4
action_151 (8) = happyGoto action_5
action_151 (14) = happyGoto action_6
action_151 (15) = happyGoto action_179
action_151 (24) = happyGoto action_7
action_151 _ = happyReduce_4

action_152 (75) = happyShift action_137
action_152 (26) = happyGoto action_177
action_152 _ = happyReduce_37

action_153 (57) = happyShift action_176
action_153 (29) = happyGoto action_175
action_153 _ = happyReduce_42

action_154 _ = happyReduce_38

action_155 (71) = happyShift action_22
action_155 (79) = happyShift action_23
action_155 (81) = happyShift action_24
action_155 (83) = happyShift action_25
action_155 (87) = happyShift action_27
action_155 (89) = happyShift action_28
action_155 (103) = happyShift action_29
action_155 (33) = happyGoto action_174
action_155 (34) = happyGoto action_21
action_155 _ = happyFail

action_156 (72) = happyShift action_173
action_156 _ = happyFail

action_157 (75) = happyShift action_172
action_157 (36) = happyGoto action_171
action_157 _ = happyReduce_59

action_158 (69) = happyShift action_170
action_158 (38) = happyGoto action_169
action_158 _ = happyReduce_62

action_159 _ = happyReduce_100

action_160 _ = happyReduce_103

action_161 (56) = happyShift action_38
action_161 (62) = happyShift action_39
action_161 (69) = happyShift action_40
action_161 (96) = happyShift action_41
action_161 (97) = happyShift action_42
action_161 (98) = happyShift action_43
action_161 (99) = happyShift action_44
action_161 (102) = happyShift action_45
action_161 (103) = happyShift action_46
action_161 (104) = happyShift action_47
action_161 (105) = happyShift action_48
action_161 (106) = happyShift action_49
action_161 (107) = happyShift action_50
action_161 (41) = happyGoto action_168
action_161 (42) = happyGoto action_33
action_161 (43) = happyGoto action_34
action_161 (45) = happyGoto action_35
action_161 (47) = happyGoto action_36
action_161 (49) = happyGoto action_37
action_161 _ = happyFail

action_162 _ = happyReduce_90

action_163 _ = happyReduce_89

action_164 _ = happyReduce_88

action_165 (70) = happyShift action_167
action_165 _ = happyFail

action_166 _ = happyReduce_13

action_167 _ = happyReduce_87

action_168 (61) = happyShift action_86
action_168 (78) = happyShift action_161
action_168 (54) = happyGoto action_192
action_168 _ = happyReduce_106

action_169 (59) = happyShift action_191
action_169 _ = happyFail

action_170 (103) = happyShift action_190
action_170 (39) = happyGoto action_189
action_170 _ = happyFail

action_171 _ = happyReduce_57

action_172 (102) = happyShift action_158
action_172 (37) = happyGoto action_188
action_172 _ = happyFail

action_173 _ = happyReduce_55

action_174 _ = happyReduce_49

action_175 _ = happyReduce_40

action_176 (90) = happyShift action_77
action_176 (91) = happyShift action_78
action_176 (92) = happyShift action_79
action_176 (93) = happyShift action_80
action_176 (103) = happyShift action_81
action_176 (13) = happyGoto action_187
action_176 _ = happyFail

action_177 _ = happyReduce_36

action_178 (71) = happyShift action_22
action_178 (79) = happyShift action_23
action_178 (81) = happyShift action_24
action_178 (83) = happyShift action_25
action_178 (85) = happyShift action_186
action_178 (87) = happyShift action_27
action_178 (89) = happyShift action_28
action_178 (103) = happyShift action_29
action_178 (31) = happyGoto action_184
action_178 (32) = happyGoto action_185
action_178 (33) = happyGoto action_20
action_178 (34) = happyGoto action_21
action_178 _ = happyReduce_48

action_179 (72) = happyShift action_183
action_179 _ = happyFail

action_180 _ = happyReduce_32

action_181 _ = happyReduce_29

action_182 _ = happyReduce_25

action_183 _ = happyReduce_20

action_184 _ = happyReduce_21

action_185 (101) = happyShift action_200
action_185 _ = happyFail

action_186 (71) = happyShift action_22
action_186 (79) = happyShift action_23
action_186 (81) = happyShift action_24
action_186 (83) = happyShift action_25
action_186 (87) = happyShift action_27
action_186 (89) = happyShift action_28
action_186 (103) = happyShift action_29
action_186 (32) = happyGoto action_199
action_186 (33) = happyGoto action_20
action_186 (34) = happyGoto action_21
action_186 _ = happyReduce_48

action_187 (57) = happyShift action_176
action_187 (29) = happyGoto action_198
action_187 _ = happyReduce_42

action_188 (75) = happyShift action_172
action_188 (36) = happyGoto action_197
action_188 _ = happyReduce_59

action_189 (70) = happyShift action_196
action_189 _ = happyFail

action_190 (78) = happyShift action_195
action_190 (40) = happyGoto action_194
action_190 _ = happyReduce_65

action_191 (71) = happyShift action_22
action_191 (79) = happyShift action_23
action_191 (81) = happyShift action_24
action_191 (83) = happyShift action_25
action_191 (87) = happyShift action_27
action_191 (89) = happyShift action_28
action_191 (103) = happyShift action_29
action_191 (33) = happyGoto action_193
action_191 (34) = happyGoto action_21
action_191 _ = happyFail

action_192 _ = happyReduce_105

action_193 _ = happyReduce_60

action_194 _ = happyReduce_63

action_195 (103) = happyShift action_203
action_195 _ = happyFail

action_196 _ = happyReduce_61

action_197 _ = happyReduce_58

action_198 _ = happyReduce_41

action_199 (101) = happyShift action_202
action_199 _ = happyFail

action_200 (56) = happyShift action_38
action_200 (62) = happyShift action_39
action_200 (69) = happyShift action_40
action_200 (96) = happyShift action_41
action_200 (97) = happyShift action_42
action_200 (98) = happyShift action_43
action_200 (99) = happyShift action_44
action_200 (102) = happyShift action_45
action_200 (103) = happyShift action_46
action_200 (104) = happyShift action_47
action_200 (105) = happyShift action_48
action_200 (106) = happyShift action_49
action_200 (107) = happyShift action_50
action_200 (41) = happyGoto action_201
action_200 (42) = happyGoto action_33
action_200 (43) = happyGoto action_34
action_200 (45) = happyGoto action_35
action_200 (47) = happyGoto action_36
action_200 (49) = happyGoto action_37
action_200 _ = happyFail

action_201 (61) = happyShift action_86
action_201 (77) = happyShift action_206
action_201 _ = happyFail

action_202 (56) = happyShift action_38
action_202 (62) = happyShift action_39
action_202 (69) = happyShift action_40
action_202 (96) = happyShift action_41
action_202 (97) = happyShift action_42
action_202 (98) = happyShift action_43
action_202 (99) = happyShift action_44
action_202 (102) = happyShift action_45
action_202 (103) = happyShift action_46
action_202 (104) = happyShift action_47
action_202 (105) = happyShift action_48
action_202 (106) = happyShift action_49
action_202 (107) = happyShift action_50
action_202 (41) = happyGoto action_205
action_202 (42) = happyGoto action_33
action_202 (43) = happyGoto action_34
action_202 (45) = happyGoto action_35
action_202 (47) = happyGoto action_36
action_202 (49) = happyGoto action_37
action_202 _ = happyFail

action_203 (78) = happyShift action_195
action_203 (40) = happyGoto action_204
action_203 _ = happyReduce_65

action_204 _ = happyReduce_64

action_205 (61) = happyShift action_86
action_205 (77) = happyShift action_207
action_205 _ = happyFail

action_206 _ = happyReduce_46

action_207 (86) = happyShift action_208
action_207 _ = happyFail

action_208 _ = happyReduce_45

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (M_prog happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn30  happy_var_2)
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
happyReduction_7 (HappyAbsSyn24  happy_var_1)
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
	(HappyAbsSyn41  happy_var_2) `HappyStk`
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
happyReduction_21 (HappyAbsSyn31  happy_var_2)
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
		 (happy_var_1++happy_var_2
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
		 (happy_var_2++happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_0  18 happyReduction_26
happyReduction_26  =  HappyAbsSyn18
		 ([]
	)

happyReduce_27 = happySpecReduce_3  19 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (map (\x -> ((fst x), (snd x), happy_var_3)) happy_var_1
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  20 happyReduction_28
happyReduction_28 (HappyAbsSyn21  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn20
		 ([happy_var_1]++happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  21 happyReduction_29
happyReduction_29 (HappyAbsSyn21  happy_var_3)
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn21
		 ([happy_var_2]++happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_0  21 happyReduction_30
happyReduction_30  =  HappyAbsSyn21
		 ([]
	)

happyReduce_31 = happySpecReduce_2  22 happyReduction_31
happyReduction_31 (HappyAbsSyn23  happy_var_2)
	(HappyTerminal (ID _ happy_var_1))
	 =  HappyAbsSyn22
		 ((happy_var_1, happy_var_2)
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  23 happyReduction_32
happyReduction_32 (HappyAbsSyn23  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (happy_var_3+1
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_0  23 happyReduction_33
happyReduction_33  =  HappyAbsSyn23
		 (0
	)

happyReduce_34 = happyReduce 4 24 happyReduction_34
happyReduction_34 ((HappyAbsSyn25  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn24
		 (M_data (happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_2  25 happyReduction_35
happyReduction_35 (HappyAbsSyn26  happy_var_2)
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn25
		 ([happy_var_1]++happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  26 happyReduction_36
happyReduction_36 (HappyAbsSyn26  happy_var_3)
	(HappyAbsSyn27  happy_var_2)
	_
	 =  HappyAbsSyn26
		 ([happy_var_2]++happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_0  26 happyReduction_37
happyReduction_37  =  HappyAbsSyn26
		 ([]
	)

happyReduce_38 = happySpecReduce_3  27 happyReduction_38
happyReduction_38 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (CID _ happy_var_1))
	 =  HappyAbsSyn27
		 ((happy_var_1, happy_var_3)
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  27 happyReduction_39
happyReduction_39 (HappyTerminal (CID _ happy_var_1))
	 =  HappyAbsSyn27
		 ((happy_var_1, [])
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_2  28 happyReduction_40
happyReduction_40 (HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn28
		 ([happy_var_1]++happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  29 happyReduction_41
happyReduction_41 (HappyAbsSyn29  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn29
		 ([happy_var_2]++happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_0  29 happyReduction_42
happyReduction_42  =  HappyAbsSyn29
		 ([]
	)

happyReduce_43 = happySpecReduce_3  30 happyReduction_43
happyReduction_43 _
	(HappyAbsSyn32  happy_var_2)
	_
	 =  HappyAbsSyn30
		 (happy_var_2
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  30 happyReduction_44
happyReduction_44 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happyReduce 6 31 happyReduction_45
happyReduction_45 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn41  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn31
		 (happy_var_2++[(M_return happy_var_4)]
	) `HappyStk` happyRest

happyReduce_46 = happyReduce 4 31 happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyAbsSyn41  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn31
		 (happy_var_1++[(M_return happy_var_3)]
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_3  32 happyReduction_47
happyReduction_47 (HappyAbsSyn32  happy_var_3)
	_
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn32
		 ([happy_var_1]++happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_0  32 happyReduction_48
happyReduction_48  =  HappyAbsSyn32
		 ([]
	)

happyReduce_49 = happyReduce 6 33 happyReduction_49
happyReduction_49 ((HappyAbsSyn33  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn41  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (M_cond (happy_var_2, happy_var_4, happy_var_6)
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 4 33 happyReduction_50
happyReduction_50 ((HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn41  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (M_while (happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_51 = happySpecReduce_2  33 happyReduction_51
happyReduction_51 (HappyAbsSyn34  happy_var_2)
	_
	 =  HappyAbsSyn33
		 (M_read happy_var_2
	)
happyReduction_51 _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  33 happyReduction_52
happyReduction_52 (HappyAbsSyn41  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn33
		 (let tpl = happy_var_1 in M_ass ((fst tpl), (snd tpl), happy_var_3)
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_2  33 happyReduction_53
happyReduction_53 (HappyAbsSyn41  happy_var_2)
	_
	 =  HappyAbsSyn33
		 (M_print happy_var_2
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  33 happyReduction_54
happyReduction_54 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn33
		 (M_block happy_var_2
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happyReduce 6 33 happyReduction_55
happyReduction_55 (_ `HappyStk`
	(HappyAbsSyn35  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn41  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (M_case (happy_var_2, happy_var_5)
	) `HappyStk` happyRest

happyReduce_56 = happySpecReduce_2  34 happyReduction_56
happyReduction_56 (HappyAbsSyn12  happy_var_2)
	(HappyTerminal (ID _ happy_var_1))
	 =  HappyAbsSyn34
		 ((happy_var_1, happy_var_2)
	)
happyReduction_56 _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_2  35 happyReduction_57
happyReduction_57 (HappyAbsSyn36  happy_var_2)
	(HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn35
		 ([happy_var_1]++happy_var_2
	)
happyReduction_57 _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  36 happyReduction_58
happyReduction_58 (HappyAbsSyn36  happy_var_3)
	(HappyAbsSyn37  happy_var_2)
	_
	 =  HappyAbsSyn36
		 ([happy_var_2]++happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_0  36 happyReduction_59
happyReduction_59  =  HappyAbsSyn36
		 ([]
	)

happyReduce_60 = happyReduce 4 37 happyReduction_60
happyReduction_60 ((HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_2) `HappyStk`
	(HappyTerminal (CID _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn37
		 ((happy_var_1, happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_61 = happySpecReduce_3  38 happyReduction_61
happyReduction_61 _
	(HappyAbsSyn39  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (happy_var_2
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_0  38 happyReduction_62
happyReduction_62  =  HappyAbsSyn38
		 ([]
	)

happyReduce_63 = happySpecReduce_2  39 happyReduction_63
happyReduction_63 (HappyAbsSyn40  happy_var_2)
	(HappyTerminal (ID _ happy_var_1))
	 =  HappyAbsSyn39
		 ([happy_var_1]++happy_var_2
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  40 happyReduction_64
happyReduction_64 (HappyAbsSyn40  happy_var_3)
	(HappyTerminal (ID _ happy_var_2))
	_
	 =  HappyAbsSyn40
		 ([happy_var_2]++happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_0  40 happyReduction_65
happyReduction_65  =  HappyAbsSyn40
		 ([]
	)

happyReduce_66 = happySpecReduce_3  41 happyReduction_66
happyReduction_66 (HappyAbsSyn42  happy_var_3)
	_
	(HappyAbsSyn41  happy_var_1)
	 =  HappyAbsSyn41
		 (M_app (M_or, [happy_var_1]++[happy_var_3])
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  41 happyReduction_67
happyReduction_67 (HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn41
		 (happy_var_1
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  42 happyReduction_68
happyReduction_68 (HappyAbsSyn43  happy_var_3)
	_
	(HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn42
		 (M_app (M_and, [happy_var_1]++[happy_var_3])
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  42 happyReduction_69
happyReduction_69 (HappyAbsSyn43  happy_var_1)
	 =  HappyAbsSyn42
		 (happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_2  43 happyReduction_70
happyReduction_70 (HappyAbsSyn43  happy_var_2)
	_
	 =  HappyAbsSyn43
		 (M_app (M_not, [happy_var_2])
	)
happyReduction_70 _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  43 happyReduction_71
happyReduction_71 (HappyAbsSyn45  happy_var_3)
	(HappyAbsSyn44  happy_var_2)
	(HappyAbsSyn45  happy_var_1)
	 =  HappyAbsSyn43
		 (M_app (happy_var_2, [happy_var_1]++[happy_var_3])
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_1  43 happyReduction_72
happyReduction_72 (HappyAbsSyn45  happy_var_1)
	 =  HappyAbsSyn43
		 (happy_var_1
	)
happyReduction_72 _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_1  44 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn44
		 (M_eq
	)

happyReduce_74 = happySpecReduce_1  44 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn44
		 (M_lt
	)

happyReduce_75 = happySpecReduce_1  44 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn44
		 (M_gt
	)

happyReduce_76 = happySpecReduce_1  44 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn44
		 (M_le
	)

happyReduce_77 = happySpecReduce_1  44 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn44
		 (M_ge
	)

happyReduce_78 = happySpecReduce_3  45 happyReduction_78
happyReduction_78 (HappyAbsSyn47  happy_var_3)
	(HappyAbsSyn46  happy_var_2)
	(HappyAbsSyn45  happy_var_1)
	 =  HappyAbsSyn45
		 (M_app (happy_var_2, [happy_var_1]++[happy_var_3])
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_1  45 happyReduction_79
happyReduction_79 (HappyAbsSyn47  happy_var_1)
	 =  HappyAbsSyn45
		 (happy_var_1
	)
happyReduction_79 _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_1  46 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn46
		 (M_add
	)

happyReduce_81 = happySpecReduce_1  46 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn46
		 (M_sub
	)

happyReduce_82 = happySpecReduce_3  47 happyReduction_82
happyReduction_82 (HappyAbsSyn49  happy_var_3)
	(HappyAbsSyn48  happy_var_2)
	(HappyAbsSyn47  happy_var_1)
	 =  HappyAbsSyn47
		 (M_app (happy_var_2, [happy_var_1]++[happy_var_3])
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_1  47 happyReduction_83
happyReduction_83 (HappyAbsSyn49  happy_var_1)
	 =  HappyAbsSyn47
		 (happy_var_1
	)
happyReduction_83 _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_1  48 happyReduction_84
happyReduction_84 _
	 =  HappyAbsSyn48
		 (M_mul
	)

happyReduce_85 = happySpecReduce_1  48 happyReduction_85
happyReduction_85 _
	 =  HappyAbsSyn48
		 (M_div
	)

happyReduce_86 = happySpecReduce_3  49 happyReduction_86
happyReduction_86 _
	(HappyAbsSyn41  happy_var_2)
	_
	 =  HappyAbsSyn49
		 (happy_var_2
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happyReduce 5 49 happyReduction_87
happyReduction_87 (_ `HappyStk`
	(HappyAbsSyn23  happy_var_4) `HappyStk`
	(HappyTerminal (ID _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn49
		 (M_size (happy_var_3, happy_var_4)
	) `HappyStk` happyRest

happyReduce_88 = happyReduce 4 49 happyReduction_88
happyReduction_88 (_ `HappyStk`
	(HappyAbsSyn41  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn49
		 (M_app (M_float, [happy_var_3])
	) `HappyStk` happyRest

happyReduce_89 = happyReduce 4 49 happyReduction_89
happyReduction_89 (_ `HappyStk`
	(HappyAbsSyn41  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn49
		 (M_app (M_floor, [happy_var_3])
	) `HappyStk` happyRest

happyReduce_90 = happyReduce 4 49 happyReduction_90
happyReduction_90 (_ `HappyStk`
	(HappyAbsSyn41  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn49
		 (M_app (M_ceil, [happy_var_3])
	) `HappyStk` happyRest

happyReduce_91 = happySpecReduce_2  49 happyReduction_91
happyReduction_91 (HappyAbsSyn50  happy_var_2)
	(HappyTerminal (ID _ happy_var_1))
	 =  HappyAbsSyn49
		 (let tpl = happy_var_2 in case (fst tpl) of
                                                                    NonFunctionDetected -> M_id (happy_var_1, (snd tpl)) 
                                                                    FunctionDetected -> M_app ((M_fn happy_var_1), (snd tpl))
	)
happyReduction_91 _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_2  49 happyReduction_92
happyReduction_92 (HappyAbsSyn52  happy_var_2)
	(HappyTerminal (CID _ happy_var_1))
	 =  HappyAbsSyn49
		 (M_app ((M_cid happy_var_1), happy_var_2)
	)
happyReduction_92 _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_1  49 happyReduction_93
happyReduction_93 (HappyTerminal (IVAL _ happy_var_1))
	 =  HappyAbsSyn49
		 (M_ival happy_var_1
	)
happyReduction_93 _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_1  49 happyReduction_94
happyReduction_94 (HappyTerminal (RVAL _ happy_var_1))
	 =  HappyAbsSyn49
		 (M_rval happy_var_1
	)
happyReduction_94 _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_1  49 happyReduction_95
happyReduction_95 (HappyTerminal (BVAL _ happy_var_1))
	 =  HappyAbsSyn49
		 (M_bval happy_var_1
	)
happyReduction_95 _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_1  49 happyReduction_96
happyReduction_96 (HappyTerminal (CVAL _ happy_var_1))
	 =  HappyAbsSyn49
		 (M_cval happy_var_1
	)
happyReduction_96 _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_2  49 happyReduction_97
happyReduction_97 (HappyAbsSyn49  happy_var_2)
	_
	 =  HappyAbsSyn49
		 (M_app (M_neg, [happy_var_2])
	)
happyReduction_97 _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_1  50 happyReduction_98
happyReduction_98 (HappyAbsSyn51  happy_var_1)
	 =  HappyAbsSyn50
		 ((FunctionDetected, happy_var_1)
	)
happyReduction_98 _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_1  50 happyReduction_99
happyReduction_99 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn50
		 ((NonFunctionDetected, happy_var_1)
	)
happyReduction_99 _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_3  51 happyReduction_100
happyReduction_100 _
	(HappyAbsSyn53  happy_var_2)
	_
	 =  HappyAbsSyn51
		 (happy_var_2
	)
happyReduction_100 _ _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_1  52 happyReduction_101
happyReduction_101 (HappyAbsSyn51  happy_var_1)
	 =  HappyAbsSyn52
		 (happy_var_1
	)
happyReduction_101 _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_0  52 happyReduction_102
happyReduction_102  =  HappyAbsSyn52
		 ([]
	)

happyReduce_103 = happySpecReduce_2  53 happyReduction_103
happyReduction_103 (HappyAbsSyn54  happy_var_2)
	(HappyAbsSyn41  happy_var_1)
	 =  HappyAbsSyn53
		 ([happy_var_1]++happy_var_2
	)
happyReduction_103 _ _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_0  53 happyReduction_104
happyReduction_104  =  HappyAbsSyn53
		 ([]
	)

happyReduce_105 = happySpecReduce_3  54 happyReduction_105
happyReduction_105 (HappyAbsSyn54  happy_var_3)
	(HappyAbsSyn41  happy_var_2)
	_
	 =  HappyAbsSyn54
		 ([happy_var_2]++happy_var_3
	)
happyReduction_105 _ _ _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_0  54 happyReduction_106
happyReduction_106  =  HappyAbsSyn54
		 ([]
	)

happyNewToken action sts stk [] =
	action 108 108 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	ADD _ -> cont 55;
	SUB _ -> cont 56;
	MUL _ -> cont 57;
	DIV _ -> cont 58;
	ARROW _ -> cont 59;
	AND _ -> cont 60;
	OR _ -> cont 61;
	NOT _ -> cont 62;
	EQUAL _ -> cont 63;
	LT _ -> cont 64;
	GT _ -> cont 65;
	LE _ -> cont 66;
	GE _ -> cont 67;
	ASSIGN _ -> cont 68;
	LPAR _ -> cont 69;
	RPAR _ -> cont 70;
	CLPAR _ -> cont 71;
	CRPAR _ -> cont 72;
	SLPAR _ -> cont 73;
	SRPAR _ -> cont 74;
	SLASH _ -> cont 75;
	COLON _ -> cont 76;
	SEMICOLON _ -> cont 77;
	COMMA _ -> cont 78;
	IF _ -> cont 79;
	THEN _ -> cont 80;
	WHILE _ -> cont 81;
	DO _ -> cont 82;
	READ _ -> cont 83;
	ELSE _ -> cont 84;
	BEGIN _ -> cont 85;
	END _ -> cont 86;
	CASE _ -> cont 87;
	OF _ -> cont 88;
	PRINT _ -> cont 89;
	INT _ -> cont 90;
	BOOL _ -> cont 91;
	CHAR _ -> cont 92;
	REAL _ -> cont 93;
	VAR _ -> cont 94;
	DATA _ -> cont 95;
	SIZE _ -> cont 96;
	FLOAT _ -> cont 97;
	FLOOR _ -> cont 98;
	CEIL _ -> cont 99;
	FUN _ -> cont 100;
	RETURN _ -> cont 101;
	CID _ happy_dollar_dollar -> cont 102;
	ID _ happy_dollar_dollar -> cont 103;
	RVAL _ happy_dollar_dollar -> cont 104;
	IVAL _ happy_dollar_dollar -> cont 105;
	BVAL _ happy_dollar_dollar -> cont 106;
	CVAL _ happy_dollar_dollar -> cont 107;
	_ -> happyError' (tk:tks)
	}

happyError_ 108 tk tks = happyError' tks
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
