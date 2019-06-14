library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Este bloco de código serve para REM, RDM, AC e RI, sendo que:
--Em REM será registrado o endereço de memória
--Em RDM será registrado o dado que vem da memória ou o dado que será armazenado na memória
--Em RI será armazenada a instrução que está sendo executada
--Em AC será armazenado o resultado da operação efetuada pela ULA

entity Reg8bits is
	Port(
		clk: in std_logic;
		reset: in std_logic;
		carga: in std_logic;
		entrada: in std_logic_vector (7 downto 0);
		saida: out std_logic_vector (7 downto 0)
		);
end Reg8bits;

architecture Behavioral of Reg8bits is
	signal reg: std_logic_vector(7 downto 0) := "00000000";
begin
	saida <= reg;
	Process(clk ,reset)
	begin
		if reset = '1' then
			reg <= "00000000";
		elsif clk'event and clk = '1' then
			if carga = '1' then
				reg <= entrada;
			end if ;
		end if;
	end process;
end Behavioral;