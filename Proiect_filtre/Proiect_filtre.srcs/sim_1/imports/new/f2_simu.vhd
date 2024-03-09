----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2023 10:20:43 PM
-- Design Name: 
-- Module Name: f2_simu - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity f2_simu is
--  Port ( );
end f2_simu;

architecture Behavioral of f2_simu is

signal r: std_logic_vector(7 downto 0);
signal g: std_logic_vector(7 downto 0);
signal b: std_logic_vector(7 downto 0);
signal a: std_logic_vector(7 downto 0);
signal grayscalePixel: std_logic_vector(7 downto 0);

component filtru2 is
port
(
signal r:in std_logic_vector(7 downto 0);
signal g:in std_logic_vector(7 downto 0);
signal b:in std_logic_vector(7 downto 0);
signal a:in std_logic_vector(7 downto 0);
signal grayscalePixel:out std_logic_vector(7 downto 0)
);
end component filtru2;

begin

f2_simu: filtru2 port map
(
r=>r,
g=>g,
b=>b,
a=>a,
grayscalePixel=>grayscalePixel
);


r <= "11111111" after 0 ns,"00010001" after 20 ns,"01000100" after 60 ns,"10010001" after 70 ns,"01010110" after 90 ns, "00011001" after 130 ns,"00100001" after 150 ns,"01001010" after 200 ns, "01110001" after 250 ns, "10110001" after 270 ns;
g <= "11111111" after 0 ns  ,"10010000" after 40 ns,"10000101" after 70 ns,"11001100" after 80 ns, "00100001" after 100 ns, "01101101" after 140 ns,"11110100" after 200 ns, "01011001" after 240 ns,"00111001" after 250 ns,"11111000" after 260 ns, "01010101" after 270 ns, "00111001" after 280 ns;
b <= "11111111" after 0 ns , "00110001" after 30 ns,"00100010" after 80 ns,"11110101" after 90 ns,"01001110" after 120 ns, "11011011" after 130 ns,"00111001" after 190 ns,"01001000" after 200 ns, "11010011" after 210 ns, "10111001" after 220 ns;
a <= "11111111" after 0 ns ,"11011000" after 50 ns,"00100001" after 90 ns,"01001000" after 100 ns, "01010001" after 110 ns, "00110101" after 120 ns,"11101110" after 200 ns, "01101001" after 240 ns,"00110101" after 250 ns,"11001000" after 260 ns, "01011101" after 270 ns, "00110101" after 280 ns;


end Behavioral;
