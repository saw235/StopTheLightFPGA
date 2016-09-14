----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:58:08 12/10/2014 
-- Design Name: 
-- Module Name:    leftrightcontrol - Behavioral 
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

entity leftrightcontrol is
    Port ( clk : in STD_LOGIC;
			  eq0 : in  STD_LOGIC;
           eq6 : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           leftright : out  STD_LOGIC);
end leftrightcontrol;

architecture Behavioral of leftrightcontrol is

component dff271 is port
(
		clk 	: in std_logic ;
	 --clken	: in std_logic ;
		 rst 	: in std_logic ;
		 d 	: in std_logic ;
		 q 	: out std_logic
);
end component;

signal q_in, d_in : std_logic;

begin

ff0 : dff271 port map
(
	clk => clk,
	rst => rst,
	d => d_in,
	q => q_in
);

d_in <= (q_in and eq6) or ( not eq0 and eq6) or (q_in and not eq0);
leftright <= not q_in;


end Behavioral;

