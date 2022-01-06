INSERT INTO `positions` (`id`, `salary`, `working_hours`) VALUES
	(0, 1000.00, 40),
    (0, 2000.00, 30),
    (0, 3000.00, 30),
    (0, 4000.00, 34),
    (0, 5000.00, 44),
    (0, 6000.00, 50);

INSERT INTO `employee` (`id`, `username`, `hash_pass`, `pin`, `address`, `remaining_days_off`, `position_id`) VALUES
(0, "alo", "sdfsdf", "123", "ul. o", 10, 1),
(0, "balo", "sdfz", "126", "ul. a", 10, 3),
(0, "salo", "fsdg", "128", "ul. b", 13, 4),
(0, "dalo", "ery", "133", "ul. v", 14, 5),
(0, "talo", "trey43", "223", "ul. c", 15, 2);

INSERT INTO `client` (`id`, `username`, `hash_pass`, `pin`, `address`) VALUES
	(0, "Ss", "wtwt", "222", "ul. a"),
    (0, "Bb", "hfeher", "000", "ul. b"),
    (0, "Ll", "sgsfg", "345", "ul. v"),
    (0, "Aa", "oro", "231", "ul. c"),
    (0, "Ww", "vfs", "111", "ul. a"),
    (0, "Pp", "sdvsd", "234", "ul. v"),
    (0, "Qq", "weqe", "251", "ul. t");

INSERT INTO `client_employee` (`client_id`, `employee_id`) VALUES
	(1, 1),
    (2, 2),
    (3, 4),
    (4, 4),
    (5, 5),
    (6, 1),
    (7, 3);
    
INSERT INTO `account` (`id`, `balance`, `dt`) VALUES
	(0, 1233, "2018-10-20"),
    (0, 4235, "2019-11-08"),
    (0, 54636,"2018-12-22"),
    (0, 25326,"2019-10-20"),
    (0, 2352, "2018-12-20"),
    (0, 5375, "2020-10-30"),
    (0, 2475, "2018-04-20"),
    (0, 8254, "2020-10-13"),
    (0, 7514, "2018-08-20"),
    (0, 8888, "2021-01-15"),
    (0, 4564, "2017-09-09");
    
INSERT INTO `account_client` (`account_id`, `client_id`) VALUES
	(1, 2),
    (2, 1),
    (3, 4),
    (4, 5),
    (5, 4),
    (6, 7),
    (7, 2),
    (8, 5),
    (9, 6),
    (10, 3),
    (11, 1);

INSERT INTO `deposit` (`id`, `dt`, `sum`) VALUES
	(0, "2021-12-11", 1231),
    (0, "2021-12-21", 3526),
    (0, "2021-12-31", 6347),
    (0, "2021-12-14", 2352),
    (0, "2021-12-15", 7535),
    (0, "2021-12-16", 1145);

INSERT INTO `draw` (`id`, `dt`, `sum`) VALUES
	(0, "2021-12-04", 1116),
    (0, "2021-12-03", 1143),
    (0, "2021-12-21", 1124),
    (0, "2021-12-14", 1144),
    (0, "2021-12-12", 1145),
    (0, "2021-12-16", 1134);

INSERT INTO `account_deposit` (`deposit_id`, `account_id`) VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);

INSERT INTO `account_draw` (`draw_id`, `account_id`) VALUES
	(6, 1),
    (5, 2),
    (4, 3),
    (3, 4),
    (2, 5),
    (1, 6);