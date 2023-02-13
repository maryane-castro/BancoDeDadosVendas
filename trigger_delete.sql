CREATE OR REPLACE FUNCTION public.funcAtualizarEstoqueDelete() 
RETURNS TRIGGER AS 
$$
BEGIN
  UPDATE produtos SET estoque = estoque + OLD.quantidade
  WHERE id_produto = OLD.id_produto;
  
  RETURN OLD;
END;
$$
  LANGUAGE plpgsql VOLATILE 
  COST 100;
  
DROP TRIGGER "trgAtualizarEstoqueDelete" ON vendas;

CREATE TRIGGER "trgAtualizarEstoqueDelete"
	BEFORE DELETE ON public.vendas
	FOR EACH ROW EXECUTE PROCEDURE public.funcAtualizarEstoqueDelete(); 
