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
-- Description: update vesion
-- =============================================
CREATE PROCEDURE update_version 
	-- Add the parameters for the stored procedure here
	@product_id tinyint,
	@version_id tinyint,
	@new_version_num tinyint

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		UPDATE version SET version_num = @new_version_num
		WHERE product_id = @product_id AND version_id = @version_id;
	END TRY
	BEGIN CATCH
		RAISERROR('Error updating the product version',1,1);
	END CATCH
END
GO
