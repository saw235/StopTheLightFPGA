----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:50 12/08/2014 
-- Design Name: 
-- Module Name:    TopLevel - Behavioral 
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

entity TopLevel is
    Port ( 
			  b_input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  rst : in std_logic;
			  A : out  STD_LOGIC;
           B : out  STD_LOGIC;
           C : out  STD_LOGIC;
           D : out  STD_LOGIC;
           E : out  STD_LOGIC;
           F : out  STD_LOGIC;
           G : out  STD_LOGIC;
			  Anode0: out STD_LOGIC;
			  Anode1: out STD_LOGIC;
			  Anode2: out STD_LOGIC;
			  Anode3: out STD_LOGIC;
           led0 : out  STD_LOGIC;
           led1 : out  STD_LOGIC;
           led2 : out  STD_LOGIC;
           led3 : out  STD_LOGIC;
           led4 : out  STD_LOGIC;
           led5 : out  STD_LOGIC;
           led6 : out  STD_LOGIC);
end TopLevel;

architecture Behavioral of TopLevel is
component BCDsingledigit is port
(
	rst : in std_logic;
	clk : in std_logic;
	
	count : in std_logic;
	
	s3: out std_logic;
	s2: out std_logic;
	s1: out std_logic;
	s0: out std_logic

);
end component;

component sevsegdd is port
(
				clk : in STD_LOGIC;
			  a0: in STD_LOGIC; --most left bit
			  a1: in STD_LOGIC;
			  a2: in STD_LOGIC;
			  a3: in STD_LOGIC; --most right bit
		     b0: in STD_LOGIC;
			  b1: in STD_LOGIC;
			  b2: in STD_LOGIC;
			  b3: in STD_LOGIC;
			  c0: in STD_LOGIC;
			  c1: in STD_LOGIC;
			  c2: in STD_LOGIC;
			  c3: in STD_LOGIC;
			  d0: in STD_LOGIC;
			  d1: in STD_LOGIC;
			  d2: in STD_LOGIC;
			  d3: in STD_LOGIC;
			  anode0 : out  STD_LOGIC;
           anode1 : out  STD_LOGIC;
           anode2 : out  STD_LOGIC;
           anode3 : out  STD_LOGIC;
           A : out  STD_LOGIC;
           B : out  STD_LOGIC;
           C : out  STD_LOGIC;
           D : out  STD_LOGIC;
           E : out  STD_LOGIC;
           F : out  STD_LOGIC;
           G : out  STD_LOGIC
);
end component;

component sloclk is port
(
		clk : in std_logic;
		Sclk : out std_logic
);
end component;
component updowncounter is port
(
			  c1 : in  STD_LOGIC;
           c0 : in  STD_LOGIC;
           count : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           s2 : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s0 : out  STD_LOGIC
);
end component;

--eq := 1 if (b0-b2 == 6 or 0)
component cmpsix is port
(
			  b2 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           eq0 : out  STD_LOGIC;
			  eq6 : out  STD_LOGIC
);

end component;


component leftrightcontrol is port
(			  clk : in STD_logic;
			  eq0 : in  STD_LOGIC;
           eq6 : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           leftright : out  STD_LOGIC
);
end component;

component eightbitloadcount is port
(
	i7 : in  STD_LOGIC;
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
           s0 : out  STD_LOGIC
);
end component;


component bitcounter is port
(			  
				clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           s0 : out  STD_LOGIC
);
end component;

component threeeightdec is port
(
			i2 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           d0 : out  STD_LOGIC;
           d1 : out  STD_LOGIC;
           d2 : out  STD_LOGIC;
           d3 : out  STD_LOGIC;
           d4 : out  STD_LOGIC;
           d5 : out  STD_LOGIC;
           d6 : out  STD_LOGIC;
           d7 : out  STD_LOGIC
);

end component;

component clkdiv is port
 ( 
			  i7 : in  STD_LOGIC;
           i6 : in  STD_LOGIC;
           i5 : in  STD_LOGIC;
           i4 : in  STD_LOGIC;
           i3 : in  STD_LOGIC;
           i2 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           sclk : out  STD_LOGIC);
end component;

component eightonemux is port
(
		i7 : in  STD_LOGIC;
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
           s0 : in  STD_LOGIC
);
end component;

component UserInput is port
(
				input : in  STD_LOGIC;
			   clk : in STD_LOGIC;
				rst : in STD_LOGIC;
           input_pulse : out  STD_LOGIC
);
end component;


signal leftright, sclk: std_logic;
signal s2, s1, s0: std_logic;
signal equal0, equal6: std_logic;
signal scount: std_logic;
signal sen: std_logic;
signal tick4, tick3, tick2, tick1, tick0: std_logic;
signal tick : std_logic;
signal level2, level1, level0 : std_logic;
signal butpress : std_logic;
signal scored, failed : std_logic;
signal score3, score2, score1, score0 : std_logic;
signal failed3, failed2, failed1, failed0 : std_logic;
signal led3_in : std_logic;
signal lifeequal0, lifeequal6 : std_logic;
signal rstgame : std_logic;
signal scoreequal0, scoreequal6: std_logic;
begin

rstgame <= rst or lifeequal0 or scoreequal6;

lrcontrol : leftrightcontrol port map
(
			  clk => clk,
			  eq0 => equal0,
           eq6 => equal6,
			  rst => rstgame,
           leftright => leftright
);
threebitcounter : updowncounter port map
(
	 c1 =>  rstgame,
    c0 => leftright,
	 count => '1',
    clk => tick,
    s2 => s2,
    s1 => s1,
    s0 => s0
);

--4200hz
slclk : sloclk port map
(
	clk => clk,
	Sclk => sen
);

--20hz
clkdiv4: clkdiv port map
(
			  i7 => '1',
           i6 => '1',
           i5 => '0',
           i4 => '1',
           i3 => '0',
           i2 => '0',
           i1 => '0',
           i0 => '1',
           clk => sen,
           sclk => tick4
        
);
--25hz
clkdiv3: clkdiv port map
(
			  i7 => '1',
           i6 => '0',
           i5 => '1',
           i4 => '0',
           i3 => '0',
           i2 => '1',
           i1 => '1',
           i0 => '1',
           clk => sen,
           sclk => tick3
);
--35hz
clkdiv2: clkdiv port map
(
			  i7 => '0',
           i6 => '1',
           i5 => '1',
           i4 => '1',
           i3 => '0',
           i2 => '1',
           i1 => '1',
           i0 => '1',
           clk => sen,
           sclk => tick2
);
--50hz
clkdiv1: clkdiv port map
(
			  i7 => '0',
           i6 => '1',
           i5 => '0',
           i4 => '1',
           i3 => '0',
           i2 => '0',
           i1 => '1',
           i0 => '1',
           clk => sen,
           sclk => tick1
);
--70hz
clkdiv0: clkdiv port map
(
			  i7 => '0',
           i6 => '1',
           i5 => '0',
           i4 => '0',
           i3 => '0',
           i2 => '1',
           i1 => '0',
           i0 => '1',
           clk => sen,
           sclk => tick0
);

eonemux : eightonemux port map
(
			  i7 => '0',
           i6 => '0',
           i5 => '0',
           i4 => tick0,
           i3 => tick1,
           i2 => tick3,
           i1 => tick2,
           i0 => tick4,
           d => tick,
           s2 => score2,
           s1 => score1,
           s0 => score0
);
sixorzero : cmpsix port map
(
	 b2 => s2,
           b1 => s1,
           b0 => s0,
           eq0 => equal0,
			  eq6 => equal6
);

dec : threeeightdec port map
(
	i2 => s2,
           i1 => s1,
           i0 => s0,
           d0 => led0,
           d1 => led1,
           d2 => led2,
           d3 => led3_in,
           d4 => led4,
           d5 => led5,
           d6 => led6
);

player: UserInput port map
(
	input => b_input,
			   clk => clk,
				rst => rstgame,
           input_pulse => butpress
);

scored <= butpress and led3_in;
failed <= butpress and not led3_in;

led3 <= led3_in;

levelcount : cmpsix port map
(
			  b2 => score2,
           b1 => score1,
           b0 => score0,
           eq0 => scoreequal0,
			  eq6 => scoreequal6
);


failedcount : eightbitloadcount port map
(
			i7 => '0',
			i6 => '0',
			i5 => '0',
			i4 => '0',
			i3 => '0',
			i2 => '1',
			i1 => '1',
			i0 => '1',
			count => failed,
			load => rstgame,
			clr => '0',
			clk => clk,
			s3 => failed3,
			s2 => failed2,
			s1 => failed1,
			s0 => failed0
);

nolifeleft : cmpsix port map
(
				b2 => failed2,
           b1 => failed1,
           b0 => failed0,
           eq0 => lifeequal0,
			  eq6 => lifeequal6
);



level: BCDsingledigit port map
(
	rst => rstgame,
	clk => clk,
	
	count => scored,
	
	s3 => score3,
	s2 => score2,
	s1 => score1,
	s0 => score0

);

ssd: sevsegdd port map
(
	clk => clk,
 a0=>failed3,
 a1=>failed2,
 a2=>failed1,
 a3=>failed0,
 b0=>'0',
 b1=>'0',
 b2=>'0',
 b3=>'0',
 c0=>'0',
 c1=>'0',
 c2=>'0',
 c3=>'0',
 d0=>score3,
 d1=>score2,
 d2=>score1,
 d3=>score0,
			  anode0 => Anode0,
			  anode3 => Anode3,

 A => A,
 B => B,
 C => C,
 D => D,
 E => E,
 F => F,
 G => G 
);

Anode1 <= '1';
Anode2 <= '1';

end Behavioral;

