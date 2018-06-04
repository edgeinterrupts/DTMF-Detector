LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;
USE ieee.numeric_std.ALL;
use std.textio.all;

ENTITY TB_vhd IS

END TB_vhd;

ARCHITECTURE behavior OF TB_vhd IS 

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT dtmfdetector
PORT(
	clk: in std_logic;
	enable: in std_logic;
	reset: in std_logic;
	sample: in integer;
	output: out std_logic_vector(3 downto 0);	
	done: out std_logic
	);
END COMPONENT;

--Inputs
SIGNAL clk :  std_logic := '0';
signal enable: std_logic := '0';
signal reset: std_logic := '0';
SIGNAL sample :  integer := 0;

--Outputs
SIGNAL output :  std_logic_vector(3 downto 0);
SIGNAL done :  std_logic;

file sample_0 : text open read_mode is "1.txt";
file sample_1 : text open read_mode is "5.txt";
file sample_2 : text open read_mode is "9.txt";
file sample_3 : text open read_mode is "d.txt";
file sample_4 : text open read_mode is "4.txt";
file sample_5 : text open read_mode is "8.txt";
file sample_6 : text open read_mode is "f.txt";
file sample_7 : text open read_mode is "7.txt";
file sample_8 : text open read_mode is "0.txt";
file sample_9 : text open read_mode is "e.txt";
file sample_a : text open read_mode is "a.txt";
file sample_b : text open read_mode is "3.txt";
file sample_c : text open read_mode is "b.txt";
file sample_d : text open read_mode is "2.txt";
file sample_e : text open read_mode is "6.txt";
file sample_f : text open read_mode is "c.txt";


-- clock period
signal period: time := 20 ns;



BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: dtmfdetector PORT MAP(
	clk => clk,
	enable => enable,
	reset => reset,
	sample => sample,
	output => output,
	done => done
);
	
	

tb : PROCESS
variable ll : line;
variable sample_in: integer;
BEGIN
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_0) loop  
		   readline(sample_0,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_1) loop  
		   readline(sample_1,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_2) loop  
		   readline(sample_2,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_3) loop  
		   readline(sample_3,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_4) loop  
		   readline(sample_4,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;



    reset <= '1';
    enable <= '1';
    while not endfile(sample_5) loop  
		   readline(sample_5,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_6) loop  
		   readline(sample_6,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_7) loop  
		   readline(sample_7,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_8) loop  
		   readline(sample_8,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_9) loop  
		   readline(sample_9,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_a) loop  
		   readline(sample_a,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;



    reset <= '1';
    enable <= '1';
    while not endfile(sample_b) loop  
		   readline(sample_b,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_c) loop  
		   readline(sample_c,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_d) loop  
		   readline(sample_d,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_e) loop  
		   readline(sample_e,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;
    
    
    
    reset <= '1';
    enable <= '1';
    while not endfile(sample_f) loop  
		   readline(sample_f,ll);
			read(ll,sample_in);
			sample <= sample_in;	
			if done = '1' then
			    exit;
			end if;
		   wait for period;	   
    end loop;  
    enable <= '0';
    wait for 2 us;
    reset <= '0';
    wait for period;          
    

		wait; -- will wait forever
	END PROCESS;



-- clock generator
process
begin
		clk <= not clk;
		wait for period/2;
end process;


END behavior;
