------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 10/16/14
-- Lab # and name	: Lab5 - Runway Lights
-- Student 1		: Robin Panda
-- Student 2		: That Other Guy Jr.

-- Description		: Produces a slow clock for various purposes
--					  Utilizes code style that should not be used elsewhere in lab.

-- Changes 
-- 		1.0	- Original (1/2 Hz)

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------

-- Library Declarations 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity 
entity sloclk is
    Port ( clk : in  STD_LOGIC;
		   Sclk: out STD_LOGIC
		  );
end sloclk;

-- Architecture 
-- DO NOT USE THESE IN YOUR CODE
architecture Behavioral of sloclk is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------

	-- NONE	
	
	-------------------------------------------------------
	-- Internal Signal Declarations	
	-------------------------------------------------------

signal cnt: std_logic_vector (13 downto 0);
signal s: STD_LOGIC;

begin
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------

	-- NONE

	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------

-- DO NOT USE THIS CODE STYLE IN YOUR CODE! I DO NOT WANT TO SEE PROCESS OR EVENT!
--1001100010010110100000 20hz
--10011000100101101000000 10hz
--10011000100101101000 80hz
--10111010000001 approximately 4200hz
	process(clk)
		begin 
			if clk'event and clk = '1' then
				-- every 12.5M clocks
				if cnt = "10111010000001" then
					s <= not s; -- toggle s
					cnt <="00000000000000";
				else
					cnt <= cnt +1;
				end if;
			end if;
	end process;
	
	Sclk <= s;
	
end Behavioral;

