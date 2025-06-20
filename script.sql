USE [veronica]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19/06/2025 10:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Users__3214EC07DC5C25F8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (1, N'econdo', N'1234')
INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (2, N'btorres', N'1234')
INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (4, N'admin', N'1234')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  StoredProcedure [dbo].[sp_ObtenerEvaluadorPorDNI]    Script Date: 19/06/2025 10:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerEvaluadorPorDNI]
    @Dni VARCHAR(8)
AS
BEGIN
   SELECT Dni,Nombres,Apellidos,(Nombres+' '+ Apellidos)NombresyApellidos , Cargo, Area, Grado
    FROM Evaluador
    WHERE Dni = @Dni

	
	SELECT ''PR,edos.DNI_Evaluado,''CO,/*edos.Nombres_Evaluado,edos.Apellido_Evaluado,*/
	(edos.Nombres_Evaluado+' '+edos.Apellido_Evaluado)NombresyApellidos,edos.Cargo_Estructural,edos.Area/*,
	edos.Grado*/
    FROM Evaluados edos
    LEFT JOIN Evaluador edor 
		ON edor.Dni = edos.dni_jefe
		WHERE edos.dni_jefe = @Dni;


END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarUsuario]    Script Date: 19/06/2025 10:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarUsuario]
    @Username VARCHAR(50),
    @Password VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*) AS Existe
    FROM Users
    WHERE Username = @Username AND Password = @Password;
END;
GO
