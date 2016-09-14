----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:52:24 12/11/2014 
-- Design Name: 
-- Module Name:    eightbitloadcount - Behavioral 
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

entity eightbitloadcount is
    Port ( i7 : in  STD_LOGIC;
           i6 : in  STD_LOGIC;
           i5 : in  STD_LOGIC;
           i4 : in  STD_LOGIC;
           i3 : in  STD_LOGIC;
           i2 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
			  count : in STD_LOGIC; 
           load : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           tc : out  STD_LOGIC;
           s7 : out  STD_LOGIC;
           s6 : out  STD_LOGIC;
           s5 : out  STD_LOGIC;
           s4 : out  STD_LOGIC;
           s3 : out  STD_LOGIC;
           s2 : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s0 : out  STD_LOGIC);
end eightbitloadcount;

architecture Behavioral of eightbitloadcount is

component twoonemux is port
(
  i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           d : out  STD_LOGIC
);
end component;

component eightbitreg is port
(
	i7 : in  STD_LOGIC;
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
           s0 : out  STD_LOGIC
);
end component;

component eightbitadder is port
(
			  a7 : in  STD_LOGIC;
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
           s0 : out  STD_LOGIC
);
end component;

signal loadreg : std_logic;
signal muxout7, muxout6, muxout5, muxout4, muxout3, muxout2, muxout1, muxout0 : std_logic;
signal s7_in, s6_in, s5_in, s4_in, s3_in, s2_in, s1_in, s0_in : std_logic; 
signal q7_in, q6_in, q5_in, q4_in, q3_in, q2_in, q1_in, q0_in : std_logic;

begin

loadreg <= count or load;

reg : eightbitreg port map
(
			  i7 => muxout7,
           i6 => muxout6,
           i5 => muxout5,
           i4 => muxout4,
           i3 => muxout3,
           i2 => muxout2,
           i1 => muxout1,
           i0 => muxout0,
           load => loadreg,
			  clk => clk,
           clr => clr,
           s7 => s7_in,
           s6 => s6_in,
           s5 => s5_in,
           s4 => s4_in,
           s3 => s3_in,
           s2 => s2_in,
           s1 => s1_in,
           s0 => s0_in
);

			  s7 <= s7_in;
           s6 <= s6_in;
           s5 <= s5_in;
           s4 <= s4_in;
           s3 <= s3_in;
           s2 <= s2_in;
           s1 <= s1_in;
           s0 <= s0_in;
			  
adder : eightbitadder port map
(
			  a7 => s7_in,
           a6 => s6_in,
           a5 => s5_in,
           a4 => s4_in,
           a3 => s3_in,
           a2 => s2_in,
           a1 => s1_in,
           a0 => s0_in,
           b7 => '1',
           b6 => '1',
           b5 => '1',
           b4 => '1',
           b3 => '1',
           b2 => '1',
           b1 => '1',
           b0 => '1',
			  cin => '0',
           s7 => q7_in,
           s6 => q6_in,
           s5 => q5_in,
           s4 => q4_in,
           s3 => q3_in,
           s2 => q2_in,
           s1 => q1_in,
           s0 => q0_in
);

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

tc <= s7_in and s6_in and s5_in and s4_in and s3_in and s2_in and s1_in and s0_in;

end Behavioral;

