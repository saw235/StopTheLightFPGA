----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:10:29 12/07/2014 
-- Design Name: 
-- Module Name:    cmpsev - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmpsix is
    Port ( b2 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
			  eq0 : out  STD_LOGIC;
           eq6 : out  STD_LOGIC);
end cmpsix;

architecture Behavioral of cmpsix is

component Adder is port
(
				a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           ci : in  STD_LOGIC;
           co : out  STD_LOGIC;
           s : out  STD_LOGIC
);
end component;

signal co60, co61, co62, co63: std_logic;
signal co00, co01, co02, co03: std_logic;
signal s60, s61, s62, s63: std_logic;
signal s00, s01, s02, s03: std_logic;

begin


adder63 : Adder port map
(
	a => '0',
	b => '1',
	ci => co62,
	co => co63,
	s => s63
);

adder62 : Adder port map
(
	a => b2,
	b => '0',
	ci => co61,
	co => co62,
	s => s62
);

adder61 : Adder port map
(
	a => b1,
	b => '0',
	ci => co60,
	co => co61,
	s => s61
);

adder60 : Adder port map
(
	a => b0,
	b => '1',
	ci => '1',
	co => co60,
	s => s60
);

adder03 : Adder port map
(
	a => '0',
	b => '1',
	ci => co02,
	co => co03,
	s => s03
);
adder02 : Adder port map
(
	a => b2,
	b => '1',
	ci => co01,
	co => co02,
	s => s02
);
adder01 : Adder port map
(
	a => b1,
	b => '1',
	ci => co00,
	co => co01,
	s => s01
);
adder00 : Adder port map
(
	a => b0,
	b => '1',
	ci => '1',
	co => co00,
	s => s00
);

eq6 <= not (s60 or s61 or s62 or s63); 
eq0 <= not (s00 or s01 or s02 or s03);


end Behavioral;

