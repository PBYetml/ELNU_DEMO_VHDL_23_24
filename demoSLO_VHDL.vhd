-- DEMO SLO  
-- commentaire 

-- librairie 
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

-- entité 
entity DEMOSLO24_VHDL is 
	port(
		-- input 
		entreeA : in std_logic; 
		entreeB : in std_logic; 
		-- output 
		sortie : out std_logic; 
		sortie1 :out std_logic; 
		sortie2 :out std_logic;  
		sortie3 :out std_logic 
	); 
end DEMOSLO24_VHDL; 

-- architecture 
architecture COMPORTEMENT_DEMO of DEMOSLO24_VHDL is
	
	-- variable 
	signal busEntree : std_logic_vector(1 downto 0);  --> lecture MSB à LSB 
	--signal busEntree : std_logic_vector(0 to 1);  --> lecture LSB à MSB
	
	begin 
	
	-- attribution des entrée au bus interne 
	busEntree <= (entreeA, entreeB); 	-- bus interne  
	
	-- exemple de programmation purement concurrente 
	-- équation logique 
	sortie <= (not(entreeA) and entreeB) or (entreeA and entreeB);
	
	-- with select 
	with busEntree select
		sortie1 <= '1' when "01", 
				   '1' when "11",
				   '0' when others;
				   
	CASE1 : process (busEntree)
		begin 
			case busEntree is 
				when "00" => sortie2 <= '0'; 
				when "10" => sortie2 <= '0'; 
				when others => sortie2 <= '1';
			end case;  
	end process; 
	
	
	IF2 : process (busEntree) 
		begin 
			if(busEntree = "00") then  
				sortie3 <= '0' ; 
			elsif (busEntree = "11") then 
				sortie3 <= '1' ; 
			else
				sortie3 <= 'Z' ; 
			end if; 
	end process; 
	
--	----------------------------------
--	-- compteur tic horloge systeme -- 
--	----------------------------------	
--	CMPT_ETAT_PRESENT : process(CLK_1_8MHZ)
--		begin 
--			-- MAJ de tous les compteur -- 
--			-- détection d'un flanc montant 
--			if ((CLK_1_8MHZ'event) and (CLK_1_8MHZ = '1')) then 
--			-- flanc descendant
--			--if ((CLK_1_8MHZ'event) and (CLK_1_8MHZ = '0')) then 
--				cpt_p_1HZ <= cpt_f_1HZ;
--				cpt_p_2HZ <= cpt_f_2HZ;
--				cpt_p_500HZ <= cpt_f_500HZ;
--				cpt_p_1kHZ <= cpt_f_1kHZ;
--			end if; 
--			
--			-- détection d'un flanc montant
--			--if rising_edge(CLK_1_8MHZ) then 
--			-- flanc descendant 
--			--if falling_edge(CLK_1_8MHZ) then 
--			
--			--end if; 
--				
--	end process; 
--	
--	CMPT_ETAT_FUTUR_1HZ : process(cpt_p_1HZ)
--		begin 
--			if (cpt_p_1HZ >= VAL_MAX_COMPTEUR_1HZ) then
--				cpt_f_1HZ <= (others => '0');				-- remise à 0 
--			else 
--				cpt_f_1HZ <= cpt_p_1HZ + 1;  				-- incrémentation 
--			end if; 
--	end process; 
--	

end COMPORTEMENT_DEMO; 







