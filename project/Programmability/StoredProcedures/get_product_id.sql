-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ali Alqahtani
-- Create date: 5/1/2016
-- Description:	retrieve product ID
-- =============================================
CREATE PROCEDURE get_product_id 
	@product_name varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT product_id FROM product where @product_name = product_name
	END TRY
   
    BEGIN CATCH
		RAISERROR('Error retrieving prodct ID',1,1);
	END CATCH
END
GO
