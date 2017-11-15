library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ROM_SND_0 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of ROM_SND_0 is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"21",X"00",X"80",X"06",X"00",X"C3",X"B3",X"01",X"D3",X"40",X"DB",X"80",X"C9",X"FF",X"FF",X"FF",
		X"D3",X"10",X"DB",X"20",X"C9",X"FF",X"FF",X"FF",X"78",X"CF",X"79",X"D3",X"80",X"C9",X"FF",X"FF",
		X"78",X"D7",X"79",X"D3",X"20",X"C9",X"FF",X"FF",X"87",X"85",X"6F",X"7C",X"CE",X"00",X"67",X"7E",
		X"23",X"66",X"6F",X"E9",X"FF",X"FF",X"FF",X"FF",X"D9",X"08",X"CD",X"41",X"00",X"08",X"D9",X"FB",
		X"C9",X"3E",X"0E",X"CF",X"B7",X"28",X"09",X"F2",X"7A",X"00",X"CB",X"BF",X"CD",X"6D",X"00",X"C9",
		X"21",X"00",X"80",X"06",X"0C",X"AF",X"77",X"23",X"10",X"FC",X"C9",X"21",X"00",X"80",X"06",X"06",
		X"0E",X"07",X"BE",X"28",X"05",X"23",X"23",X"10",X"F9",X"41",X"79",X"90",X"C9",X"CD",X"5B",X"00",
		X"C8",X"AF",X"77",X"23",X"77",X"C9",X"00",X"00",X"00",X"00",X"32",X"1A",X"80",X"CD",X"5B",X"00",
		X"28",X"04",X"23",X"36",X"00",X"C9",X"3A",X"1A",X"80",X"21",X"76",X"00",X"06",X"02",X"BE",X"28",
		X"19",X"23",X"10",X"FA",X"06",X"02",X"BE",X"28",X"21",X"23",X"10",X"FA",X"AF",X"CD",X"5B",X"00",
		X"28",X"3A",X"3A",X"1A",X"80",X"77",X"23",X"36",X"00",X"C9",X"AF",X"CD",X"5B",X"00",X"28",X"05",
		X"FE",X"04",X"FA",X"CA",X"00",X"CD",X"38",X"01",X"18",X"58",X"AF",X"CD",X"5B",X"00",X"28",X"05",
		X"FE",X"04",X"F2",X"CA",X"00",X"CD",X"63",X"01",X"18",X"40",X"21",X"1A",X"80",X"46",X"0E",X"00",
		X"21",X"00",X"80",X"3D",X"87",X"5F",X"51",X"19",X"70",X"23",X"71",X"C9",X"CD",X"38",X"01",X"CD",
		X"63",X"01",X"B7",X"28",X"2D",X"3A",X"17",X"80",X"B7",X"28",X"1F",X"3A",X"18",X"80",X"21",X"06",
		X"80",X"CD",X"27",X"01",X"CD",X"2F",X"01",X"57",X"3A",X"17",X"80",X"21",X"00",X"80",X"CD",X"27",
		X"01",X"CD",X"2F",X"01",X"BA",X"F2",X"0A",X"01",X"18",X"08",X"3A",X"18",X"80",X"21",X"06",X"80",
		X"18",X"06",X"3A",X"17",X"80",X"21",X"00",X"80",X"B7",X"C8",X"3D",X"87",X"4F",X"06",X"00",X"09",
		X"3A",X"1A",X"80",X"77",X"23",X"70",X"C9",X"3D",X"87",X"4F",X"06",X"00",X"09",X"7E",X"C9",X"21",
		X"8E",X"09",X"06",X"00",X"4F",X"09",X"7E",X"C9",X"3A",X"00",X"80",X"CD",X"2F",X"01",X"32",X"12",
		X"80",X"3A",X"02",X"80",X"CD",X"2F",X"01",X"32",X"13",X"80",X"3A",X"04",X"80",X"CD",X"2F",X"01",
		X"32",X"14",X"80",X"3A",X"1A",X"80",X"CD",X"2F",X"01",X"32",X"15",X"80",X"CD",X"8E",X"01",X"32",
		X"17",X"80",X"C9",X"3A",X"06",X"80",X"CD",X"2F",X"01",X"32",X"12",X"80",X"3A",X"08",X"80",X"CD",
		X"2F",X"01",X"32",X"13",X"80",X"3A",X"0A",X"80",X"CD",X"2F",X"01",X"32",X"14",X"80",X"3A",X"1A",
		X"80",X"CD",X"2F",X"01",X"32",X"15",X"80",X"CD",X"8E",X"01",X"32",X"18",X"80",X"C9",X"21",X"12",
		X"80",X"3A",X"15",X"80",X"06",X"03",X"4F",X"7E",X"B9",X"F2",X"9D",X"01",X"4F",X"23",X"10",X"F7",
		X"79",X"06",X"03",X"0E",X"01",X"21",X"12",X"80",X"BE",X"28",X"06",X"0C",X"23",X"10",X"F9",X"0E",
		X"00",X"79",X"C9",X"70",X"23",X"7C",X"FE",X"84",X"20",X"F9",X"F9",X"ED",X"56",X"21",X"00",X"90",
		X"22",X"0C",X"80",X"77",X"01",X"3F",X"07",X"DF",X"E7",X"32",X"0E",X"80",X"32",X"0F",X"80",X"CD",
		X"C9",X"02",X"CD",X"CD",X"02",X"CD",X"D1",X"02",X"CD",X"D7",X"02",X"CD",X"DB",X"02",X"CD",X"DF",
		X"02",X"FB",X"3E",X"0F",X"CF",X"E6",X"80",X"20",X"F9",X"3E",X"0F",X"CF",X"E6",X"80",X"28",X"F9",
		X"F3",X"3E",X"01",X"32",X"10",X"80",X"3A",X"01",X"80",X"B7",X"3A",X"00",X"80",X"CA",X"05",X"02",
		X"CD",X"AD",X"02",X"18",X"03",X"CD",X"93",X"02",X"FB",X"00",X"00",X"F3",X"3E",X"02",X"32",X"10",
		X"80",X"3A",X"03",X"80",X"B7",X"3A",X"02",X"80",X"CA",X"20",X"02",X"CD",X"AD",X"02",X"18",X"03",
		X"CD",X"93",X"02",X"FB",X"00",X"00",X"F3",X"3E",X"03",X"32",X"10",X"80",X"3A",X"05",X"80",X"B7",
		X"3A",X"04",X"80",X"CA",X"3B",X"02",X"CD",X"AD",X"02",X"18",X"03",X"CD",X"93",X"02",X"FB",X"00",
		X"00",X"F3",X"3E",X"04",X"32",X"10",X"80",X"3A",X"07",X"80",X"B7",X"3A",X"06",X"80",X"CA",X"56",
		X"02",X"CD",X"AD",X"02",X"18",X"03",X"CD",X"93",X"02",X"FB",X"00",X"00",X"F3",X"3E",X"05",X"32",
		X"10",X"80",X"3A",X"09",X"80",X"B7",X"3A",X"08",X"80",X"CA",X"71",X"02",X"CD",X"AD",X"02",X"18",
		X"03",X"CD",X"93",X"02",X"FB",X"00",X"00",X"F3",X"3E",X"06",X"32",X"10",X"80",X"3A",X"0B",X"80",
		X"B7",X"3A",X"0A",X"80",X"CA",X"8D",X"02",X"CD",X"AD",X"02",X"C3",X"E1",X"01",X"CD",X"93",X"02",
		X"C3",X"E1",X"01",X"21",X"BC",X"09",X"EF",X"B7",X"20",X"19",X"E5",X"21",X"01",X"80",X"3A",X"10",
		X"80",X"3D",X"87",X"D5",X"5F",X"16",X"00",X"19",X"D1",X"36",X"01",X"E1",X"C9",X"B7",X"C8",X"21",
		X"18",X"0A",X"EF",X"B7",X"C8",X"57",X"21",X"00",X"80",X"3A",X"10",X"80",X"3D",X"4F",X"06",X"00",
		X"09",X"09",X"15",X"28",X"01",X"70",X"23",X"70",X"C9",X"06",X"08",X"18",X"06",X"06",X"09",X"18",
		X"02",X"06",X"0A",X"0E",X"00",X"DF",X"C9",X"06",X"08",X"18",X"06",X"06",X"09",X"18",X"02",X"06",
		X"0A",X"0E",X"00",X"E7",X"C9",X"3A",X"10",X"80",X"3D",X"21",X"EF",X"02",X"EF",X"AF",X"C9",X"FB",
		X"02",X"04",X"03",X"0D",X"03",X"16",X"03",X"1F",X"03",X"28",X"03",X"CD",X"C9",X"02",X"0E",X"09",
		X"CD",X"31",X"03",X"C9",X"CD",X"CD",X"02",X"0E",X"12",X"CD",X"31",X"03",X"C9",X"CD",X"D1",X"02",
		X"0E",X"24",X"CD",X"31",X"03",X"C9",X"CD",X"D7",X"02",X"0E",X"09",X"CD",X"3D",X"03",X"C9",X"CD",
		X"DB",X"02",X"0E",X"12",X"CD",X"3D",X"03",X"C9",X"CD",X"DF",X"02",X"0E",X"24",X"CD",X"3D",X"03",
		X"C9",X"3A",X"0E",X"80",X"B1",X"32",X"0E",X"80",X"06",X"07",X"4F",X"DF",X"C9",X"3A",X"0F",X"80",
		X"B1",X"32",X"0F",X"80",X"06",X"07",X"4F",X"E7",X"C9",X"3A",X"10",X"80",X"FE",X"04",X"FA",X"53",
		X"03",X"E7",X"C9",X"DF",X"C9",X"3A",X"10",X"80",X"FE",X"04",X"FA",X"61",X"03",X"78",X"D7",X"4F",
		X"C9",X"78",X"CF",X"4F",X"C9",X"3A",X"0E",X"80",X"A0",X"B1",X"32",X"0E",X"80",X"4F",X"06",X"07",
		X"DF",X"C9",X"3A",X"0F",X"80",X"A0",X"B1",X"32",X"0F",X"80",X"4F",X"06",X"07",X"E7",X"C9",X"3A",
		X"10",X"80",X"3D",X"21",X"88",X"03",X"EF",X"C9",X"94",X"03",X"9B",X"03",X"A2",X"03",X"A9",X"03",
		X"B0",X"03",X"B7",X"03",X"01",X"08",X"FE",X"CD",X"65",X"03",X"C9",X"01",X"10",X"FD",X"CD",X"65",
		X"03",X"C9",X"01",X"20",X"FB",X"CD",X"65",X"03",X"C9",X"01",X"08",X"FE",X"CD",X"72",X"03",X"C9",
		X"01",X"10",X"FD",X"CD",X"72",X"03",X"C9",X"01",X"20",X"FB",X"CD",X"72",X"03",X"C9",X"3A",X"10",
		X"80",X"3D",X"21",X"C7",X"03",X"EF",X"C9",X"D3",X"03",X"DA",X"03",X"E1",X"03",X"E8",X"03",X"EF",
		X"03",X"F6",X"03",X"01",X"01",X"F7",X"CD",X"65",X"03",X"C9",X"01",X"02",X"EF",X"CD",X"65",X"03",
		X"C9",X"01",X"04",X"DF",X"CD",X"65",X"03",X"C9",X"01",X"01",X"F7",X"CD",X"72",X"03",X"C9",X"01",
		X"02",X"EF",X"CD",X"72",X"03",X"C9",X"01",X"04",X"DF",X"CD",X"72",X"03",X"C9",X"3A",X"10",X"80",
		X"3D",X"21",X"06",X"04",X"EF",X"C9",X"12",X"04",X"19",X"04",X"20",X"04",X"27",X"04",X"2E",X"04",
		X"35",X"04",X"01",X"00",X"F6",X"CD",X"65",X"03",X"C9",X"01",X"00",X"ED",X"CD",X"65",X"03",X"C9",
		X"01",X"00",X"DB",X"CD",X"65",X"03",X"C9",X"01",X"00",X"F6",X"CD",X"72",X"03",X"C9",X"01",X"00",
		X"ED",X"CD",X"72",X"03",X"C9",X"01",X"00",X"DB",X"CD",X"72",X"03",X"C9",X"3A",X"10",X"80",X"FE",
		X"04",X"30",X"05",X"C6",X"07",X"47",X"DF",X"C9",X"C6",X"04",X"47",X"E7",X"C9",X"3A",X"10",X"80",
		X"FE",X"04",X"30",X"04",X"C6",X"07",X"CF",X"C9",X"C6",X"04",X"D7",X"C9",X"3A",X"10",X"80",X"FE",
		X"04",X"30",X"09",X"3D",X"87",X"47",X"4D",X"DF",X"4C",X"04",X"DF",X"C9",X"D6",X"04",X"87",X"47",
		X"4D",X"E7",X"4C",X"04",X"E7",X"C9",X"3A",X"10",X"80",X"FE",X"04",X"30",X"0A",X"3D",X"87",X"67",
		X"24",X"CF",X"6F",X"7C",X"CF",X"67",X"C9",X"D6",X"04",X"87",X"67",X"24",X"D7",X"6F",X"7C",X"D7",
		X"67",X"C9",X"FE",X"04",X"D0",X"F5",X"CD",X"E2",X"04",X"F1",X"B7",X"20",X"02",X"77",X"C9",X"21",
		X"B2",X"04",X"87",X"87",X"4F",X"87",X"81",X"4F",X"06",X"00",X"09",X"3A",X"10",X"80",X"3D",X"EF",
		X"77",X"C9",X"05",X"05",X"0A",X"05",X"0F",X"05",X"14",X"05",X"19",X"05",X"1E",X"05",X"23",X"05",
		X"28",X"05",X"2D",X"05",X"32",X"05",X"37",X"05",X"3C",X"05",X"41",X"05",X"46",X"05",X"4B",X"05",
		X"50",X"05",X"55",X"05",X"5A",X"05",X"5F",X"05",X"64",X"05",X"69",X"05",X"6E",X"05",X"73",X"05",
		X"78",X"05",X"21",X"B2",X"04",X"3A",X"10",X"80",X"3D",X"EF",X"C9",X"2A",X"0C",X"80",X"7B",X"A5",
		X"6F",X"7A",X"A4",X"67",X"22",X"0C",X"80",X"C9",X"2A",X"0C",X"80",X"7B",X"B5",X"6F",X"7A",X"B4",
		X"67",X"22",X"0C",X"80",X"C9",X"11",X"3F",X"FF",X"18",X"E1",X"11",X"FF",X"FC",X"18",X"DC",X"11",
		X"FF",X"F3",X"18",X"D7",X"11",X"FC",X"FF",X"18",X"D2",X"11",X"F3",X"FF",X"18",X"CD",X"11",X"CF",
		X"FF",X"18",X"C8",X"11",X"80",X"00",X"18",X"D0",X"11",X"00",X"02",X"18",X"CB",X"11",X"00",X"08",
		X"18",X"C6",X"11",X"02",X"00",X"18",X"C1",X"11",X"08",X"00",X"18",X"BC",X"11",X"20",X"00",X"18",
		X"B7",X"11",X"40",X"00",X"18",X"B2",X"11",X"00",X"01",X"18",X"AD",X"11",X"00",X"04",X"18",X"A8",
		X"11",X"01",X"00",X"18",X"A3",X"11",X"04",X"00",X"18",X"9E",X"11",X"10",X"00",X"18",X"99",X"11",
		X"C0",X"00",X"18",X"94",X"11",X"00",X"03",X"18",X"8F",X"11",X"00",X"0C",X"18",X"8A",X"11",X"03",
		X"00",X"18",X"85",X"11",X"0C",X"00",X"18",X"80",X"11",X"30",X"00",X"C3",X"F8",X"04",X"DD",X"7E",
		X"00",X"FE",X"FF",X"C8",X"CD",X"89",X"05",X"AF",X"C9",X"DD",X"35",X"01",X"C0",X"3A",X"42",X"80",
		X"DD",X"77",X"01",X"DD",X"CB",X"00",X"46",X"C2",X"A9",X"05",X"DD",X"7E",X"07",X"D6",X"01",X"FA",
		X"A9",X"05",X"DD",X"77",X"07",X"4F",X"CD",X"3C",X"04",X"DD",X"35",X"00",X"C0",X"DD",X"6E",X"02",
		X"DD",X"66",X"03",X"7E",X"47",X"E6",X"1F",X"CA",X"44",X"06",X"FE",X"1F",X"C2",X"60",X"06",X"23",
		X"DD",X"75",X"02",X"DD",X"74",X"03",X"78",X"E6",X"E0",X"0F",X"0F",X"0F",X"0F",X"4F",X"06",X"00",
		X"21",X"D9",X"05",X"09",X"5E",X"23",X"56",X"EB",X"E9",X"E9",X"05",X"07",X"06",X"1D",X"06",X"3A",
		X"06",X"3A",X"06",X"3A",X"06",X"3A",X"06",X"3A",X"06",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"4E",
		X"CB",X"21",X"06",X"00",X"21",X"93",X"06",X"09",X"5E",X"23",X"56",X"ED",X"53",X"40",X"80",X"DD",
		X"73",X"04",X"DD",X"72",X"05",X"18",X"23",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"4E",X"06",X"00",
		X"21",X"2B",X"07",X"09",X"7E",X"32",X"42",X"80",X"DD",X"77",X"01",X"18",X"0D",X"DD",X"6E",X"02",
		X"DD",X"66",X"03",X"7E",X"DD",X"77",X"06",X"DD",X"77",X"07",X"DD",X"6E",X"02",X"DD",X"66",X"03",
		X"23",X"DD",X"75",X"02",X"DD",X"74",X"03",X"C3",X"AD",X"05",X"0E",X"00",X"CD",X"3C",X"04",X"DD",
		X"36",X"00",X"FF",X"C9",X"CD",X"4E",X"06",X"0E",X"00",X"CD",X"3C",X"04",X"18",X"37",X"78",X"E6",
		X"E0",X"07",X"07",X"07",X"47",X"3E",X"01",X"18",X"01",X"07",X"10",X"FD",X"DD",X"77",X"00",X"C9",
		X"C5",X"CD",X"4E",X"06",X"C1",X"78",X"E6",X"1F",X"3D",X"07",X"4F",X"06",X"00",X"DD",X"6E",X"04",
		X"DD",X"66",X"05",X"09",X"5E",X"23",X"56",X"EB",X"CD",X"5C",X"04",X"DD",X"4E",X"06",X"79",X"DD",
		X"77",X"07",X"CD",X"3C",X"04",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"23",X"DD",X"75",X"02",X"DD",
		X"74",X"03",X"C9",X"B3",X"06",X"B7",X"06",X"BB",X"06",X"BF",X"06",X"C3",X"06",X"C7",X"06",X"CB",
		X"06",X"CF",X"06",X"D3",X"06",X"D7",X"06",X"DB",X"06",X"DF",X"06",X"E3",X"06",X"E7",X"06",X"EB",
		X"06",X"EF",X"06",X"6B",X"08",X"F2",X"07",X"80",X"07",X"14",X"07",X"AE",X"06",X"4E",X"06",X"F3",
		X"05",X"9E",X"05",X"4E",X"05",X"01",X"05",X"B9",X"04",X"76",X"04",X"36",X"04",X"F9",X"03",X"C0",
		X"03",X"8A",X"03",X"57",X"03",X"27",X"03",X"FA",X"02",X"CF",X"02",X"A7",X"02",X"81",X"02",X"5D",
		X"02",X"3B",X"02",X"1B",X"02",X"FD",X"01",X"E0",X"01",X"C5",X"01",X"AC",X"01",X"94",X"01",X"7D",
		X"01",X"68",X"01",X"53",X"01",X"40",X"01",X"2E",X"01",X"1D",X"01",X"0D",X"01",X"FE",X"00",X"F0",
		X"00",X"E3",X"00",X"D6",X"00",X"CA",X"00",X"BE",X"00",X"B4",X"00",X"AA",X"00",X"A0",X"00",X"97",
		X"00",X"8F",X"00",X"87",X"00",X"7F",X"00",X"78",X"00",X"71",X"00",X"6B",X"00",X"65",X"00",X"5F",
		X"00",X"5A",X"00",X"55",X"00",X"50",X"00",X"4C",X"00",X"47",X"00",X"57",X"42",X"34",X"2C",X"25",
		X"21",X"1D",X"1A",X"0C",X"0B",X"0A",X"09",X"08",X"07",X"06",X"05",X"21",X"6E",X"07",X"11",X"20",
		X"80",X"01",X"18",X"00",X"ED",X"B0",X"3A",X"43",X"80",X"87",X"4F",X"87",X"81",X"4F",X"06",X"00",
		X"09",X"21",X"0D",X"13",X"09",X"11",X"22",X"80",X"CD",X"64",X"07",X"11",X"2A",X"80",X"CD",X"64",
		X"07",X"11",X"32",X"80",X"7E",X"12",X"CD",X"6B",X"07",X"7E",X"12",X"23",X"13",X"C9",X"01",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"DD",X"7E",X"00",X"FE",X"FF",X"C8",X"CD",X"91",X"07",X"AF",
		X"C9",X"DD",X"35",X"01",X"C0",X"3A",X"66",X"80",X"DD",X"77",X"01",X"DD",X"CB",X"00",X"46",X"C2",
		X"B1",X"07",X"DD",X"7E",X"07",X"D6",X"01",X"FA",X"B1",X"07",X"DD",X"77",X"07",X"4F",X"CD",X"3C",
		X"04",X"DD",X"35",X"00",X"C0",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"7E",X"47",X"E6",X"1F",X"CA",
		X"4C",X"08",X"FE",X"1F",X"C2",X"68",X"08",X"23",X"DD",X"75",X"02",X"DD",X"74",X"03",X"78",X"E6",
		X"E0",X"0F",X"0F",X"0F",X"0F",X"4F",X"06",X"00",X"21",X"E1",X"07",X"09",X"5E",X"23",X"56",X"EB",
		X"E9",X"F1",X"07",X"0F",X"08",X"25",X"08",X"42",X"08",X"42",X"08",X"42",X"08",X"42",X"08",X"42",
		X"08",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"4E",X"CB",X"21",X"06",X"00",X"21",X"9B",X"08",X"09",
		X"5E",X"23",X"56",X"ED",X"53",X"64",X"80",X"DD",X"73",X"04",X"DD",X"72",X"05",X"18",X"23",X"DD",
		X"6E",X"02",X"DD",X"66",X"03",X"4E",X"06",X"00",X"21",X"33",X"09",X"09",X"7E",X"32",X"66",X"80",
		X"DD",X"77",X"01",X"18",X"0D",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"7E",X"DD",X"77",X"06",X"DD",
		X"77",X"07",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"23",X"DD",X"75",X"02",X"DD",X"74",X"03",X"C3",
		X"B5",X"07",X"0E",X"00",X"CD",X"3C",X"04",X"DD",X"36",X"00",X"FF",X"C9",X"CD",X"56",X"08",X"0E",
		X"00",X"CD",X"3C",X"04",X"18",X"37",X"78",X"E6",X"E0",X"07",X"07",X"07",X"47",X"3E",X"01",X"18",
		X"01",X"07",X"10",X"FD",X"DD",X"77",X"00",X"C9",X"C5",X"CD",X"56",X"08",X"C1",X"78",X"E6",X"1F",
		X"3D",X"07",X"4F",X"06",X"00",X"DD",X"6E",X"04",X"DD",X"66",X"05",X"09",X"5E",X"23",X"56",X"EB",
		X"CD",X"5C",X"04",X"DD",X"4E",X"06",X"79",X"DD",X"77",X"07",X"CD",X"3C",X"04",X"DD",X"6E",X"02",
		X"DD",X"66",X"03",X"23",X"DD",X"75",X"02",X"DD",X"74",X"03",X"C9",X"BB",X"08",X"BF",X"08",X"C3",
		X"08",X"C7",X"08",X"CB",X"08",X"CF",X"08",X"D3",X"08",X"D7",X"08",X"DB",X"08",X"DF",X"08",X"E3",
		X"08",X"E7",X"08",X"EB",X"08",X"EF",X"08",X"F3",X"08",X"C1",X"08",X"6B",X"08",X"F2",X"07",X"80",
		X"07",X"14",X"07",X"AE",X"06",X"4E",X"06",X"F3",X"05",X"9E",X"05",X"4E",X"05",X"01",X"05",X"B9",
		X"04",X"76",X"04",X"36",X"04",X"F9",X"03",X"C0",X"03",X"8A",X"03",X"57",X"03",X"27",X"03",X"FA",
		X"02",X"CF",X"02",X"A7",X"02",X"81",X"02",X"5D",X"02",X"3B",X"02",X"1B",X"02",X"FD",X"01",X"E0",
		X"01",X"C5",X"01",X"AC",X"01",X"94",X"01",X"7D",X"01",X"68",X"01",X"53",X"01",X"40",X"01",X"2E",
		X"01",X"1D",X"01",X"0D",X"01",X"FE",X"00",X"F0",X"00",X"E3",X"00",X"D6",X"00",X"CA",X"00",X"BE",
		X"00",X"B4",X"00",X"AA",X"00",X"A0",X"00",X"97",X"00",X"8F",X"00",X"87",X"00",X"7F",X"00",X"78",
		X"00",X"71",X"00",X"6B",X"00",X"65",X"00",X"5F",X"00",X"5A",X"00",X"55",X"00",X"50",X"00",X"4C",
		X"00",X"47",X"00",X"57",X"42",X"34",X"2C",X"25",X"21",X"1D",X"1A",X"0C",X"0B",X"0A",X"09",X"08",
		X"07",X"06",X"05",X"21",X"76",X"09",X"11",X"44",X"80",X"01",X"18",X"00",X"ED",X"B0",X"3A",X"67",
		X"80",X"87",X"4F",X"87",X"81",X"4F",X"06",X"00",X"09",X"21",X"0D",X"13",X"09",X"11",X"46",X"80",
		X"CD",X"6C",X"09",X"11",X"4E",X"80",X"CD",X"6C",X"09",X"11",X"56",X"80",X"7E",X"12",X"CD",X"73",
		X"09",X"7E",X"12",X"23",X"13",X"C9",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"06",
		X"05",X"0A",X"0E",X"0C",X"04",X"10",X"0F",X"07",X"0B",X"0D",X"12",X"11",X"09",X"08",X"01",X"02",
		X"03",X"2D",X"24",X"1B",X"2C",X"23",X"1A",X"2B",X"22",X"19",X"2A",X"21",X"18",X"29",X"20",X"17",
		X"28",X"1F",X"16",X"27",X"1E",X"15",X"26",X"1D",X"14",X"25",X"1C",X"13",X"E5",X"02",X"74",X"0A",
		X"C4",X"0A",X"18",X"0B",X"88",X"0B",X"23",X"0C",X"A9",X"0C",X"2F",X"0D",X"86",X"0D",X"DD",X"0D",
		X"1C",X"0E",X"94",X"0E",X"19",X"0F",X"4F",X"0F",X"17",X"10",X"83",X"10",X"EB",X"10",X"1B",X"11",
		X"1B",X"11",X"38",X"11",X"75",X"11",X"75",X"11",X"AE",X"11",X"75",X"11",X"75",X"11",X"D3",X"11",
		X"75",X"11",X"75",X"11",X"F8",X"11",X"75",X"11",X"75",X"11",X"1D",X"12",X"75",X"11",X"75",X"11",
		X"42",X"12",X"73",X"12",X"73",X"12",X"9E",X"12",X"73",X"12",X"73",X"12",X"C3",X"12",X"73",X"12",
		X"73",X"12",X"E8",X"12",X"73",X"12",X"73",X"12",X"00",X"00",X"95",X"0A",X"E5",X"0A",X"38",X"0B",
		X"B4",X"0B",X"43",X"0C",X"CF",X"0C",X"51",X"0D",X"A8",X"0D",X"FB",X"0D",X"3C",X"0E",X"B3",X"0E",
		X"32",X"0F",X"6F",X"0F",X"37",X"10",X"A3",X"10",X"14",X"11",X"2A",X"11",X"31",X"11",X"5D",X"11",
		X"92",X"11",X"A0",X"11",X"5D",X"11",X"92",X"11",X"A0",X"11",X"64",X"11",X"99",X"11",X"A7",X"11",
		X"5D",X"11",X"92",X"11",X"A0",X"11",X"5D",X"11",X"92",X"11",X"A0",X"11",X"67",X"12",X"90",X"12",
		X"97",X"12",X"67",X"12",X"90",X"12",X"97",X"12",X"67",X"12",X"90",X"12",X"97",X"12",X"67",X"12",
		X"90",X"12",X"97",X"12",X"3E",X"01",X"CD",X"92",X"04",X"3E",X"10",X"32",X"70",X"80",X"32",X"71",
		X"80",X"AF",X"32",X"72",X"80",X"CD",X"7F",X"03",X"0E",X"04",X"CD",X"3C",X"04",X"21",X"55",X"00",
		X"CD",X"5C",X"04",X"AF",X"C9",X"3A",X"72",X"80",X"FE",X"00",X"28",X"02",X"18",X"0D",X"21",X"70",
		X"80",X"AF",X"35",X"C0",X"3E",X"01",X"32",X"72",X"80",X"AF",X"C9",X"21",X"71",X"80",X"AF",X"35",
		X"C0",X"36",X"10",X"CD",X"4D",X"04",X"3C",X"FE",X"09",X"28",X"06",X"4F",X"CD",X"3C",X"04",X"AF",
		X"C9",X"3E",X"FF",X"C9",X"3E",X"01",X"CD",X"92",X"04",X"3E",X"10",X"32",X"74",X"80",X"32",X"75",
		X"80",X"AF",X"32",X"76",X"80",X"CD",X"7F",X"03",X"0E",X"04",X"CD",X"3C",X"04",X"21",X"00",X"01",
		X"CD",X"5C",X"04",X"AF",X"C9",X"3A",X"76",X"80",X"FE",X"00",X"28",X"02",X"18",X"0D",X"21",X"74",
		X"80",X"AF",X"35",X"C0",X"3E",X"01",X"32",X"76",X"80",X"AF",X"C9",X"21",X"75",X"80",X"AF",X"35",
		X"C0",X"36",X"10",X"CD",X"4D",X"04",X"3C",X"FE",X"09",X"28",X"06",X"4F",X"CD",X"3C",X"04",X"AF",
		X"C9",X"3E",X"FF",X"C9",X"06",X"19",X"19",X"00",X"21",X"14",X"0B",X"11",X"78",X"80",X"01",X"04",
		X"00",X"ED",X"B0",X"CD",X"7F",X"03",X"3E",X"01",X"CD",X"92",X"04",X"0E",X"0C",X"CD",X"3C",X"04",
		X"21",X"50",X"00",X"CD",X"5C",X"04",X"AF",X"C9",X"DD",X"21",X"14",X"0B",X"FD",X"21",X"78",X"80",
		X"FD",X"7E",X"03",X"FE",X"00",X"28",X"02",X"18",X"1B",X"CD",X"76",X"04",X"11",X"09",X"00",X"19",
		X"CD",X"5C",X"04",X"FD",X"35",X"00",X"20",X"0A",X"DD",X"7E",X"00",X"FD",X"77",X"00",X"FD",X"36",
		X"03",X"01",X"AF",X"C9",X"FD",X"35",X"01",X"20",X"F9",X"DD",X"7E",X"01",X"FD",X"77",X"01",X"CD",
		X"76",X"04",X"23",X"CD",X"5C",X"04",X"FD",X"35",X"02",X"28",X"02",X"AF",X"C9",X"3E",X"FF",X"C9",
		X"BC",X"0B",X"D7",X"0B",X"F8",X"0B",X"11",X"0C",X"AF",X"CD",X"92",X"04",X"3E",X"17",X"32",X"7D",
		X"80",X"3E",X"06",X"32",X"7E",X"80",X"3E",X"04",X"32",X"7F",X"80",X"3E",X"06",X"32",X"80",X"80",
		X"AF",X"32",X"81",X"80",X"CD",X"7F",X"03",X"0E",X"0B",X"CD",X"3C",X"04",X"21",X"80",X"00",X"CD",
		X"5C",X"04",X"AF",X"C9",X"3A",X"81",X"80",X"21",X"80",X"0B",X"EF",X"C9",X"21",X"7D",X"80",X"AF",
		X"35",X"C0",X"36",X"17",X"CD",X"76",X"04",X"11",X"10",X"00",X"B7",X"ED",X"52",X"CD",X"5C",X"04",
		X"3E",X"01",X"32",X"81",X"80",X"AF",X"C9",X"21",X"7E",X"80",X"AF",X"35",X"C0",X"36",X"06",X"CD",
		X"76",X"04",X"11",X"10",X"00",X"19",X"CD",X"5C",X"04",X"21",X"7F",X"80",X"AF",X"35",X"C0",X"36",
		X"04",X"3E",X"02",X"32",X"81",X"80",X"AF",X"C9",X"21",X"7E",X"80",X"AF",X"35",X"C0",X"36",X"06",
		X"CD",X"76",X"04",X"11",X"10",X"00",X"B7",X"ED",X"52",X"CD",X"5C",X"04",X"3E",X"03",X"32",X"81",
		X"80",X"21",X"80",X"80",X"35",X"28",X"05",X"AF",X"32",X"81",X"80",X"C9",X"3E",X"FF",X"C9",X"10",
		X"10",X"10",X"00",X"21",X"1F",X"0C",X"11",X"83",X"80",X"01",X"04",X"00",X"ED",X"B0",X"CD",X"7F",
		X"03",X"3E",X"01",X"CD",X"92",X"04",X"0E",X"0C",X"CD",X"3C",X"04",X"21",X"00",X"01",X"CD",X"5C",
		X"04",X"AF",X"C9",X"DD",X"21",X"1F",X"0C",X"FD",X"21",X"83",X"80",X"FD",X"7E",X"03",X"FE",X"00",
		X"28",X"06",X"FE",X"01",X"28",X"22",X"18",X"3A",X"FD",X"35",X"00",X"28",X"0F",X"FD",X"46",X"00",
		X"CB",X"40",X"28",X"0C",X"21",X"80",X"00",X"CD",X"5C",X"04",X"AF",X"C9",X"FD",X"36",X"03",X"01",
		X"21",X"00",X"01",X"CD",X"5C",X"04",X"AF",X"C9",X"FD",X"35",X"01",X"28",X"0F",X"FD",X"46",X"01",
		X"CB",X"40",X"28",X"EC",X"21",X"60",X"00",X"CD",X"5C",X"04",X"AF",X"C9",X"FD",X"36",X"03",X"02",
		X"18",X"DE",X"FD",X"35",X"02",X"28",X"0F",X"FD",X"46",X"02",X"CB",X"40",X"28",X"D2",X"21",X"40",
		X"00",X"CD",X"5C",X"04",X"AF",X"C9",X"3E",X"FF",X"C9",X"3E",X"01",X"CD",X"92",X"04",X"3E",X"02",
		X"21",X"88",X"80",X"77",X"23",X"3E",X"08",X"77",X"23",X"3E",X"02",X"77",X"23",X"AF",X"77",X"CD",
		X"7F",X"03",X"0E",X"09",X"CD",X"3C",X"04",X"21",X"00",X"01",X"CD",X"5C",X"04",X"AF",X"C9",X"3A",
		X"8B",X"80",X"FE",X"00",X"28",X"02",X"18",X"28",X"CD",X"76",X"04",X"2B",X"CD",X"5C",X"04",X"3A",
		X"88",X"80",X"3D",X"32",X"88",X"80",X"20",X"0F",X"3E",X"03",X"32",X"88",X"80",X"CD",X"4D",X"04",
		X"3D",X"28",X"06",X"4F",X"CD",X"3C",X"04",X"AF",X"C9",X"3E",X"01",X"32",X"8B",X"80",X"AF",X"C9",
		X"0E",X"00",X"CD",X"3C",X"04",X"3A",X"89",X"80",X"3D",X"32",X"89",X"80",X"20",X"E9",X"3E",X"08",
		X"32",X"89",X"80",X"3A",X"8A",X"80",X"3D",X"32",X"8A",X"80",X"28",X"10",X"0E",X"09",X"CD",X"3C",
		X"04",X"21",X"60",X"00",X"CD",X"5C",X"04",X"AF",X"32",X"8B",X"80",X"C9",X"3E",X"FF",X"C9",X"AF",
		X"CD",X"92",X"04",X"3E",X"14",X"32",X"8D",X"80",X"3E",X"05",X"32",X"8E",X"80",X"AF",X"32",X"8F",
		X"80",X"CD",X"7F",X"03",X"0E",X"0B",X"CD",X"3C",X"04",X"21",X"80",X"00",X"CD",X"5C",X"04",X"AF",
		X"C9",X"3A",X"8F",X"80",X"FE",X"00",X"28",X"02",X"18",X"1B",X"21",X"8D",X"80",X"AF",X"35",X"C0",
		X"36",X"14",X"21",X"86",X"00",X"CD",X"5C",X"04",X"21",X"8E",X"80",X"35",X"28",X"15",X"3E",X"01",
		X"32",X"8F",X"80",X"AF",X"C9",X"21",X"8D",X"80",X"AF",X"35",X"C0",X"36",X"14",X"AF",X"32",X"8F",
		X"80",X"18",X"C6",X"3E",X"FF",X"C9",X"AF",X"CD",X"92",X"04",X"3E",X"14",X"32",X"91",X"80",X"3E",
		X"05",X"32",X"92",X"80",X"AF",X"32",X"93",X"80",X"CD",X"7F",X"03",X"0E",X"0B",X"CD",X"3C",X"04",
		X"21",X"40",X"00",X"CD",X"5C",X"04",X"AF",X"C9",X"3A",X"93",X"80",X"FE",X"00",X"28",X"02",X"18",
		X"1B",X"21",X"91",X"80",X"AF",X"35",X"C0",X"36",X"14",X"21",X"43",X"00",X"CD",X"5C",X"04",X"21",
		X"92",X"80",X"35",X"28",X"15",X"3E",X"01",X"32",X"93",X"80",X"AF",X"C9",X"21",X"91",X"80",X"AF",
		X"35",X"C0",X"36",X"14",X"AF",X"32",X"93",X"80",X"18",X"C6",X"3E",X"FF",X"C9",X"AF",X"CD",X"92",
		X"04",X"3E",X"13",X"32",X"95",X"80",X"3E",X"06",X"32",X"96",X"80",X"CD",X"7F",X"03",X"0E",X"09",
		X"CD",X"3C",X"04",X"21",X"00",X"02",X"CD",X"5C",X"04",X"AF",X"C9",X"21",X"95",X"80",X"AF",X"35",
		X"C0",X"36",X"13",X"21",X"96",X"80",X"35",X"28",X"0D",X"CD",X"76",X"04",X"11",X"50",X"00",X"ED",
		X"52",X"CD",X"5C",X"04",X"AF",X"C9",X"3E",X"FF",X"C9",X"1B",X"1B",X"00",X"21",X"19",X"0E",X"11",
		X"98",X"80",X"01",X"03",X"00",X"ED",X"B0",X"CD",X"7F",X"03",X"3E",X"01",X"CD",X"92",X"04",X"0E",
		X"0B",X"CD",X"3C",X"04",X"21",X"00",X"02",X"CD",X"5C",X"04",X"AF",X"C9",X"DD",X"21",X"19",X"0E",
		X"FD",X"21",X"98",X"80",X"FD",X"7E",X"02",X"FE",X"00",X"28",X"03",X"C3",X"6D",X"0E",X"FD",X"35",
		X"00",X"20",X"18",X"DD",X"7E",X"00",X"FD",X"77",X"00",X"21",X"00",X"08",X"CD",X"5C",X"04",X"CD",
		X"4D",X"04",X"3C",X"4F",X"CD",X"3C",X"04",X"FD",X"36",X"02",X"01",X"AF",X"C9",X"FD",X"35",X"01",
		X"20",X"F9",X"DD",X"7E",X"01",X"FD",X"77",X"01",X"21",X"00",X"02",X"CD",X"5C",X"04",X"CD",X"4D",
		X"04",X"3D",X"3D",X"FE",X"03",X"28",X"0A",X"4F",X"CD",X"3C",X"04",X"FD",X"36",X"02",X"00",X"18",
		X"DA",X"3E",X"FF",X"C9",X"AF",X"CD",X"92",X"04",X"CD",X"7F",X"03",X"21",X"00",X"04",X"CD",X"5C",
		X"04",X"0E",X"0F",X"CD",X"3C",X"04",X"21",X"9C",X"80",X"36",X"00",X"23",X"36",X"02",X"23",X"36",
		X"14",X"AF",X"C9",X"CD",X"EB",X"0E",X"CD",X"BB",X"0E",X"AF",X"C9",X"21",X"9E",X"80",X"35",X"C0",
		X"36",X"14",X"3A",X"9C",X"80",X"CB",X"4F",X"28",X"0C",X"CD",X"4D",X"04",X"3C",X"4F",X"CD",X"3C",
		X"04",X"3E",X"02",X"18",X"32",X"CD",X"4D",X"04",X"D6",X"02",X"4F",X"CD",X"3C",X"04",X"4F",X"3E",
		X"02",X"CD",X"07",X"0F",X"79",X"B7",X"C0",X"E1",X"3E",X"FF",X"C9",X"21",X"9D",X"80",X"35",X"C0",
		X"36",X"02",X"3A",X"9C",X"80",X"CB",X"47",X"20",X"14",X"CD",X"76",X"04",X"11",X"38",X"00",X"B7",
		X"ED",X"52",X"CD",X"5C",X"04",X"3E",X"01",X"21",X"9C",X"80",X"AE",X"77",X"C9",X"CD",X"76",X"04",
		X"11",X"38",X"00",X"19",X"CD",X"5C",X"04",X"18",X"EE",X"AF",X"CD",X"92",X"04",X"21",X"A0",X"80",
		X"36",X"03",X"CD",X"7F",X"03",X"0E",X"09",X"CD",X"3C",X"04",X"21",X"94",X"00",X"CD",X"5C",X"04",
		X"AF",X"C9",X"21",X"A0",X"80",X"AF",X"35",X"C0",X"36",X"03",X"CD",X"4D",X"04",X"3D",X"4F",X"28",
		X"05",X"CD",X"3C",X"04",X"AF",X"C9",X"3E",X"FF",X"C9",X"08",X"19",X"0A",X"04",X"1A",X"00",X"21",
		X"49",X"0F",X"11",X"A2",X"80",X"01",X"06",X"00",X"ED",X"B0",X"CD",X"7F",X"03",X"3E",X"01",X"CD",
		X"92",X"04",X"0E",X"0C",X"CD",X"3C",X"04",X"21",X"E0",X"00",X"CD",X"5C",X"04",X"AF",X"C9",X"DD",
		X"21",X"49",X"0F",X"FD",X"21",X"A2",X"80",X"FD",X"7E",X"05",X"FE",X"00",X"28",X"0A",X"FE",X"01",
		X"28",X"29",X"FE",X"02",X"28",X"42",X"18",X"6D",X"FD",X"35",X"00",X"20",X"16",X"DD",X"7E",X"00",
		X"FD",X"77",X"00",X"CD",X"76",X"04",X"2B",X"CD",X"5C",X"04",X"FD",X"35",X"01",X"20",X"06",X"FD",
		X"36",X"05",X"02",X"AF",X"C9",X"FD",X"36",X"05",X"01",X"AF",X"C9",X"FD",X"7E",X"01",X"CB",X"47",
		X"20",X"0B",X"0E",X"08",X"CD",X"3C",X"04",X"FD",X"36",X"05",X"00",X"AF",X"C9",X"0E",X"0C",X"CD",
		X"3C",X"04",X"FD",X"36",X"05",X"00",X"AF",X"C9",X"FD",X"35",X"02",X"28",X"15",X"FD",X"7E",X"02",
		X"CB",X"47",X"20",X"07",X"0E",X"08",X"CD",X"3C",X"04",X"AF",X"C9",X"0E",X"0C",X"CD",X"3C",X"04",
		X"AF",X"C9",X"FD",X"35",X"03",X"20",X"03",X"3E",X"FF",X"C9",X"FD",X"36",X"05",X"03",X"0E",X"00",
		X"CD",X"3C",X"04",X"AF",X"C9",X"FD",X"35",X"04",X"20",X"DF",X"DD",X"7E",X"04",X"FD",X"77",X"04");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
