----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2023 09:34:40 PM
-- Design Name: 
-- Module Name: sat_simu - Behavioral
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

entity sat_simu is
--  Port ( );
end sat_simu;

architecture Behavioral of sat_simu is

signal x: std_logic_vector(7 downto 0);
signal y: std_logic_vector(7 downto 0);
signal s: std_logic_vector(7 downto 0);
signal tin: std_logic;
signal tout: std_logic;

component SAT4_8 is  
port
(
signal x:in std_logic_vector(7 downto 0);
signal y:in std_logic_vector(7 downto 0);
signal s:out std_logic_vector(7 downto 0);
signal tin:in std_logic;
signal tout:out std_logic
);
end component SAT4_8;

begin

sat_simu: SAT4_8 port map
(
x=>x,
y=>y,
s=>s,
tin=>tin,
tout=>tout
);

x <= "11111111" after 0 ns,"00000100" after 20 ns, "00100001" after 40 ns,"10000011" after 60 ns,"10000110" after 80 ns, "11101111" after 100 ns,"11100011" after 120 ns,"01001110" after 140 ns, "00011001" after 160 ns,"10100011" after 180 ns,"00011110" after 200 ns, "11001101" after 220 ns;
y <= "11111111" after 0 ns,"00000110" after 30 ns, "00001001" after 50 ns,"00100011" after 70 ns,"00010110" after 90 ns, "11011001" after 110 ns,"00010110" after 130 ns, "01101001" after 150 ns,"00101011" after 170 ns,"00010111" after 190 ns, "11101001" after 210 ns,"11011001" after 230 ns;
tin<= '1' after 0 ns,'0' after 20 ns,'1' after 40 ns,'0' after 60 ns,'1' after 80 ns,'0' after 100 ns,'1' after 120 ns,'0' after 140 ns,'1' after 160 ns,'0' after 180 ns,'1' after 200 ns,'0' after 220 ns,'1' after 240 ns,'0' after 260 ns,'1' after 280 ns;


end Behavioral;
