----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2023 07:23:06 PM
-- Design Name: 
-- Module Name: nexys4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nexys4 is
Port 
(
signal clk:in std_logic;
signal btn:in std_logic_vector(4 downto 0);
signal sw:in std_logic_vector(15 downto 0);
signal led:out std_logic_vector(15 downto 0); 
signal an:out std_logic_vector(7 downto 0);
signal cat:out std_logic_vector(7 downto 0)
 );
end nexys4;

architecture Behavioral of nexys4 is
--memorie
type memorie is array(0 to 15) of std_logic_vector(63 downto 0);
signal memorie_16_64:memorie:=(
--pixel2* pixel1    -- (a+b+g+r)/4   --255-9  sau 6+9
0=>"0000001100000010000000110000110000000101000001100000011000001001", --3 2 3 12 5 6 6 9
1=>"1111101111111010111000111010110011100101101101101110011111101101", --FB FA E3 AC E5 B6 E7 ED
others=>"0010101100000011000100110100110000100101000101100110010100101001");--2B 3 13 4C 25 16 65 29

signal currentpixelValue:std_logic_vector(7 downto 0);
signal brightness:std_logic_vector(7 downto 0);
signal R:std_logic_vector(7 downto 0);
signal G:std_logic_vector(7 downto 0);
signal B:std_logic_vector(7 downto 0);
signal A:std_logic_vector(7 downto 0);
signal pixel1:std_logic_vector(7 downto 0);
signal pixel2:std_logic_vector(7 downto 0);

--
signal date:std_logic_vector(31 downto 0);
signal counter_adrese:std_logic_vector(3 downto 0):=(others=>'0');
signal enable_counter:std_logic;

signal WD:std_logic_vector(63 downto 0);
signal RD:std_logic_vector(63 downto 0);

--rezultate
signal newPixelValue1:std_logic_vector(7 downto 0);
signal grayscalePixel:std_logic_vector(7 downto 0);
signal newPixelValue2:std_logic_vector(7 downto 0);

signal val_mux:std_logic_vector(7 downto 0);
begin

--mpg
mpg1:entity work.mpg port map
(
btn=>btn(0),
clk=>clk,
en=>enable_counter
);

--counter
process(clk)
begin
if clk='1' and clk'event then 
    if enable_counter='1' then
        counter_adrese<=counter_adrese+1;
    end if;
end if;
end process;

--memorie
process(clk)
begin
if clk='1' and clk'event then
    if sw(0)='0' then
        memorie_16_64(conv_integer(counter_adrese))<=WD;
    else
        RD<=memorie_16_64(conv_integer(counter_adrese));
    end if;
end if;
end process;

 currentpixelValue<=RD(7 downto 0);
 brightness<=RD(15 downto 8);
 R<=RD(23 downto 16);
 G<=RD(31 downto 24);
 B<=RD(39 downto 32);
 A<=RD(47 downto 40);
 pixel1<=RD(55 downto 48);
 pixel2<=RD(63 downto 56);

--filtru3
fil3:entity WORK.filtru3 port map
(
 pixel1=>pixel1,
 pixel2=>pixel2,
 newPixelValue=>newPixelValue2
);

--filtru2
fil2:entity WORK.filtru2 port map
(
 r=>R,
 g=>G,
 b=>B,
 a=>A,
 grayscalePixel=>grayscalePixel
);

--filtru1
fil1:entity WORK.filtru1 port map
(
 currPixelValue=>currentpixelValue,
 brightness=>brightness,
 sel=>sw(1),
 newPixelValue=>newPixelValue1
);

--alegere filtru
process(sw,newPixelValue1,grayscalePixel,newPixelValue2)
begin
case sw(3 downto 2) is
    when "00"=>val_mux<=newPixelValue1;
    when "01"=>val_mux<=grayscalePixel;
    when "10"=>val_mux<=newPixelValue2;
    when others =>val_mux<=x"00";
end case;
end process;

date<=x"000000" & val_mux;

--ssd
Afisor:entity WORK.displ7seg port map
(
 Clk=>clk,
 Rst=>'0',
 Data=>date,
 An =>an,
 Seg=>cat
);
end Behavioral;
