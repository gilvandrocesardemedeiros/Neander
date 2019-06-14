library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY PC is
	PORT(
		clk : in std_logic; --pulso de clock (definido pela FPGA)
		reset : in std_logic; --força valor armazenado em PC ir para 0
		incrementa : in std_logic; --incrementa endereço de memória armazenado em "reg"
		carga : in std_logic; --faz "reg" receber o valor da entrada
		entrada : in std_logic_vector(7 downto 0); --endereço de memória a ser carregado 
		pc : out std_logic_vector(7 downto 0) --próximo endereço de memória
	);
end PC;

architecture Behavioral of PC is
	signal reg: std_logic_vector(7 downto 0) := "00000000"; --Registrador interno que guarda o endereço de memória
	begin
	pc <= reg;
	process(clk,reset)
		begin
			if reset = '1' then
				reg <= "00000000";
			elsif (clk'event and clk = '1') then
				if(carga = '1') then
					reg <= entrada;
				elsif (incrementa = '1') then
					reg <= reg + 1;
				end if;
			end if;
	end process;
end Behavioral;