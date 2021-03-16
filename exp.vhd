library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity clockdivider is
    Port(
        clk: in std_logic;
        reset: in std_logic;
        button: in std_logic;
        --clk_out, clk_out_1: out std_logic;
        --count_out, count_out_1: out std_logic_vector(0 to 2)
        LED1: out std_logic:= '0';
        LED2: out std_logic:= '0';
        LED3: out std_logic:= '0';
        LED4: out std_logic:= '0';
        LED5: out std_logic:= '0';
        LED6: out std_logic:= '0';
        LED7: out std_logic:= '0';
        LED8: out std_logic:= '0';
        LED9: out std_logic:= '0';
        LED10: out std_logic:= '0';
        LED11: out std_logic:= '0';
        LED12: out std_logic:= '0';
        LED13: out std_logic:= '0';
        LED14: out std_logic:= '0'
        );
end clockdivider;

architecture Behavioral of clockdivider is
    signal count: std_logic_vector(0 to 2);
    signal counter: integer:=1;
    signal tmp : std_logic := '0';
    
    signal count_1: std_logic_vector(0 to 2);
    signal counter_1: integer:=1;
    signal tmp_1 : std_logic := '0';
  
    signal stop_c: std_logic := '0';
    signal stop_c_1: std_logic:= '0';
begin
  
process(clk,reset)
begin
    if(reset='1') then
        counter <=1;
        tmp <= '0';
    elsif(clk'event and clk='1') then
        counter <=counter + 1;
    if (counter >= 2127660) then
        tmp <= NOT tmp;
        counter <= 1;
    end if;
    end if;

end process;

process(clk,reset)
begin
    if(reset='1') then
        counter_1 <=1;
        tmp_1<='0';
    elsif(clk'event and clk='1') then
        counter_1 <=counter_1 + 1;
    if (counter_1 >= 2857142) then
        tmp_1 <= NOT tmp_1;
        counter_1 <= 1;
    end if;
end if;
end process;

--clk_out <= tmp;
--clk_out_1 <= tmp_1;
    
    process(tmp, reset)
    begin
        if reset = '1' then 
            count <= "001";
        elsif (rising_edge(tmp)) then
            if button = '1' then
                    stop_c <= '1';
                    count <= count;
            end if;
            if (button = '0' and stop_c ='1') then
                stop_c <= '0';
                count <= count;
            end if;
            if (button = '1' and stop_c = '0') then
                count <= count + 1;
                if (count = "110") then 
                    count <= "001";
                end if;
            end if; 
        end if;
    end process;
    
 process(tmp_1, reset)
 begin
 if reset = '1' then 
            count_1 <= "001";
        elsif  rising_edge(tmp_1) then
            if button = '1' then
                    stop_c_1 <= '1';
                    count_1 <= count_1;
            end if;
            if (button = '0' and stop_c_1 ='1') then
                stop_c_1 <= '0';
                count_1 <= count_1;
            end if;
            if (button = '1' and stop_c_1 = '0') then
                count_1 <= count_1 + "010";
                if (count_1 = "101") then --2
                    count_1 <= "010";
                end if;
                if (count_1 = "110") then
                    count_1 <= "001";
                end if;
            end if;
        end if;
  end process;
    
  --  count_out <= count;
    --count_out_1 <= count_1;
  
  
  display:process(count)
begin
      case count is
        when "001" =>   
            LED1 <= '0';   
            LED2 <= '0';
            LED3 <= '0';
            LED4 <= '1';
            LED5 <= '0';
            LED6 <= '0';
            LED7 <= '0';
        when "010" =>   
            LED1 <= '1';   
            LED2 <= '0';
            LED3 <= '0';
            LED4 <= '0';
            LED5 <= '0';
            LED6 <= '0';
            LED7 <= '1';
        when "011" =>   
            LED1 <= '1';   
            LED2 <= '0';
            LED3 <= '0';
            LED4 <= '1';
            LED5 <= '0';
            LED6 <= '0';
            LED7 <= '1';
        when "100" =>
            LED1 <= '1';   
            LED2 <= '0';
            LED3 <= '1';
            LED4 <= '0';
            LED5 <= '1';
            LED6 <= '0';
            LED7 <= '1';
        when "101" =>
            LED1 <= '1';   
            LED2 <= '0';
            LED3 <= '1';
            LED4 <= '1';
            LED5 <= '1';
            LED6 <= '0';
            LED7 <= '1';  
        when "110" =>   
            LED1 <= '1';   
            LED2 <= '1';
            LED3 <= '1';
            LED4 <= '0';
            LED5 <= '1';
            LED6 <= '1';
            LED7 <= '1';
        when others => 
            LED1 <= '0';   
            LED2 <= '0';
            LED3 <= '0';
            LED4 <= '0';
            LED5 <= '0';
            LED6 <= '0';
            LED7 <= '0';
    end case;
 end process;
    
process(count_1)
begin
    case count_1 is
        when "001" =>   
            LED8 <= '0';   
            LED9 <= '0';
            LED10 <= '0';
            LED11 <= '1';
            LED12 <= '0';
            LED13 <= '0';
            LED14 <= '0';
        when "010" =>   
            LED8 <= '1';   
            LED9 <= '0';
            LED10 <= '0';
            LED11 <= '0';
            LED12 <= '0';
            LED13 <= '0';
            LED14 <= '1';
        when "011" =>   
            LED8 <= '1';   
            LED9 <= '0';
            LED10 <= '0';
            LED11 <= '1';
            LED12 <= '0';
            LED13 <= '0';
            LED14 <= '1';
        when "100" =>
            LED8 <= '1';   
            LED9 <= '0';
            LED10 <= '1';
            LED11 <= '0';
            LED12 <= '1';
            LED13 <= '0';
            LED14 <= '1';
        when "101" =>
            LED8 <= '1'; 
            LED9 <= '0';  
            LED10 <= '1';
            LED11 <= '1';
            LED12 <= '1';
            LED13 <= '0';
            LED14 <= '1';   
        when "110" =>   
            LED8 <= '1';   
            LED9 <= '1';
            LED10 <= '1';
            LED11 <= '0';
            LED12 <= '1';
            LED13 <= '1';
            LED14 <= '1';
        when others => 
            LED8 <= '0';   
            LED9 <= '0';
            LED10 <= '0';
            LED11 <= '0';
            LED12 <= '0';
            LED13 <= '0';
            LED14 <= '0'; 
    end case;
 end process; 
end Behavioral;