-- this is move to optional because ytdb use `pool_creature` metod wich it make spawn the creature randonly
-- this patch only make the drake fly in the same way point
-- Path time-lost protodrake
DELETE FROM `creature` WHERE `id`=32491;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(98440, 32491, 571, 1, 1, 0, 0, 7537.36, -854.089, 982.299, 3.19715, 86400, 0, 0, 18900, 0, 0, 2); -- respawn 24h

UPDATE `creature_template` SET `speed_walk`=2, `speed_run`=2 where `entry`=32491;

DELETE FROM `creature_addon` WHERE `guid`=98440;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (98440,139111);

DELETE FROM `waypoint_data` WHERE `id`=139111; 
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES 
(139111, 4, 7327.08, -942.896, 974.397, 0, 0, 0, 100, 0),
(139111, 3, 7385.49, -878.718, 980.648, 0, 0, 0, 100, 0),
(139111, 2, 7474.28, -857.317, 977.674, 0, 0, 0, 100, 0),
(139111, 1, 7503.86, -856.766, 974.458, 0, 0, 0, 100, 0),
(139111, 5, 7304.96, -1048.66, 986.581, 0, 0, 0, 100, 0),
(139111, 6, 7320.79, -1137.46, 977.352, 0, 0, 0, 100, 0),
(139111, 7, 7325.62, -1190.25, 966.615, 0, 0, 0, 100, 0),
(139111, 8, 7308.36, -1240.42, 966.731, 0, 0, 0, 100, 0),
(139111, 9, 7264.87, -1299.48, 956.037, 0, 0, 0, 100, 0),
(139111, 10, 7228.44, -1360.63, 953.079, 0, 0, 0, 100, 0),
(139111, 11, 7200.34, -1419.23, 956.566, 0, 0, 0, 100, 0),
(139111, 12, 7176.4, -1470.62, 953.531, 0, 0, 0, 100, 0),
(139111, 13, 7205.6, -1503.5, 959.704, 0, 0, 0, 100, 0),
(139111, 14, 7268.69, -1537.84, 981.537, 0, 0, 0, 100, 0),
(139111, 15, 7328.43, -1506.58, 978.2, 0, 0, 0, 100, 0),
(139111, 16, 7418.04, -1460.2, 975.591, 0, 0, 0, 100, 0),
(139111, 17, 7485.83, -1440.65, 993.714, 0, 0, 0, 100, 0),
(139111, 18, 7558.21, -1390.25, 1005.14, 0, 0, 0, 100, 0),
(139111, 19, 7594.67, -1330.07, 1001.81, 0, 0, 0, 100, 0),
(139111, 20, 7636.35, -1254.23, 1004.71, 0, 0, 0, 100, 0),
(139111, 21, 7666.21, -1210.42, 1002.2, 0, 0, 0, 100, 0),
(139111, 22, 7717.33, -1139.02, 998.005, 0, 0, 0, 100, 0),
(139111, 23, 7758.72, -1099.12, 1003.15, 0, 0, 0, 100, 0),
(139111, 24, 7853.67, -1055.75, 1065.35, 0, 0, 0, 100, 0),
(139111, 25, 7905.68, -1031.95, 1083.13, 0, 0, 0, 100, 0),
(139111, 26, 7964.63, -1001.05, 1089.97, 0, 0, 0, 100, 0),
(139111, 27, 8016.11, -981.888, 1052.66, 0, 0, 0, 100, 0),
(139111, 28, 8063.91, -983.353, 1015.5, 0, 0, 0, 100, 0),
(139111, 29, 8171.07, -934.563, 995.578, 0, 0, 0, 100, 0),
(139111, 30, 8199.97, -850.786, 999.696, 0, 0, 0, 100, 0),
(139111, 31, 8220.44, -782.61, 996.339, 0, 0, 0, 100, 0),
(139111, 32, 8198.35, -729.709, 993.536, 0, 0, 0, 100, 0),
(139111, 33, 8164.23, -678.373, 990.623, 0, 0, 0, 100, 0),
(139111, 34, 8116.52, -620.548, 987.072, 0, 0, 0, 100, 0),
(139111, 35, 8080.91, -590.318, 961.444, 0, 0, 0, 100, 0),
(139111, 36, 8025.32, -559.044, 958.409, 0, 0, 0, 100, 0),
(139111, 37, 7934.42, -513.857, 953.61, 0, 0, 0, 100, 0),
(139111, 38, 7874.06, -433.282, 948.766, 0, 0, 0, 100, 0),
(139111, 39, 7821.26, -285.08, 941.347, 0, 0, 0, 100, 0),
(139111, 40, 7773.6, -208.615, 925.122, 0, 0, 0, 100, 0),
(139111, 41, 7718.75, -158.632, 910.074, 0, 0, 0, 100, 0),
(139111, 42, 7665.72, -134.088, 893.788, 0, 0, 0, 100, 0),
(139111, 43, 7589.5, -98.6794, 884.648, 0, 0, 0, 100, 0),
(139111, 44, 7492.43, -87.6879, 865.72, 0, 0, 0, 100, 0),
(139111, 45, 7388.29, -95.9055, 844.498, 0, 0, 0, 100, 0),
(139111, 46, 7240.53, -132.912, 852.502, 0, 0, 0, 100, 0),
(139111, 47, 7179.48, -170.757, 849.114, 0, 0, 0, 100, 0),
(139111, 48, 7128.93, -221.296, 845.666, 0, 0, 0, 100, 0),
(139111, 49, 7110.42, -260.984, 843.577, 0, 0, 0, 100, 0),
(139111, 50, 7101.34, -312.384, 841.101, 0, 0, 0, 100, 0),
(139111, 51, 7089.43, -377.234, 826.201, 0, 0, 0, 100, 0),
(139111, 52, 7084.02, -443.643, 792.785, 0, 0, 0, 100, 0),
(139111, 53, 7083.03, -489.624, 783.07, 0, 0, 0, 100, 0),
(139111, 54, 7080.87, -590.638, 764.014, 0, 0, 0, 100, 0),
(139111, 55, 7065.05, -676.21, 760.991, 0, 0, 0, 100, 0),
(139111, 56, 6978.95, -757.706, 759.465, 0, 0, 0, 100, 0),
(139111, 57, 6926.67, -765.875, 756.956, 0, 0, 0, 100, 0),
(139111, 58, 6861.22, -771.22, 757.357, 0, 0, 0, 100, 0),
(139111, 59, 6807.58, -775.6, 760.469, 0, 0, 0, 100, 0),
(139111, 60, 6743.8, -785.868, 757.409, 0, 0, 0, 100, 0),
(139111, 61, 6687.89, -795.147, 751.151, 0, 0, 0, 100, 0),
(139111, 62, 6639.95, -813.165, 725.154, 0, 0, 0, 100, 0),
(139111, 63, 6605.2, -826.225, 688.031, 0, 0, 0, 100, 0),
(139111, 64, 6512.56, -861.041, 628.843, 0, 0, 0, 100, 0),
(139111, 65, 6451.99, -883.808, 605.176, 0, 0, 0, 100, 0),
(139111, 66, 6415.95, -915.482, 547.719, 0, 0, 0, 100, 0),
(139111, 67, 6420.17, -963.738, 511.286, 0, 0, 0, 100, 0),
(139111, 68, 6414.8, -1034.58, 493.634, 0, 0, 0, 100, 0),
(139111, 69, 6408.01, -1143.4, 484.109, 0, 0, 0, 100, 0),
(139111, 70, 6393.39, -1257.52, 478.683, 0, 0, 0, 100, 0),
(139111, 71, 6387.67, -1387.35, 517.509, 0, 0, 0, 100, 0),
(139111, 72, 6411, -1395.61, 542.258, 0, 0, 0, 100, 0),
(139111, 73, 6564.67, -1450.02, 676.977, 0, 0, 0, 100, 0),
(139111, 74, 6594.86, -1460.71, 701.616, 0, 0, 0, 100, 0),
(139111, 75, 6640.73, -1476.95, 738.558, 0, 0, 0, 100, 0),
(139111, 76, 6682.87, -1491.87, 775.246, 0, 0, 0, 100, 0),
(139111, 77, 6741.23, -1509.22, 814.133, 0, 0, 0, 100, 0),
(139111, 78, 6788.69, -1526.15, 854.279, 0, 0, 0, 100, 0),
(139111, 79, 6813.13, -1534.87, 875.291, 0, 0, 0, 100, 0),
(139111, 80, 6908.43, -1568.86, 870.519, 0, 0, 0, 100, 0),
(139111, 81, 6940.94, -1580.46, 897.684, 0, 0, 0, 100, 0),
(139111, 82, 6990.34, -1598.08, 895.211, 0, 0, 0, 100, 0),
(139111, 83, 7053.23, -1590.21, 923.16, 0, 0, 0, 100, 0),
(139111, 84, 7083.66, -1561.51, 944.018, 0, 0, 0, 100, 0),
(139111, 85, 7103.84, -1542.48, 961.914, 0, 0, 0, 100, 0),
(139111, 86, 7151.78, -1497.26, 958.806, 0, 0, 0, 100, 0),
(139111, 87, 7199, -1452.73, 949.402, 0, 0, 0, 100, 0),
(139111, 88, 7248.36, -1406.18, 950.141, 0, 0, 0, 100, 0),
(139111, 89, 7293.73, -1363.39, 947.2, 0, 0, 0, 100, 0),
(139111, 90, 7368.66, -1355.03, 949.293, 0, 0, 0, 100, 0),
(139111, 91, 7475.82, -1325.68, 951.012, 0, 0, 0, 100, 0),
(139111, 92, 7584.79, -1275.39, 968.346, 0, 0, 0, 100, 0),
(139111, 93, 7618.68, -1210.81, 964.907, 0, 0, 0, 100, 0),
(139111, 94, 7651.48, -1148.31, 961.578, 0, 0, 0, 100, 0),
(139111, 95, 7675.21, -1088.75, 947.033, 0, 0, 0, 100, 0),
(139111, 96, 7684.79, -1006.75, 943.092, 0, 0, 0, 100, 0);

-- delete `pool_creature` if not there are many consol error base in the creature spawn system of ytdb
DELETE FROM `pool_creature` WHERE `guid` IN (90994, 91002, 91001, 90993, 15693, 90992, 90999, 91061, 91060, 91000, 54550, 54551, 54548, 54549, 51772, 15636, 90998, 90995, 90996, 90997);