library ieee;
use ieee.std_logic_1164.all;
entity home is
port(pass: in std_logic_vector(3 downto 0); motion,flame,sw: in std_logic;
pump,light,sound:out std_logic; fan,light2,lightf: out std_logic; segment: out std_logic_vector(6 downto 0));
end home;

architecture a of home is
begin
process(pass,sw,motion) is
begin
if(sw='0') then --1101110 
if(pass="1001") and (motion='0') and (flame='0') then light<='1'; fan<='0'; segment<="0010010"; light2<='1';
else light2<='0' ;light<='0'; fan<='1'; segment<="0101011"; end if;
else
if (flame='0') and (pass="1001") then light<='1'; fan<='0'; segment<="1001111"; else light<='0';
 fan<='1';segment<="0101011"; end if;
end if;
end process;

process(flame) is
begin
if flame='1' then lightf<='1'; pump<='1';sound<='1';else lightf<='0'; pump<='0';sound<='0';  end if;
end process;

end a;