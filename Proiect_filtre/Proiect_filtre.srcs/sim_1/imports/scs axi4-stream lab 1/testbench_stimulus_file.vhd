library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench_stimulus_file is
end testbench_stimulus_file;

architecture Tb of testbench_stimulus_file is

COMPONENT fifo64x64
  PORT (
    s_axis_aresetn : IN STD_LOGIC;
    s_axis_aclk : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_tready : IN STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    axis_wr_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    axis_rd_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

constant T : time := 20 ns;

signal aclk, aresetn : STD_LOGIC := '0';
signal t1_tdata: STD_LOGIC_VECTOR (63 downto 0) := (others => '0');
signal t1_tready : STD_LOGIC := '0';
signal t1_tvalid : STD_LOGIC := '0';

signal rd_count, wr_count : integer := 0;
signal end_of_reading : std_logic := '0';



signal temp1_tdata  : STD_LOGIC_VECTOR (63 downto 0);
signal temp1_tready: STD_LOGIC;
signal temp1_tvalid : STD_LOGIC;

signal temp1_wr_data_count : STD_LOGIC_VECTOR (31 downto 0);
signal temp1_rd_data_count : STD_LOGIC_VECTOR (31 downto 0);

--aici e memoria

type memorie is array(0 to 63) of std_logic_vector(63 downto 0);
signal memorie_64_64:memorie:=(others=>(others=>'0'));

signal sw:std_logic_vector(3 downto 0):=(others=>'0'); --sw0=0 scriu in memorie, sw0=1 citesc din memorie
                                                        --sw1=selectia la filtrul 1, s1=0 e 255-curr, s1=1 e brig+curr
                                                        --sw23=00 filtru 1, sw23==01 filtru2, sw23==10 filtru3

signal counter_citire:integer:=0;
signal counter_scriere:integer:=0;

signal currentpixelValue:std_logic_vector(7 downto 0);
signal brightness:std_logic_vector(7 downto 0);
signal R:std_logic_vector(7 downto 0);
signal G:std_logic_vector(7 downto 0);
signal B:std_logic_vector(7 downto 0);
signal A:std_logic_vector(7 downto 0);
signal pixel1:std_logic_vector(7 downto 0);
signal pixel2:std_logic_vector(7 downto 0);

--
--signal date:std_logic_vector(31 downto 0);
signal counter_adrese:std_logic_vector(3 downto 0):=(others=>'0');

signal WD:std_logic_vector(63 downto 0);
signal RD:std_logic_vector(63 downto 0);

--rezultate
signal newPixelValue1:std_logic_vector(7 downto 0);
signal grayscalePixel:std_logic_vector(7 downto 0);
signal newPixelValue2:std_logic_vector(7 downto 0);

signal val_mux:std_logic_vector(7 downto 0); -- aici stocam valoarea finala de pe filtru
signal apasare_buton:std_logic:='0'; -- asta e buton pentru a incrementa adresa de citire
begin


--cat timp citim, incrementam counterul
process(aclk)
begin
if aclk='1' and aclk'event then
    if end_of_reading='1' then
        if apasare_buton='1' then
            counter_citire<=counter_citire+1;
        end if;
    end if;
end if;
end process;

apasare_buton<='0' after 0ns, '1' after 500ns; 

--daca datele sunt valide, le scriem in memorie sau le citim din memorie in functie de sw
process(aclk)
begin
if aclk='1' and aclk'event then
    if temp1_tvalid='1' then
        if sw(0)='0' then
            memorie_64_64(counter_scriere)<=temp1_tdata;
        else
            RD<=memorie_64_64(counter_citire);
        end if;
    counter_scriere<=counter_scriere+1;
    end if;
end if;
end process;

--cand terminam citirea din memorie, sw0 trece la 0
process(aclk)
begin
if aclk='1' and aclk'event then
    if end_of_reading='1' then
        sw(0)<='1';
    else
        sw(0)<='0';
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


    aclk <= not aclk after T / 2;
    aresetn <= '0', '1' after 5 * T; -- reset the FIFO buffers at first
    
    fifo_in_t1 : fifo64x64 port map (
        s_axis_aresetn => aresetn,
        s_axis_aclk => aclk,
        s_axis_tvalid => t1_tvalid,
        s_axis_tready => t1_tready,
        s_axis_tdata => t1_tdata,
        m_axis_tvalid => temp1_tvalid,
        m_axis_tready => temp1_tready,
        m_axis_tdata => temp1_tdata,
        axis_wr_data_count => temp1_wr_data_count,
        axis_rd_data_count => temp1_rd_data_count
    );


    -- read values from the input file
    process (aclk)
        file sensors_data : text open read_mode is "filtre.csv";
        variable in_line : line;
        
        variable timestamp : string(1 to 16);
        variable temperature1 : std_logic_vector(63 downto 0);
        variable space : character;
        variable comma : character;
    begin
        if rising_edge(aclk) then
            if aresetn = '1' and end_of_reading = '0' then
            
                if not endfile(sensors_data) then     
                    
                    if t1_tready = '1'  then     -- read from the file only when the module is ready to accept data
                        readline(sensors_data, in_line);
                        read(in_line, timestamp);
                        
                        t1_tvalid <= '1';
                        
                        read(in_line, comma);
                        read(in_line, temperature1);
                        t1_tdata <= temperature1;
                        
                        rd_count <= rd_count + 1;
                        
                        report "Values measured at time t = " & timestamp & " successfully read";
                    else
                        t1_tvalid <= '0';
                    end if;
                        
                else
                    file_close(sensors_data);
                    end_of_reading <= '1';
                end if;
            end if;
        end if;
    end process;
    
    -- write results in the output file
--    process 
--        file results : text open write_mode is "Proiect_filtre\Proiect_filtre\filtr_result.csv"; -- TO DO: provide the absolute path of the project directory followed by "temperature_results.csv"
--        variable out_line : line;
--    begin
--        wait until rising_edge(aclk);
            
--        if aresetn = '0' then
--            wait until rising_edge(aresetn);
--        end if;
    
--        if wr_count <= rd_count then
--            if tout_tvalid = '1' then   -- write the result only when it is valid
--                write(out_line, wr_count);
--                write(out_line, string'(", "));
--                write(out_line, tout_tdata);
--                writeline(results, out_line);
                
--                wr_count <= wr_count + 1;
--            end if;
--        else
--            file_close(results);
--            report "execution finished...";
--            wait;
--        end if;
--    end process;

end Tb;
