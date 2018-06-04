library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.MATH_REAL.ALL;

entity dtmfdetector is


port ( 
		clk: in std_logic;
		enable: in std_logic;
		reset: in std_logic;
		sample: in integer;
		output: out std_logic_vector(3 downto 0);	
		done: out std_logic
	 );


end dtmfdetector;


architecture Behavioral of dtmfdetector is

constant sample_rate: integer := 8000;
constant max_bins: integer := 8;
constant N: integer := 92;


type real_array is array (max_bins-1 downto 0) of real;

constant coeffs: real_array := ( 1.707738, 1.645281, 1.568687, 1.478205,
			 1.164104, 0.99637, 0.798618, 0.568533);

begin
    

    
   

	-- have coefficients now run through Goertzel
	process(clk, reset)
	variable sample_count: integer := 0;
   variable q0: real := 0.0;
   variable q1: real_array := (others => 0.0);
   variable q2: real_array := (others => 0.0);
   variable r: real_array := (others => 0.0);
   variable row, col: integer := 0;
   variable maxval: real := 0.0;
   variable tinput: std_logic_vector(7 downto 0) := (others => '0');
   --variable output: std_logic_vector( 3 downto 0) := (others => '0');
   --variable done: std_logic := '0';  
	begin
	  
	  -- reset is active low  
	  if reset = '1' and enable = '1' then 
		if clk'event and clk = '1' then
		    
		   done <= '0';
			sample_count := sample_count + 1;

			for i in 0 to max_bins-1 loop
			
				q0 := coeffs(i) * q1(i) - q2(i) + real(sample);

				q2(i) := q1(i);
				q1(i) := q0;	


			end loop;

				if sample_count = N then
					for i in 0 to max_bins-1 loop				
						r(i) := (q1(i) * q1(i)) + (q2(i) * q2(i)) - (coeffs(i) * q1(i) * q2(i));
						q1(i) := 0.0;
						q2(i) := 0.0;
					end loop;
					
					
					
					-- do testing
					-- find strongest frequency in row
					row := 0;
					maxval := 0.0;
					for i in 0 to 3 loop
						if r(i) > maxval then
							maxval := r(i);
							row := i;
						end if;
					end loop;


					-- find strongest frequency in column
					col := 4;
					maxval := 0.0;
					for i in 4 to 7 loop
						if r(i) > maxval then
							maxval := r(i);
							col := i;
						end if;
					end loop;

					sample_count := 0;
					
					col := col - 4;
				

					tinput( 7 downto 4) := conv_std_logic_vector(row, 4);
					tinput( 3 downto 0) := conv_std_logic_vector(col, 4);

					case tinput is

						when "00110011" => output <= X"1";
						when "00100011" => output <= X"2";
						when "00010011" => output <= X"3";
						when "00000011" => output <= X"A";
						when "00110010" => output <= X"4";
						when "00100010" => output <= X"5";
						when "00010010" => output <= X"6";
						when "00000010" => output <= X"B";
						when "00110001" => output <= X"7";
						when "00100001" => output <= X"8";
						when "00010001" => output <= X"9";
						when "00000001" => output <= X"C";
						when "00110000" => output <= X"E";
						when "00100000" => output <= X"0";
						when "00010000" => output <= X"F";
						when "00000000" => output <= X"D";
						   	
						    
						when others => null;

					end case;
					
					done <= '1';
				end if;
			end if;
			
		elsif reset = '0' then
		   -- reset is asserted so we will reset all the signals
		    sample_count := 0;
          q0 := 0.0;
          q1 := (others => 0.0);
          q2 := (others => 0.0);
          r := (others => 0.0);
          row := 0;
          col := 0;
          maxval := 0.0;
          tinput := (others => '0');
          output <= (others => '0'); 
          done <= '0';
          
  end if;  

end process;



end Behavioral;