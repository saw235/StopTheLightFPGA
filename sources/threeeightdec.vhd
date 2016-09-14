----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:08:12 12/07/2014 
-- Design Name: 
-- Module Name:    threeeightdec - Behavioral 
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

entity threeeightdec is
    Port ( i2 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           d0 : out  STD_LOGIC;
           d1 : out  STD_LOGIC;
           d2 : out  STD_LOGIC;
           d3 : out  STD_LOGIC;
           d4 : out  STD_LOGIC;
           d5 : out  STD_LOGIC;
           d6 : out  STD_LOGIC;
           d7 : out  STD_LOGIC);
end threeeightdec;

architecture Behavioral of threeeightdec is

begin

d0 <= not i2 and not i1 and not i0;
d1 <= not i2 and not i1 and i0;
d2 <= not i2 and i1 and not i0;
d3 <= not i2 and i1 and i0;
d4 <= i2 and not i1 and not i0;
d5 <= i2 and not i1 and i0;
d6 <= i2 and i1 and not i0;
d7 <= i2 and i1 and i0;

end Behavioral;

