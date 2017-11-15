library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ROM_OBJ_1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of ROM_OBJ_1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"4C",X"56",X"5A",X"BA",X"BC",X"BC",X"18",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"10",X"12",X"1C",X"78",X"1C",X"12",X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0E",X"1F",X"3B",X"7F",X"7B",X"FC",X"D5",X"FB",X"00",X"00",X"00",X"18",X"30",X"7C",X"FE",X"FE",
		X"7D",X"39",X"01",X"0F",X"00",X"00",X"00",X"00",X"F8",X"F8",X"F0",X"F8",X"F0",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"03",X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",
		X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",
		X"03",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"03",X"07",X"07",
		X"03",X"00",X"00",X"00",X"00",X"03",X"07",X"07",X"00",X"00",X"00",X"00",X"00",X"03",X"87",X"87",
		X"03",X"00",X"00",X"00",X"00",X"03",X"87",X"87",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"03",X"00",X"00",X"00",X"00",X"00",X"80",X"80",
		X"00",X"00",X"00",X"00",X"00",X"03",X"07",X"07",X"03",X"00",X"00",X"00",X"00",X"03",X"07",X"07",
		X"00",X"00",X"00",X"00",X"00",X"03",X"87",X"87",X"03",X"00",X"00",X"00",X"00",X"03",X"87",X"87",
		X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",
		X"03",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"03",X"07",X"07",
		X"03",X"00",X"00",X"00",X"00",X"03",X"07",X"07",X"00",X"00",X"00",X"00",X"00",X"03",X"87",X"87",
		X"03",X"00",X"00",X"00",X"00",X"03",X"87",X"87",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"03",X"00",X"00",X"00",X"00",X"00",X"80",X"80",
		X"00",X"00",X"00",X"00",X"00",X"03",X"07",X"07",X"03",X"00",X"00",X"00",X"00",X"03",X"07",X"07",
		X"00",X"00",X"00",X"00",X"00",X"03",X"87",X"87",X"03",X"00",X"00",X"00",X"00",X"03",X"87",X"87",
		X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",
		X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"00",X"00",X"1C",X"72",X"94",X"84",X"94",X"72",X"1C",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"06",X"0F",X"1B",X"3F",X"7B",X"D4",X"F9",X"7B",X"00",X"80",X"C0",X"C0",X"90",X"90",X"38",X"7C",
		X"7C",X"31",X"03",X"0F",X"03",X"01",X"00",X"00",X"FC",X"FC",X"FE",X"F4",X"F0",X"E0",X"60",X"00",
		X"00",X"00",X"00",X"5A",X"7D",X"7E",X"5D",X"F4",X"00",X"00",X"00",X"08",X"F8",X"F8",X"F8",X"F8",
		X"FC",X"F4",X"5D",X"7E",X"7D",X"5A",X"00",X"00",X"F8",X"F8",X"F8",X"F8",X"F8",X"08",X"00",X"00",
		X"00",X"80",X"D9",X"FF",X"7F",X"7E",X"76",X"7B",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"B8",
		X"3F",X"1F",X"01",X"01",X"01",X"00",X"00",X"00",X"FC",X"FC",X"FC",X"FE",X"F8",X"F0",X"10",X"00",
		X"1F",X"0F",X"1F",X"1F",X"1F",X"1F",X"0D",X"07",X"80",X"C0",X"70",X"F0",X"F0",X"00",X"00",X"00",
		X"1F",X"3F",X"5F",X"5F",X"3F",X"2F",X"03",X"20",X"80",X"C0",X"C0",X"C0",X"C0",X"80",X"00",X"00",
		X"00",X"09",X"1F",X"70",X"34",X"0E",X"03",X"03",X"00",X"80",X"C0",X"E0",X"38",X"18",X"0C",X"8C",
		X"01",X"01",X"01",X"03",X"07",X"02",X"00",X"00",X"8C",X"88",X"80",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"0C",X"3E",X"7E",X"6F",X"7A",X"00",X"00",X"00",X"20",X"78",X"7C",X"7C",X"FC",
		X"7E",X"7A",X"2F",X"FE",X"7E",X"0C",X"00",X"00",X"FC",X"FE",X"7E",X"7C",X"78",X"80",X"00",X"00",
		X"00",X"00",X"00",X"0C",X"7E",X"FE",X"2F",X"79",X"00",X"00",X"00",X"80",X"78",X"7C",X"7E",X"FE",
		X"7F",X"79",X"2F",X"FE",X"7E",X"0C",X"00",X"00",X"FC",X"FC",X"7C",X"7C",X"78",X"20",X"00",X"00",
		X"00",X"0F",X"09",X"1D",X"0D",X"0D",X"0D",X"0D",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"E0",
		X"0C",X"0C",X"0C",X"0C",X"0C",X"00",X"00",X"00",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"0F",X"09",X"11",X"11",X"11",X"11",X"11",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"E0",
		X"10",X"10",X"10",X"10",X"10",X"00",X"00",X"00",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"78",X"78",X"07",X"00",X"00",X"06",X"07",X"03",X"00",X"00",X"80",X"00",X"00",X"C0",X"40",X"48",
		X"01",X"03",X"07",X"06",X"00",X"00",X"FF",X"00",X"4C",X"48",X"40",X"C0",X"00",X"00",X"FC",X"00",
		X"06",X"07",X"01",X"00",X"00",X"0D",X"0F",X"07",X"00",X"80",X"80",X"60",X"10",X"00",X"00",X"20",
		X"03",X"07",X"0F",X"0D",X"00",X"3F",X"00",X"00",X"30",X"20",X"00",X"00",X"00",X"FF",X"00",X"00",
		X"00",X"00",X"00",X"00",X"03",X"03",X"03",X"1E",X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"80",
		X"1D",X"0B",X"04",X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"C0",X"40",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"03",X"03",X"03",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",
		X"1F",X"06",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"40",X"A0",X"00",X"00",X"00",X"00",
		X"00",X"0F",X"0F",X"00",X"00",X"06",X"07",X"03",X"00",X"00",X"00",X"E0",X"00",X"80",X"80",X"90",
		X"01",X"03",X"07",X"06",X"00",X"3F",X"00",X"00",X"98",X"90",X"80",X"80",X"00",X"DF",X"00",X"00",
		X"03",X"03",X"00",X"00",X"00",X"06",X"07",X"03",X"00",X"C0",X"C0",X"30",X"0C",X"80",X"80",X"90",
		X"01",X"03",X"07",X"06",X"00",X"FF",X"00",X"00",X"98",X"90",X"80",X"80",X"00",X"7C",X"00",X"00",
		X"00",X"0F",X"0F",X"00",X"00",X"0D",X"0F",X"07",X"00",X"00",X"00",X"E0",X"00",X"00",X"80",X"90",
		X"03",X"07",X"0F",X"0D",X"00",X"3F",X"00",X"00",X"98",X"90",X"80",X"00",X"00",X"DF",X"00",X"00",
		X"03",X"03",X"00",X"00",X"00",X"0D",X"0F",X"07",X"00",X"C0",X"C0",X"30",X"0C",X"00",X"80",X"90",
		X"03",X"07",X"0F",X"0D",X"00",X"FF",X"00",X"00",X"98",X"90",X"80",X"00",X"00",X"7C",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"04",X"47",X"6F",X"00",X"00",X"00",X"00",X"30",X"F4",X"E4",X"E4",
		X"27",X"6F",X"47",X"04",X"00",X"00",X"00",X"00",X"F0",X"E8",X"E8",X"C8",X"00",X"0C",X"0C",X"00",
		X"00",X"00",X"00",X"00",X"00",X"04",X"4F",X"6F",X"00",X"00",X"0C",X"0C",X"00",X"C8",X"E8",X"E8",
		X"2F",X"6F",X"4F",X"04",X"00",X"00",X"00",X"00",X"F0",X"E4",X"E4",X"F4",X"30",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"04",X"74",X"D0",X"C0",
		X"00",X"00",X"00",X"04",X"66",X"46",X"02",X"00",X"C8",X"0C",X"00",X"04",X"04",X"04",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"08",X"08",X"00",X"04",X"C4",X"C4",
		X"00",X"00",X"00",X"0C",X"6A",X"4A",X"02",X"00",X"C0",X"C4",X"44",X"04",X"00",X"00",X"10",X"18",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"04",X"14",X"50",X"C0",
		X"00",X"00",X"00",X"05",X"66",X"46",X"02",X"00",X"08",X"0C",X"00",X"84",X"04",X"04",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"08",X"08",X"00",X"04",X"44",X"C4",
		X"00",X"00",X"00",X"0C",X"6A",X"4A",X"02",X"00",X"00",X"04",X"04",X"84",X"00",X"00",X"10",X"18",
		X"00",X"00",X"00",X"00",X"3F",X"3F",X"00",X"01",X"00",X"00",X"00",X"00",X"FC",X"F4",X"04",X"FC",
		X"03",X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"3F",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"F0",X"0C",X"04",X"04",X"FC",
		X"03",X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"01",X"07",X"3E",X"00",X"6C",X"5C",X"58",
		X"03",X"02",X"00",X"00",X"00",X"00",X"07",X"00",X"D0",X"58",X"5C",X"6C",X"00",X"00",X"FF",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"07",X"3E",X"00",X"10",X"30",X"30",
		X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"00",X"20",X"30",X"30",X"10",X"00",X"00",X"FF",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"4C",X"1E",X"3F",X"DF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"DF",X"3F",X"1E",X"4C",X"40",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"10",X"44",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"6A",X"0A",X"02",X"00",X"00",X"02",X"01",X"00",X"02",X"01",X"41",X"40",X"E1",X"01",X"01",X"00",
		X"00",X"00",X"00",X"40",X"C0",X"00",X"10",X"28",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"08",X"14",X"21",X"01",X"00",X"30",X"00",X"00",X"00",X"00",X"80",X"E0",X"F1",X"01",X"01",X"E0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"00",X"30",X"10",X"00",X"38",X"78",X"00",X"00",
		X"08",X"00",X"00",X"00",X"02",X"02",X"02",X"00",X"00",X"60",X"70",X"70",X"60",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"1C",X"14",X"1A",X"19",X"0C",X"0C",X"06",X"00",X"00",X"00",X"00",X"00",X"88",X"58",X"30",
		X"06",X"0C",X"0C",X"18",X"18",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"08",X"14",X"1C",X"35",X"62",X"30",X"18",X"00",X"00",X"00",X"80",X"40",X"20",X"18",X"18",
		X"18",X"30",X"60",X"30",X"18",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"04",X"0E",X"1B",X"11",X"00",X"00",X"00",X"00",X"20",X"70",X"DC",X"8A",X"1C",X"20",X"10",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"10",X"20",X"C0",X"C0",X"00",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
