----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2023 09:47:50 PM
-- Design Name: 
-- Module Name: sst_simu - Behavioral
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

entity sst_simu is
--  Port ( );
end sst_simu;

architecture Behavioral of sst_simu is

signal x:  std_logic_vector(7 downto 0);
signal y:  std_logic_vector(7 downto 0);
signal z:  std_logic_vector(7 downto 0);
signal w:  std_logic_vector(7 downto 0);
signal s:  std_logic_vector(8 downto 0);

component SST4_8 is
port
(
signal x: in std_logic_vector(7 downto 0);
signal y: in std_logic_vector(7 downto 0);
signal z: in std_logic_vector(7 downto 0);
signal w: in std_logic_vector(7 downto 0);
signal s: out std_logic_vector(8 downto 0)
);
end component SST4_8;


begin

sst_simu: SST4_8 port map
(
x=>x,
y=>y,
z=>z,
w=>w,
s=>s
);


x <= "11111111" after 0 ns,"00010001" after 20 ns,"01000000" after 60 ns,"10010001" after 70 ns,"01010110" after 90 ns, "00011001" after 130 ns,"00100001" after 150 ns,"01001000" after 200 ns, "01110001" after 250 ns, "10110001" after 270 ns;
y <= "11111111" after 0 ns  ,"10010000" after 40 ns,"10000001" after 70 ns,"11000000" after 80 ns, "00100001" after 100 ns, "01100001" after 140 ns,"11110100" after 200 ns, "01011001" after 240 ns,"00111001" after 250 ns,"11001000" after 260 ns, "01010101" after 270 ns, "00111001" after 280 ns;
z <= "11111111" after 0 ns , "00010001" after 30 ns,"00100010" after 80 ns,"11110001" after 90 ns,"00001110" after 120 ns, "11011001" after 130 ns,"00100001" after 190 ns,"01001000" after 200 ns, "11010001" after 210 ns, "10110001" after 220 ns;
w <= "11111111" after 0 ns ,"11001000" after 50 ns,"00100001" after 90 ns,"01001000" after 100 ns, "01010001" after 110 ns, "00110001" after 120 ns,"11101110" after 200 ns, "01101001" after 240 ns,"00110001" after 250 ns,"11001000" after 260 ns, "01011001" after 270 ns, "00110101" after 280 ns;


end Behavioral;
