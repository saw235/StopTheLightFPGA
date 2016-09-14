----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:34:07 12/11/2014 
-- Design Name: 
-- Module Name:    clkdiv - Behavioral 
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

entity clkdiv is
    Port ( i7 : in  STD_LOGIC;
           i6 : in  STD_LOGIC;
           i5 : in  STD_LOGIC;
           i4 : in  STD_LOGIC;
           i3 : in  STD_LOGIC;
           i2 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           sclk : out  STD_LOGIC);
end clkdiv;

architecture Behavioral of clkdiv is

component eightbitloadcount is port
(
				i7 : in STD_LOGIC;
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
           tc : out  STD_LOGIC
);
end component;

signal p : std_logic;

begin

counter: eightbitloadcount port map
(
	i7 => i7,
	i6 => i6,
	i5 => i5,
	i4 => i4,
	i3 => i3,
	i2 => i2,
	i1 => i1,
	i0 => i0,
	count => '1',
	load => p,
	clr => '0',
	clk => clk,
	tc => p
);

sclk <= p;
end Behavioral;

