<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Evaluacion.aspx.cs" Inherits="SistemaRRHH.Evaluacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            border-radius: 15px;
        }

        .form-label {
            font-weight: 500;
        }

        .table thead {
            background-color: #dee2e6;
        }

        .section-title {
            font-size: 1.4rem;
            font-weight: 600;
            color: #343a40;
        }

        .centrado-gridview {
            border-collapse: collapse;
            width: 100%;
            /*text-align: center;*/
        }

            .centrado-gridview td,
            .centrado-gridview th {
                border: 1px solid #ccc;
                padding: 8px;
            }

            .centrado-gridview th {
                background-color: #f2f2f2;
            }
    </style>

    <div style="position: absolute; top: 0; right: 0; padding: 10px; text-align: right; font-family: Arial; font-size: 14px;">
        <strong>Bienvenido</strong>
        <asp:Label ID="lblWelcome" runat="server" />
        &nbsp;|&nbsp;
        <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" ForeColor="Blue">Cerrar sesión</asp:LinkButton>
    </div>


    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <div class="container py-5">
                <!-- Datos del Evaluador -->
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-primary text-white">
                        <i class="bi bi-person-badge-fill me-2"></i>Datos del Evaluador
                    </div>
                    <div class="card-body">
                        <div class="row g-4 align-items-end">
                            <div class="col-md-6">
                                <label class="form-label">Nro. DNI:</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" placeholder="Ingrese DNI"></asp:TextBox>
                                    <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-outline-primary" Text="Buscar" ToolTip="Buscar Evaluador" OnClick="btnBuscar_Click" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Nombres y Apellidos:</label>
                                <asp:TextBox ID="txtNombresyApellidos" runat="server" CssClass="form-control" placeholder="Nombre completo" ReadOnly="true"></asp:TextBox>
                                <%--<asp:TextBox ID="txtNombresyApellidos" runat="server" Width="207px"></asp:TextBox>--%>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Cargo:</label>
                                <asp:TextBox ID="txtCargo" runat="server" CssClass="form-control" placeholder="Ej. Jefe de Área" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Área:</label>
                                <asp:TextBox ID="txtArea" runat="server" CssClass="form-control" placeholder="Ej. Finanzas" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Grado:</label>
                                <asp:TextBox ID="txtGrado" runat="server" CssClass="form-control" placeholder="Ej. Licenciado" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Indicaciones -->
                <div class="text-center mb-4">
                    <p class="section-title">Selecciona al trabajador y presiona el botón para evaluar</p>
                </div>

                <!-- Tabla de Evaluados -->
                <%--  <div class="card shadow-sm mb-4">
                <div class="card-header bg-secondary text-white">
                    <i class="bi bi-people-fill me-2"></i> Lista de Trabajadores a Evaluar
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th scope="col">Nro.</th>
                                    <th scope="col">PR</th>
                                    <th scope="col">DNI Evaluado</th>
                                    <th scope="col">CO</th>
                                    <th scope="col">Nombre del Evaluado</th>
                                    <th scope="col">Cargo Estructural</th>
                                    <th scope="col">Metas</th>
                                    <th scope="col">Competencias</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Aquí puedes cargar dinámicamente -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>--%>


                <%-- <asp:GridView ID="gvEvaluadosdetail" runat="server" AutoGenerateColumns="False" Width="863px"
                    CssClass="table table-bordered table-hover" GridLines="None" EnableViewState="true"
                    OnRowDataBound="gvEvaluadosdetail_RowDataBound">
                    <SelectedRowStyle CssClass="fila-seleccionada" />
                    <Columns>
                        <asp:TemplateField HeaderText="Nro.">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PR" HeaderText="PR" Visible="True" />
                        <asp:BoundField DataField="DNI_Evaluado" HeaderText="DNI Evaluado" Visible="True" />
                        <asp:BoundField DataField="CO" HeaderText="CO" Visible="True" />
                        <asp:BoundField DataField="NombresyApellidos" HeaderText="Nombre del Evaluado" Visible="True" />
                        <asp:BoundField DataField="Cargo_Estructural" HeaderText="Cargo Estructural" Visible="True" />
                    </Columns>
                </asp:GridView>--%>





                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-secondary text-white">
                        <i class="bi bi-people-fill me-2"></i>Lista de Trabajadores a Evaluar
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvEvaluadosdetail" runat="server" AutoGenerateColumns="False" GridLines="None" CssClass="centrado-gridview" OnRowDataBound="gvEvaluadosdetail_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSeleccionar" runat="server" AutoPostBack="true" OnCheckedChanged="chkSeleccionar_CheckedChanged" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nro.">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PR" HeaderText="PR" />
                                    <asp:BoundField DataField="DNI_Evaluado" HeaderText="DNI Evaluado" />
                                    <asp:BoundField DataField="CO" HeaderText="CO" />
                                    <asp:BoundField DataField="NombresyApellidos" HeaderText="Nombre del Evaluado" />
                                    <asp:BoundField DataField="Cargo_Estructural" HeaderText="Cargo Estructural" />
                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                </div>



                <!-- Botones -->
                <div class="text-center">
                    <asp:Button ID="btnobjetivos" runat="server" Text=" Evaluar Objetivos (Metas)" CssClass="btn btn-success btn-lg me-3" OnClick="btnobjetivos_Click" />
                    <asp:Button ID="Button2" runat="server" Text=" Evaluar Competencias" CssClass="btn btn-warning btn-lg" />
                    <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
                </div>
            </div>

            <%--            <asp:Panel ID="PanelModal" runat="server" Style="display:none;">
            <div id="modalContent">
                <h4>Evaluación de Metas</h4>
                <hr />
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label>DNI:</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                    <div class="col-md-8">
                        <label>Nombres y Apellidos:</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label>Cargo:</label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                    <div class="col-md-4">
                        <label>Área:</label>
                        <asp:TextBox ID="TextArea" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                    <div class="col-md-4">
                        <label>Categoría:</label>
                        <asp:TextBox ID="TextCategoria" runat="server" CssClass="form-control" ReadOnly="true" />
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered mt-4 text-center">
                        <thead class="table-secondary">
                            <tr>
                                <th>Nro.</th>
                                <th>Objetivos</th>
                                <th>Calificación (0-100)</th>
                                <th>Puntuación (%)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td><asp:TextBox ID="txtObjetivo1" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td><asp:TextBox ID="txtCalificacion1" runat="server" CssClass="form-control text-center"></asp:TextBox></td>
                                <td><asp:Label ID="lblPuntuacion1" runat="server" CssClass="form-text fw-bold">0%</asp:Label></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><asp:TextBox ID="txtObjetivo2" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td><asp:TextBox ID="txtCalificacion2" runat="server" CssClass="form-control text-center"></asp:TextBox></td>
                                <td><asp:Label ID="lblPuntuacion2" runat="server" CssClass="form-text fw-bold">0%</asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="text-end">
                    <button type="button" class="btn btn-secondary" onclick="cerrarModal()">Cerrar</button>
                </div>
            </div>

        </asp:Panel>--%>

            <asp:Panel ID="PanelModal" runat="server" CssClass="modal fade" ClientIDMode="Static" TabIndex="-1" role="dialog">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-success text-white">
                            <h5 class="modal-title">Evaluación de Metas</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">                           
                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <label>Nro. DNI:</label>
                                    <asp:TextBox ID="txtmdni" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                                <div class="col-md-8">
                                    <label>Nombres y Apellidos:</label>
                                    <asp:TextBox ID="txtmnombresyapellidos" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <label>Cargo:</label>
                                    <asp:TextBox ID="txtmcargo" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                                <div class="col-md-4">
                                    <label>Área:</label>
                                    <asp:TextBox ID="txtmarea" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                                <div class="col-md-4">
                                    <label>Categoría:</label>
                                    <asp:TextBox ID="txtmcategoria" runat="server" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-bordered mt-4 text-center">
                                    <thead class="table-secondary">
                                        <tr>
                                            <th>Nro.</th>
                                            <th>Objetivos</th>
                                            <th>Calificación (0-100)</th>
                                            <th>Puntuación (%)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>
                                                <asp:TextBox ID="txtObjetivo1" runat="server" CssClass="form-control"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txtCalificacion1" runat="server" CssClass="form-control text-center"></asp:TextBox></td>
                                            <td>
                                                <asp:Label ID="lblPuntuacion1" runat="server" CssClass="form-text fw-bold">0%</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>
                                                <asp:TextBox ID="txtObjetivo2" runat="server" CssClass="form-control"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txtCalificacion2" runat="server" CssClass="form-control text-center"></asp:TextBox></td>
                                            <td>
                                                <asp:Label ID="lblPuntuacion2" runat="server" CssClass="form-text fw-bold">0%</asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </asp:Panel>



        </ContentTemplate>
    </asp:UpdatePanel>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    <!-- Bootstrap 5 (si usas 4, cambia el data-bs por data-) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</asp:Content>
