----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 03:53:43 AM
-- Design Name: 
-- Module Name: SST4_8 - Behavioral
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

entity SST4_8 is --sumator cu propagarea succesiva a transportului
Port 
(
signal x: in std_logic_vector(7 downto 0);
signal y: in std_logic_vector(7 downto 0);
signal z: in std_logic_vector(7 downto 0);
signal w: in std_logic_vector(7 downto 0);
signal s: out std_logic_vector(8 downto 0)
 );
end SST4_8;

architecture Behavioral of SST4_8 is

signal transport_nivel1:std_logic_vector(7 downto 0);
signal sume_nivel1:std_logic_vector(7 downto 0);

signal transport_nivel2:std_logic_vector(8 downto 0);
signal sume_nivel2:std_logic_vector(8 downto 0);

signal transport_inutil:std_logic;
begin

--primul nivel
se0:entity WORK.SE port map
(
x=>x(0),
y=>y(0),
tin=>z(0),
tout=>transport_nivel1(0),
s=>sume_nivel1(0)
);

se1:entity WORK.SE port map
(
x=>x(1),
y=>y(1),
tin=>z(1),
tout=>transport_nivel1(1),
s=>sume_nivel1(1)
);

se2:entity WORK.SE port map
(
x=>x(2),
y=>y(2),
tin=>z(2),
tout=>transport_nivel1(2),
s=>sume_nivel1(2)
);

se3:entity WORK.SE port map
(
x=>x(3),
y=>y(3),
tin=>z(3),
tout=>transport_nivel1(3),
s=>sume_nivel1(3)
);

se4:entity WORK.SE port map
(
x=>x(4),
y=>y(4),
tin=>z(4),
tout=>transport_nivel1(4),
s=>sume_nivel1(4)
);

se5:entity WORK.SE port map
(
x=>x(5),
y=>y(5),
tin=>z(5),
tout=>transport_nivel1(5),
s=>sume_nivel1(5)
);

se6:entity WORK.SE port map
(
x=>x(6),
y=>y(6),
tin=>z(6),
tout=>transport_nivel1(6),
s=>sume_nivel1(6)
);

se7:entity WORK.SE port map
(
x=>x(7),
y=>y(7),
tin=>z(7),
tout=>transport_nivel1(7),
s=>sume_nivel1(7)
);




--nivel 2
se8:entity WORK.SE port map
(
x=>w(0),
y=>sume_nivel1(0),
tin=>'0',
tout=>transport_nivel2(0),
s=>sume_nivel2(0)
);

se9:entity WORK.SE port map
(
x=>w(1),
y=>sume_nivel1(1),
tin=>transport_nivel1(0),
tout=>transport_nivel2(1),
s=>sume_nivel2(1)
);

se10:entity WORK.SE port map
(
x=>w(2),
y=>sume_nivel1(2),
tin=>transport_nivel1(1),
tout=>transport_nivel2(2),
s=>sume_nivel2(2)
);

se11:entity WORK.SE port map
(
x=>w(3),
y=>sume_nivel1(3),
tin=>transport_nivel1(2),
tout=>transport_nivel2(3),
s=>sume_nivel2(3)
);

se12:entity WORK.SE port map
(
x=>w(4),
y=>sume_nivel1(4),
tin=>transport_nivel1(3),
tout=>transport_nivel2(4),
s=>sume_nivel2(4)
);

se13:entity WORK.SE port map
(
x=>w(5),
y=>sume_nivel1(5),
tin=>transport_nivel1(4),
tout=>transport_nivel2(5),
s=>sume_nivel2(5)
);

se14:entity WORK.SE port map
(
x=>w(6),
y=>sume_nivel1(6),
tin=>transport_nivel1(5),
tout=>transport_nivel2(6),
s=>sume_nivel2(6)
);

se15:entity WORK.SE port map
(
x=>w(7),
y=>sume_nivel1(7),
tin=>transport_nivel1(6),
tout=>transport_nivel2(7),
s=>sume_nivel2(7)
);

se16:entity WORK.SE port map
(
x=>'0',
y=>'0',
tin=>transport_nivel1(7),
tout=>transport_nivel2(8),
s=>sume_nivel2(8)
);


--sumator cu anticiparea transportului
sat4:entity WORK.SAT4_8 port map
(
x=>sume_nivel2(8 downto 1),
y=>transport_nivel2(7 downto 0),
tin=>'0',
tout=>transport_inutil,
s=>s(8 downto 1)
);

s(0)<=sume_nivel2(0);

end Behavioral;
