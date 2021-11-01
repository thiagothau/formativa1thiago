USE [formativa2]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 31/10/2021 22:16:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[idPedido] [int] NOT NULL,
	[dataEnvio] [date] NOT NULL,
	[fk_idOrcamento] [int] NOT NULL,
	[foma_pagamento] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orcamento]    Script Date: 31/10/2021 22:16:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orcamento](
	[idOrcamento] [int] NOT NULL,
	[fk_idCleinte] [int] NOT NULL,
	[data] [date] NULL,
 CONSTRAINT [PK_Orcamento] PRIMARY KEY CLUSTERED 
(
	[idOrcamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 31/10/2021 22:16:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[telefone] [varchar](11) NOT NULL,
	[cpf] [varchar](11) NULL,
	[fk_idEndereco] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 31/10/2021 22:16:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[idEndereco] [int] NOT NULL,
	[rua] [varchar](50) NOT NULL,
	[bairro] [varchar](15) NOT NULL,
	[cidade] [varchar](20) NOT NULL,
	[numero] [varchar](4) NULL,
 CONSTRAINT [PK_Endereco] PRIMARY KEY CLUSTERED 
(
	[idEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_CONSULTA_PEDIDOS_PENDENTES]    Script Date: 31/10/2021 22:16:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_CONSULTA_PEDIDOS_PENDENTES] AS
 (
    SELECT
        ped.idPedido AS 'Código do Pedido',
        cli.nome AS 'Nome do Cliente',
        orca.idOrcamento AS 'Código Orçamento',
        ped.dataEnvio AS 'Data Agendada para entrega',
        ende.rua AS 'Rua',
        ende.bairro AS 'Bairro',
        ende.numero AS 'N°'
                
    FROM

    Pedido AS ped 
        INNER JOIN
            Orcamento AS orca
                ON
                orca.idOrcamento = ped.fk_idOrcamento
        INNER JOIN
            Cliente AS cli 
                ON
            cli.idCliente = orca.fk_idCleinte
        INNER JOIN
            Endereco AS ende 
                ON ende.idEndereco = cli.fk_idEndereco


    WHERE
        ped.status = 0
 )
GO
/****** Object:  Table [dbo].[prodOrcamento]    Script Date: 31/10/2021 22:16:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prodOrcamento](
	[fk_idOrcamento] [int] NOT NULL,
	[fk_idProduto] [int] NOT NULL,
	[quantidade] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produto]    Script Date: 31/10/2021 22:16:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produto](
	[idProduto] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[descricao] [varchar](180) NULL,
	[fornecedor] [varchar](40) NOT NULL,
	[precoAvista] [float] NOT NULL,
	[precoPrazo] [float] NOT NULL,
 CONSTRAINT [PK_produto] PRIMARY KEY CLUSTERED 
(
	[idProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([idCliente], [nome], [telefone], [cpf], [fk_idEndereco]) VALUES (1, N'Thiago Santana Oliveira', N'71991298816', N'77777777777', 1)
GO
INSERT [dbo].[Cliente] ([idCliente], [nome], [telefone], [cpf], [fk_idEndereco]) VALUES (2, N'Rafael Carlos Emanuel Barros', N'71988630308', N'89379792506', 4)
GO
INSERT [dbo].[Cliente] ([idCliente], [nome], [telefone], [cpf], [fk_idEndereco]) VALUES (3, N'Fernando Carlos Diego', N'71991323733', N'38637509509', 3)
GO
INSERT [dbo].[Cliente] ([idCliente], [nome], [telefone], [cpf], [fk_idEndereco]) VALUES (4, N'André Benedito Ramos', N'77988962443', N'09187281503', 9)
GO
INSERT [dbo].[Cliente] ([idCliente], [nome], [telefone], [cpf], [fk_idEndereco]) VALUES (5, N'Rafael Daniel Mendes', N'71998093670', N'94303935530', 5)
GO
INSERT [dbo].[Cliente] ([idCliente], [nome], [telefone], [cpf], [fk_idEndereco]) VALUES (6, N'Paulo Kevin Assunção', N'73992852127', N'61770032576', 6)
GO
INSERT [dbo].[Cliente] ([idCliente], [nome], [telefone], [cpf], [fk_idEndereco]) VALUES (7, N'Tatiane Carolina Melissa', N'73992852127', N'45662972', 7)
GO
INSERT [dbo].[Cliente] ([idCliente], [nome], [telefone], [cpf], [fk_idEndereco]) VALUES (8, N'Kamilly Isabella', N'7125174342', N'92368304550', 2)
GO
INSERT [dbo].[Cliente] ([idCliente], [nome], [telefone], [cpf], [fk_idEndereco]) VALUES (9, N'Luís Thales Isaac Duarte', N'75996035614', N'80023457546', 8)
GO
INSERT [dbo].[Cliente] ([idCliente], [nome], [telefone], [cpf], [fk_idEndereco]) VALUES (10, N'Flávia Elaine Sônia', N'71983433703', N'83364459517', 9)
GO
INSERT [dbo].[Endereco] ([idEndereco], [rua], [bairro], [cidade], [numero]) VALUES (1, N'Rua do ceu', N'Itapuã', N'Salvador', N'28')
GO
INSERT [dbo].[Endereco] ([idEndereco], [rua], [bairro], [cidade], [numero]) VALUES (2, N'Rua Centro', N'São Cristovão', N'Salvador', N'05')
GO
INSERT [dbo].[Endereco] ([idEndereco], [rua], [bairro], [cidade], [numero]) VALUES (3, N'Rua da Brisa', N'Itapuã', N'Salvador', N'17')
GO
INSERT [dbo].[Endereco] ([idEndereco], [rua], [bairro], [cidade], [numero]) VALUES (4, N'Rua da poesia', N'Itapuã', N'Salvador', N'22')
GO
INSERT [dbo].[Endereco] ([idEndereco], [rua], [bairro], [cidade], [numero]) VALUES (5, N'Rua Centro', N'São Cristovão', N'Salvador', N'02')
GO
INSERT [dbo].[Endereco] ([idEndereco], [rua], [bairro], [cidade], [numero]) VALUES (6, N'Rua leste3', N'São Cristovao', N'Salvador', N'17')
GO
INSERT [dbo].[Endereco] ([idEndereco], [rua], [bairro], [cidade], [numero]) VALUES (7, N'Rua Oeste2', N'São Cristovão', N'Salvador', N'12')
GO
INSERT [dbo].[Endereco] ([idEndereco], [rua], [bairro], [cidade], [numero]) VALUES (8, N'Fernado sales', N'Cassange', N'Salvador', N'5')
GO
INSERT [dbo].[Endereco] ([idEndereco], [rua], [bairro], [cidade], [numero]) VALUES (9, N'Praca cassange', N'Cassange', N'Salvador', N'7')
GO
INSERT [dbo].[Endereco] ([idEndereco], [rua], [bairro], [cidade], [numero]) VALUES (10, N'Largo do caranguejo', N'Itinga', N'Lauro de Freitas', N'18')
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (1, 2, CAST(N'2021-10-15' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (2, 2, CAST(N'2021-10-17' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (3, 9, CAST(N'2021-10-12' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (4, 1, CAST(N'2021-10-12' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (5, 1, CAST(N'2021-10-14' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (6, 8, CAST(N'2021-10-12' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (7, 5, CAST(N'2021-10-12' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (8, 5, CAST(N'2021-10-13' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (9, 2, CAST(N'2021-10-21' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (10, 7, CAST(N'2021-10-13' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (11, 8, CAST(N'2021-10-15' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (12, 8, CAST(N'2021-10-18' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (13, 6, CAST(N'2021-10-15' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (14, 4, CAST(N'2021-10-12' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (15, 7, CAST(N'2021-10-18' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (16, 3, CAST(N'2021-10-19' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (17, 6, CAST(N'2021-10-20' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (18, 1, CAST(N'2021-10-22' AS Date))
GO
INSERT [dbo].[Orcamento] ([idOrcamento], [fk_idCleinte], [data]) VALUES (19, 7, CAST(N'2021-10-22' AS Date))
GO
INSERT [dbo].[Pedido] ([idPedido], [dataEnvio], [fk_idOrcamento], [foma_pagamento], [status]) VALUES (1, CAST(N'2021-10-15' AS Date), 5, 1, 1)
GO
INSERT [dbo].[Pedido] ([idPedido], [dataEnvio], [fk_idOrcamento], [foma_pagamento], [status]) VALUES (2, CAST(N'2021-10-12' AS Date), 6, 2, 1)
GO
INSERT [dbo].[Pedido] ([idPedido], [dataEnvio], [fk_idOrcamento], [foma_pagamento], [status]) VALUES (3, CAST(N'2021-10-18' AS Date), 10, 2, 0)
GO
INSERT [dbo].[Pedido] ([idPedido], [dataEnvio], [fk_idOrcamento], [foma_pagamento], [status]) VALUES (4, CAST(N'2021-10-20' AS Date), 12, 1, 1)
GO
INSERT [dbo].[Pedido] ([idPedido], [dataEnvio], [fk_idOrcamento], [foma_pagamento], [status]) VALUES (5, CAST(N'2021-10-12' AS Date), 7, 2, 0)
GO
INSERT [dbo].[Pedido] ([idPedido], [dataEnvio], [fk_idOrcamento], [foma_pagamento], [status]) VALUES (6, CAST(N'2021-10-18' AS Date), 15, 1, 0)
GO
INSERT [dbo].[Pedido] ([idPedido], [dataEnvio], [fk_idOrcamento], [foma_pagamento], [status]) VALUES (7, CAST(N'2021-10-18' AS Date), 11, 1, 1)
GO
INSERT [dbo].[Pedido] ([idPedido], [dataEnvio], [fk_idOrcamento], [foma_pagamento], [status]) VALUES (8, CAST(N'2021-10-18' AS Date), 12, 1, 0)
GO
INSERT [dbo].[Pedido] ([idPedido], [dataEnvio], [fk_idOrcamento], [foma_pagamento], [status]) VALUES (9, CAST(N'2021-10-22' AS Date), 18, 1, 0)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (1, 21, 1)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (1, 20, 2)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (1, 19, 300)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (1, 1, 30)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (2, 5, 8)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (2, 9, 3)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (2, 11, 4)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (2, 14, 17)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (2, 18, 1)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (3, 2, 3)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (3, 19, 150)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (3, 20, 0.5)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (4, 15, 12)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (4, 12, 5)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (4, 7, 8)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (4, 17, 1)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (5, 10, 4)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (5, 13, 62)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (5, 8, 16)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (5, 17, 3)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (5, 12, 15)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (6, 3, 7)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (6, 20, 3)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (6, 21, 3)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (6, 2, 19)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (7, 5, 8)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (7, 6, 18)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (7, 13, 30)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (7, 16, 12)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (8, 17, 1)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (9, 2, 1)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (10, 11, 15)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (10, 10, 1)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (11, 6, 2)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (12, 21, 2)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (12, 20, 2)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (12, 1, 8)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (12, 19, 1000)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (13, 19, 450)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (13, 2, 3)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (14, 1, 12)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (15, 4, 7)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (15, 13, 2.55)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (16, 15, 38)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (16, 8, 9)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (16, 18, 2)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (16, 2, 5)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (16, 19, 300)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (17, 19, 30)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (18, 21, 4)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (18, 20, 12)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (18, 1, 22)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (18, 19, 7500)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (19, 20, 1)
GO
INSERT [dbo].[prodOrcamento] ([fk_idOrcamento], [fk_idProduto], [quantidade]) VALUES (20, 2, 1)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (1, N'CIMENTO POTY 50KG', N'CIMENTO TIPO CP II-Z-32, ', N'VOTTORANTIN CIMENTOS', 35.5, 39.5)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (2, N'CIMENTO NACIONAL', N'CIMENTO TIPO  CP II-E-40', N'NACIONAL CIMENTOS', 34, 38)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (3, N'ARGAMASSA MULTI AC1 20KG', N'INDICADA PARA AMBIENTES INTERNOS E QUE NÃO RECEBA UMIDADE', N'MULTICOLA', 12, 13.5)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (4, N'ARGAMASSA AC2 20KG', N'INDICADAS PARA ABIENTES INTERNOS E EXTERNOS QUE RECEBA UMIDADE', N'MULTICOLA', 17, 15.5)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (5, N'ARGAMASSA AC3 MULTI 20KG', N'INDICADAS PARA ABIENTES E PISO SOBRE PISO', N'MULTICOLA', 23, 25)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (6, N'ARGAMASSA VOTTOMASSA AC1 20KG', N'INDICADA PARA AMBIENTES INTERNOS E QUE NÃO RECEBA UMIDADE', N'VOTTORANTIN CIMENTOS', 15, 18.5)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (7, N'ARGAMASSA VOTTOMASSA AC2 20LG', N'INDICADAS PARA ABIENTES INTERNOS E EXTERNOS QUE RECEBA UMIDADE', N'VOTTORANTIN CIMENTOS', 20, 23.99)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (8, N'ARGAMASSA VOTTOMASSA AC3 20KG', N'INDICADAS PARA ABIENTES E PISO SOBRE PISO', N'VOTTORANTIN CIMENTOS', 25, 28.9)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (9, N'JUNTA FACIL 3MM', N'SEPARADOR PARA PISOS', N'ECO LIDER', 3, 3.5)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (10, N'JUNTA FACIL 1,5MM', N'SEPARADOR PARA PISOS', N'ECO LIDER', 3, 3.5)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (11, N'REJUNTE CORES 1KG ', N'REJUNTAMENTO COMUN', N'MULTICOLA', 5, 5.5)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (12, N'REJUNTE RESINADO CORES 1KG', N'REJUNTAMENTO PARA AREAS EXTERNAS E UMIDAS', N'MAXICOLA', 8, 10)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (13, N'PISO ANTIDERRAPANTE 58X58 TIPO A', N'PISO TIPO A ATIDERRAPANTE INDICADO PARA ESCADAS, GARAGENS E AMBIENTES EXTERNOS QUE RECEBA UMIDADE', N'INCENOR', 29.9, 34.9)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (14, N'PISO ESMALTADO', N'PISO TIPO A INDICADO PARA AMBIENTES INTERNOS', N'INCENOR', 35.9, 39.9)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (15, N'PISO 35X35 TIPO A', N'PISO TIPO A, 35X35, INDICADO PARA AMBIENTES EXTERNOS E BANHEIROS', N'INCENOR', 27.5, 30)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (16, N'REVESTIMENTO 33X50 TIPOA', N'PISO TIPO A INDICADO PARA AMBIENTES INTERNOS', N'INCENOR', 29.9, 33.9)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (17, N'MISTURADOR DE ARGAMASSA GALVANIZADO', N'FERRAMENTA COMPATIVEL COM FURADEIRAS SIMPLES ', N'CORTAG', 17.5, 20)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (18, N'MUSTURADOR DE ARGAMASSA', N'FERRAMENTA COMPATIVEL COM FURADEIRAS SIMPLES ', N'ECO LIDER', 14, 16)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (19, N'BLOCO SERGIPE 6 FUROS', N'BLOCO DE CERAMICA 9X15X20', N'CERAMICA BORGES', 0.8, 0.9)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (20, N'AREIA O M²', N'AREIA FINA LIMPA PARA CONSTRUÇÃO', N'AREAL 1', 90, 95)
GO
INSERT [dbo].[produto] ([idProduto], [nome], [descricao], [fornecedor], [precoAvista], [precoPrazo]) VALUES (21, N'GRAVILHÃO O M³', N'GRAVILHÃO 5X8', N'PEDREIRA 2', 135, 140)
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [fk01_Cliente] FOREIGN KEY([fk_idEndereco])
REFERENCES [dbo].[Endereco] ([idEndereco])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [fk01_Cliente]
GO
ALTER TABLE [dbo].[Orcamento]  WITH CHECK ADD  CONSTRAINT [fk01_Orcamento] FOREIGN KEY([fk_idCleinte])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Orcamento] CHECK CONSTRAINT [fk01_Orcamento]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [fk01_Pedido] FOREIGN KEY([fk_idOrcamento])
REFERENCES [dbo].[Orcamento] ([idOrcamento])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [fk01_Pedido]
GO
ALTER TABLE [dbo].[prodOrcamento]  WITH CHECK ADD  CONSTRAINT [fk02_prodOrcamento] FOREIGN KEY([fk_idProduto])
REFERENCES [dbo].[produto] ([idProduto])
GO
ALTER TABLE [dbo].[prodOrcamento] CHECK CONSTRAINT [fk02_prodOrcamento]
GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_ORCAMENTO]    Script Date: 31/10/2021 22:16:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CONSULTA_ORCAMENTO]
    @idCliente INT,
    @idOrçamento INT

    AS
    
BEGIN

    SELECT
        orca.idOrcamento AS 'Codigo do Orçamento',
        orca.data,
        prod.nome AS 'Nome Produto',
        prodOrc.quantidade AS 'Quantidade',
        prod.precoAvista AS 'Preço a Vista',
        prod.precoPrazo AS 'Preço Prazo'
        

            
    FROM

    Orcamento AS orca 
        INNER JOIN
            prodOrcamento AS prodOrc
                ON
                orca.idOrcamento =  prodOrc.fk_idOrcamento
        INNER JOIN
            produto AS prod 
                ON 
                prod.idProduto = prodOrc.fk_idProduto
        WHERE
            orca.fk_idCleinte = @idCliente
        AND
            orca.idOrcamento = @idOrçamento 
  
END
GO
