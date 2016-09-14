----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:13 12/10/2014 
-- Design Name: 
-- Module Name:    twoonemux - Behavioral 
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

entity twoonemux is
    Port ( i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           d : out  STD_LOGIC);
end twoonemux;

architecture Behavioral of twoonemux is

begin

d <= (i0 and not s0)or (i1 and s0);

end Behavioral;

