CREATE FUNCTION SAPNU_PUAS.top5recaudacion (@fechaInicio datetime, @fechaFin datetime)
RETURNS TABLE
AS
RETURN
	SELECT TOP 5 Chofer_Telefono, SUM(Rendicion_Importe) 
	FROM SAPNU_PUAS.Chofer JOIN SAPNU_PUAS.Rendicion ON Rendicion_Chofer=Chofer_Telefono
	WHERE Rendicion_Fecha BETWEEN @fechaInicio AND @fechaFin
	GROUP BY Chofer_Telefono
	ORDER BY SUM (Rendicion_Importe) DESC;