----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:15 12/11/2014 
-- Design Name: 
-- Module Name:    eightonemux - Behavioral 
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

entity eightonemux is
    Port ( i7 : in  STD_LOGIC;
           i6 : in  STD_LOGIC;
           i5 : in  STD_LOGIC;
           i4 : in  STD_LOGIC;
           i3 : in  STD_LOGIC;
           i2 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           d : out  STD_LOGIC;
           s2 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s0 : in  STD_LOGIC);
end eightonemux;

architecture Behavioral of eightonemux is

component fouronemux is port
(
			  i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i2 : in  STD_LOGIC;
           i3 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           d : out  STD_LOGIC
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


signal muxout1, muxout0 : std_logic;

begin

fonemux1 : fouronemux port map
(
			  i0 => i4,
			  i1 => i5,
			  i2 => i6,
			  i3 => i7,
       
           s1 => s1,
           s0 => s0,
           d => muxout1
);

fonemux0 : fouronemux port map
(
			  i0 => i0,
			  i1 => i1,
			  i2 => i2,
			  i3 => i3,
       
           s1 => s1,
           s0 => s0,
           d => muxout0
);

tonemux0 : twoonemux port map
(
	i1 => muxout1,
	i0 => muxout0,
	s0 => s2,
	d => d
);

end Behavioral;

