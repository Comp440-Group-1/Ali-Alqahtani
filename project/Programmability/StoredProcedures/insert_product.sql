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
-- Description:	insert date into product table
-- =============================================
CREATE PROCEDURE insert_product 
	-- Add the parameters for the stored procedure here
	@product_id tinyint,
	@product_name varchar(50),
	@describtion varchar(150),
	@platform_id tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT INTO product VALUES (@product_id, @product_name, @describtion, @platform_id)
	END TRY
	BEGIN CATCH
		RAISERROR('Error inserting date into product table',1,1)
	END CATCH

END
GO
