----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:37:47 12/11/2014 
-- Design Name: 
-- Module Name:    eightbitreg - Behavioral 
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

entity eightbitreg is
    Port ( i7 : in  STD_LOGIC;
           i6 : in  STD_LOGIC;
           i5 : in  STD_LOGIC;
           i4 : in  STD_LOGIC;
           i3 : in  STD_LOGIC;
           i2 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           load : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           clr : in  STD_LOGIC;
           s7 : out  STD_LOGIC;
           s6 : out  STD_LOGIC;
           s5 : out  STD_LOGIC;
           s4 : out  STD_LOGIC;
           s3 : out  STD_LOGIC;
           s2 : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s0 : out  STD_LOGIC);
end eightbitreg;

architecture Behavioral of eightbitreg is

component twoonemux is port 
(
			  i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           d : out  STD_LOGIC
);
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

signal q7_in, q6_in, q5_in, q4_in, q3_in, q2_in, q1_in, q0_in : std_logic; 
signal muxout7, muxout6, muxout5, muxout4, muxout3, muxout2, muxout1, muxout0 : std_logic;
begin

mux7: twoonemux port map
(
	s0 => load,
	i1 => i7,
	i0 => q7_in,
	d => muxout7
);

mux6: twoonemux port map
(
	s0 => load,
	i1 => i6,
	i0 => q6_in,
	d => muxout6
	
);

mux5: twoonemux port map
(

	s0 => load,
	i1 => i5,
	i0 => q5_in,
	d => muxout5
);

mux4: twoonemux port map
(

	s0 => load,
	i1 => i4,
	i0 => q4_in,
	d => muxout4
);

mux3: twoonemux port map
(
	s0 => load,
	i1 => i3,
	i0 => q3_in,
	d => muxout3
);

mux2: twoonemux port map
(
	s0 => load,
	i1 => i2,
	i0 => q2_in,
	d => muxout2
);

mux1: twoonemux port map
(
	s0 => load,
	i1 => i1,
	i0 => q1_in,
	d => muxout1
);

mux0: twoonemux port map
(
	s0 => load,
	i1 => i0,
	i0 => q0_in,
	d => muxout0
);

ff7: dff272 port map
(
	clk => clk,
	clken => '1',
	rst => clr,
	d => muxout7,
	q => q7_in
);
	
ff6: dff272 port map
(
	clk => clk,
	clken => '1',
	rst => clr,
	d => muxout6,
	q => q6_in
);

ff5: dff272 port map
(
	clk => clk,
	clken => '1',
	rst => clr,
	d => muxout5,
	q => q5_in
);

ff4: dff272 port map
(
	clk => clk,
	clken => '1',
	rst => clr,
	d => muxout4,
	q => q4_in
);

ff3: dff272 port map
(
	clk => clk,
	clken => '1',
	rst => clr,
	d => muxout3,
	q => q3_in
);

ff2: dff272 port map
(
	clk => clk,
	clken => '1',
	rst => clr,
	d => muxout2,
	q => q2_in
);
ff1: dff272 port map
(
	clk => clk,
	clken => '1',
	rst => clr,
	d => muxout1,
	q => q1_in
);
ff0: dff272 port map
(
	clk => clk,
	clken => '1',
	rst => clr,
	d => muxout0,
	q => q0_in
);

s7 <= q7_in;
s6 <= q6_in;
s5 <= q5_in;
s4 <= q4_in;
s3 <= q3_in;
s2 <= q2_in;
s1 <= q1_in;
s0 <= q0_in;

end Behavioral;

