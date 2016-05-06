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
-- Description:	insert new customer into customer table
-- =============================================
CREATE PROCEDURE insert_customer 
	@customer_id int,
	@first_name varchar(20),
	@last_name varchar(20),
	@company_id int
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	
	SET NOCOUNT ON;
    BEGIN TRY

		INSERT INTO customer 
		VALUES (@customer_id, @first_name, @last_name, @company_id)
	END TRY
	BEGIN CATCH
		RAISERROR('Error inserting a new customer',1,1)
	END CATCH
END
GO
