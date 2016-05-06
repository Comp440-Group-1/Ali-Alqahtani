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
-- Description:	retrieve customer email using customer ID
-- =============================================
CREATE PROCEDURE get_email 
	-- Add the parameters for the stored procedure here
	@customer_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY

		SELECT email FROM subscription WHERE customer_id = @customer_id
	END TRY
	BEGIN CATCH
		RAISERROR('there was a problem retrieving customer email',1,1);
	END CATCH
END
GO
