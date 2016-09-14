----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:04:14 12/11/2014 
-- Design Name: 
-- Module Name:    eightbitadder - Behavioral 
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

entity eightbitadder is
    Port ( a7 : in  STD_LOGIC;
           a6 : in  STD_LOGIC;
           a5 : in  STD_LOGIC;
           a4 : in  STD_LOGIC;
           a3 : in  STD_LOGIC;
           a2 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           a0 : in  STD_LOGIC;
           b7 : in  STD_LOGIC;
           b6 : in  STD_LOGIC;
           b5 : in  STD_LOGIC;
           b4 : in  STD_LOGIC;
           b3 : in  STD_LOGIC;
           b2 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
			  cin : in STD_LOGIC;
           s7 : out  STD_LOGIC;
           s6 : out  STD_LOGIC;
           s5 : out  STD_LOGIC;
           s4 : out  STD_LOGIC;
           s3 : out  STD_LOGIC;
           s2 : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s0 : out  STD_LOGIC);
end eightbitadder;

architecture Behavioral of eightbitadder is

component Adder is port 
(
			  a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           ci : in  STD_LOGIC;
           co : out  STD_LOGIC;
           s : out  STD_LOGIC
);
end component;

signal co7, co6, co5 ,co4, co3, co2, co1, co0 : std_logic;

begin

adder7: Adder port map
(
	a => a7,
	b => b7, 
	ci => co6,
	co => co7,
	s => s7
);

adder6: Adder port map
(
	a => a6,
	b => b6, 
	ci => co5,
	co => co6,
	s => s6
);

adder5: Adder port map
(
	a => a5,
	b => b5, 
	ci => co4,
	co => co5,
	s => s5
);


adder4: Adder port map
(
	a => a4,
	b => b4, 
	ci => co3,
	co => co4,
	s => s4
);

adder3: Adder port map
(
	a => a3,
	b => b3, 
	ci => co2,
	co => co3,
	s => s3
);

adder2: Adder port map
(
	a => a2,
	b => b2, 
	ci => co1,
	co => co2,
	s => s2
);

adder1: Adder port map
(
	a => a1,
	b => b1, 
	ci => co0,
	co => co1,
	s => s1
);

adder0: Adder port map
(
	a => a0,
	b => b0, 
	ci => cin,
	co => co0,
	s => s0
);


end Behavioral;

