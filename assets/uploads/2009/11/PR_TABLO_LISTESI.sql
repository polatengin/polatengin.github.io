CREATE PROCEDURE PR_TABLO_LISTESI
AS
DECLARE @T TABLE (TABLO_ADI VARCHAR(100), SATIR_SAYISI INT)

INSERT INTO @T
EXEC sp_msForEachTable 'SELECT ''?'', COUNT(*) FROM ? WITH (NOLOCK)'

SELECT * FROM @T ORDER BY SATIR_SAYISI DESC