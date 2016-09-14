----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:17:57 12/07/2014 
-- Design Name: 
-- Module Name:    bitcounter - Behavioral 
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





--bit counter to control left and right --1 increase -- 0 decrease
entity bitcounter is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           s0 : out  STD_LOGIC);
end bitcounter;

architecture Behavioral of bitcounter is

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

signal q0, co0, s0_in :std_logic;

begin

adder0: Adder port map
(
	a => '1',
	b => q0,
	ci => '0',
	co => co0,
	s => s0_in
);


dff : dff272 port map
(
	clk => clk,
	clken => en,
	rst => '0' ,
	q => q0,
	d => s0_in
);

s0 <= s0_in;

end Behavioral;

