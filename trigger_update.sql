CREATE OR REPLACE FUNCTION public.funcAtualizarEstoqueUpdate() 
RETURNS TRIGGER AS 
$$
BEGIN
  NEW.valor_total = NEW.quantidade * NEW.valor_unitario; 
  
  UPDATE produtos SET estoque = estoque + OLD.quantidade - NEW.quantidade
  WHERE id_produto = NEW.id_produto;
  
  RETURN NEW;
END;
$$
  LANGUAGE plpgsql VOLATILE 
  COST 100;
  
DROP TRIGGER "trgAtualizarEstoqueUpdate" ON vendas;

CREATE TRIGGER "trgAtualizarEstoqueUpdate"
	BEFORE UPDATE ON public.vendas
	FOR EACH ROW EXECUTE PROCEDURE public.funcAtualizarEstoqueUpdate(); 