----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:10 11/20/2014 
-- Design Name: 
-- Module Name:    BCDsingledigit - Behavioral 
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

entity BCDsingledigit is port
(
	rst : in std_logic;
	clk : in std_logic;
	
	count : in std_logic;
	
	s3: out std_logic;
	s2: out std_logic;
	s1: out std_logic;
	s0: out std_logic

);
end BCDsingledigit;

architecture Behavioral of BCDsingledigit is

component compareten is port
(				
			  b0 : in  STD_LOGIC; --right most bit
           b1 : in  STD_LOGIC;
           b2 : in  STD_LOGIC;
           b3 : in  STD_LOGIC; -- left most bit
           equal : out  STD_LOGIC
);
end component;

component counter is port
(
			Count : in  STD_LOGIC;
				clk : in STD_LOGIC;
           s0 : out  STD_LOGIC; --right most bit
           s1 : out  STD_LOGIC;
           s2 : out  STD_LOGIC;
           s3 : out  STD_LOGIC; --left most bit
           Rst : in  STD_LOGIC
);
end component;


signal s0_in, s1_in, s2_in, s3_in : std_logic;
signal clr, eq: std_logic;

begin

clr <= rst or eq;
count1 : Counter port map
(
	Count => count,
				clk => clk,
           s0 => s0_in,
           s1 => s1_in,
           s2 => s2_in,
           s3 => s3_in,--left most bit
           Rst => clr
);

cmp : compareten port map
(
			  b0 => s0_in,
           b1 => s1_in,
           b2 => s2_in,
           b3 => s3_in, -- left most bit
           equal => eq
);

 s0 <= s0_in;
 s1 <= s1_in;
 s2 <= s2_in;
 s3 <= s3_in;
			  
			  
end Behavioral;

