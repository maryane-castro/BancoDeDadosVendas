CREATE OR REPLACE FUNCTION public.funcAtualizarEstoque() 
RETURNS TRIGGER AS 
$$
BEGIN
  SELECT preco_unitario INTO NEW.valor_unitario 
  FROM produtos 
  WHERE id_produto = NEW.id_produto;

  RAISE NOTICE ' NEW.valor_unitario = %', NEW.valor_unitario;
    
  NEW.valor_total = NEW.quantidade * NEW.valor_unitario;
  
  UPDATE produtos SET estoque = estoque - NEW.quantidade
  WHERE id_produto = NEW.id_produto;
  
  RETURN NEW;
END;
$$
  LANGUAGE plpgsql VOLATILE 
  COST 100;
  
DROP TRIGGER "trgAtualizarEstoque" ON vendas;

CREATE TRIGGER "trgAtualizarEstoque"
	BEFORE INSERT ON public.vendas
	FOR EACH ROW EXECUTE PROCEDURE public.funcAtualizarEstoque(); 