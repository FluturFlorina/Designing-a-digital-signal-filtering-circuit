----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 03:54:35 AM
-- Design Name: 
-- Module Name: SAT4_8 - Behavioral
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

entity SAT4_8 is
Port 
(
signal x:in std_logic_vector(7 downto 0);
signal y:in std_logic_vector(7 downto 0);
signal s:out std_logic_vector(7 downto 0);
signal tin:in std_logic;
signal tout:out std_logic
 );
end SAT4_8;

architecture Behavioral of SAT4_8 is
signal g,p:std_logic_vector(7 downto 0);
signal t:std_logic_vector(8 downto 0);

signal t_nefolosit:std_logic_vector(7 downto 0);
begin
g(0)<=x(0) and y(0);
g(1)<=x(1) and y(1);
g(2)<=x(2) and y(2);
g(3)<=x(3) and y(3);
g(4)<=x(4) and y(4);
g(5)<=x(5) and y(5);
g(6)<=x(6) and y(6);
g(7)<=x(7) and y(7);

p(0)<=x(0) or y(0);
p(1)<=x(1) or y(1);
p(2)<=x(2) or y(2);
p(3)<=x(3) or y(3);
p(4)<=x(4) or y(4);
p(5)<=x(5) or y(5);
p(6)<=x(6) or y(6);
p(7)<=x(7) or y(7);

t(0)<=tin;
t(1)<=g(0) or (p(0) and t(0));
t(2)<=g(1) or (p(1) and t(1));
t(3)<=g(2) or (p(2) and t(2));
t(4)<=g(3) or (p(3) and t(3));
t(5)<=g(4) or (p(4) and t(4));
t(6)<=g(5) or (p(5) and t(5));
t(7)<=g(6) or (p(6) and t(6));
t(8)<=g(7) or (p(7) and t(7));
tout<=t(8);

se0:entity WORK.SE port map
(
x=>x(0),
y=>y(0),
tin=>t(0),
tout=>t_nefolosit(0),
s=>s(0)
);

se1:entity WORK.SE port map
(
x=>x(1),
y=>y(1),
tin=>t(1),
tout=>t_nefolosit(1),
s=>s(1)
);

se2:entity WORK.SE port map
(
x=>x(2),
y=>y(2),
tin=>t(2),
tout=>t_nefolosit(2),
s=>s(2)
);

se3:entity WORK.SE port map
(
x=>x(3),
y=>y(3),
tin=>t(3),
tout=>t_nefolosit(3),
s=>s(3)
);

se4:entity WORK.SE port map
(
x=>x(4),
y=>y(4),
tin=>t(4),
tout=>t_nefolosit(4),
s=>s(4)
);

se5:entity WORK.SE port map
(
x=>x(5),
y=>y(5),
tin=>t(5),
tout=>t_nefolosit(5),
s=>s(5)
);

se6:entity WORK.SE port map
(
x=>x(6),
y=>y(6),
tin=>t(6),
tout=>t_nefolosit(6),
s=>s(6)
);

se7:entity WORK.SE port map
(
x=>x(7),
y=>y(7),
tin=>t(7),
tout=>t_nefolosit(7),
s=>s(7)
);

end Behavioral;
