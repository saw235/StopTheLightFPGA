----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:40 12/07/2014 
-- Design Name: 
-- Module Name:    updowncounter - Behavioral 
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

--reset doesnt reset to 3, as in stores 3 into flip flop


entity updowncounter is
    Port ( c1 : in  STD_LOGIC;
           c0 : in  STD_LOGIC;
           count : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           s2 : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s0 : out  STD_LOGIC);
end updowncounter;

architecture Behavioral of updowncounter is

component Adder is port
(
			a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           ci : in  STD_LOGIC;
           co : out  STD_LOGIC;
           s : out  STD_LOGIC);
			  
end component;
component dff272 is port
(
		clk 	: in std_logic ;
	  clken	: in std_logic ;
		 rst 	: in std_logic ;
		 d 	: in std_logic ;
		 q 	: out std_logic
    );
end component;


component twoonemux is port
(
			  i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           d : out  STD_LOGIC
);
end component;

signal muxout2, muxout1, muxout0 : std_logic;
signal ffmuxout2, ffmuxout1, ffmuxout0 : std_logic;
signal s2_in, s1_in, s0_in : std_logic;
signal q2_in, q1_in, q0_in : std_logic;
signal co2, co1, co0 : std_logic;


begin

adder2: Adder port map
(
	a => muxout2,
	b => q2_in,
	ci => co1,
	co => co2,
	s => s2_in
);

adder1: Adder port map
(
	
	a => muxout1,
	b => q1_in,
	ci => co0,
	co => co1,
	s => s1_in
);

adder0 : Adder port map
(

	a => muxout0,
	b => q0_in,
	ci => '0',
	co => co0,
	s => s0_in
);

dff2 : dff272 port map
(
	clk => clk,
	clken => count,
	rst => '0',
	d => ffmuxout2,
	q => q2_in
);

dff1 : dff272 port map
(
	clk => clk,
	clken => count,
	rst => '0',
	d => ffmuxout1,
	q => q1_in
);

dff0 : dff272 port map
(
	clk => clk,
	clken => count,
	rst => '0',
	d => ffmuxout0,
	q => q0_in
);

mux2 : twoonemux port map
(
				i0 => '1',
           i1 => '0',
           s0 => c0,
           d => muxout2
);

mux1 : twoonemux port map
(
				i0 => '1',
           i1 => '0',
           s0 => c0,
           d => muxout1
);

mux0 : twoonemux port map
(
		  i0 => '1',
           i1 => '1',
           s0 => c0,
           d => muxout0
);

ffmux2 : twoonemux port map
(
	i0 => s2_in,
           i1 => '0',
           s0 => c1,
           d => ffmuxout2
);

ffmux1 : twoonemux port map
(
	i0 => s1_in,
           i1 => '1',
           s0 => c1,
           d => ffmuxout1
);

ffmux0 : twoonemux port map
(

		i0 => s0_in,
           i1 => '1',
           s0 => c1,
           d => ffmuxout0
);

s2 <= q2_in;
s1 <= q1_in;
s0 <= q0_in;

end Behavioral;

