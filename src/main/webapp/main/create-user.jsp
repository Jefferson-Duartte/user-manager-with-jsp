<%@ page import="model.Login" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pt-br">

<jsp:include page="head.jsp"/>
<style>
    .isFalse {
        display: none;
    }

</style>

<body>
<%--Pre-Loader--%>
<jsp:include page="pre-loader.jsp"/>

<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
        <jsp:include page="navbar.jsp"/>
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <jsp:include page="left-bar.jsp"/>
                <div class="pcoded-content">
                    <!-- Page-header start -->
                    <jsp:include page="page-header.jsp"/>
                    <!-- Page-header end -->
                    <div class="pcoded-inner-content">
                        <!-- Main-body start -->
                        <div class="main-body">
                            <div class="page-wrapper">
                                <!-- Page-body start -->
                                <div class="page-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>Cadastre um novo usuário</h5>
                                                </div>

                                                <%
                                                    Login user = (Login) request.getAttribute("dataLogin");
                                                    String id = "";
                                                    String name = "";
                                                    String email = "";
                                                    String login = "";
                                                    String password = "";
                                                    if (user != null) {
                                                        id = String.valueOf(user.getId());
                                                        name = user.getName();
                                                        email = user.getEmail();
                                                        login = user.getLogin();
                                                        password = user.getPassword();

                                                    }


                                                %>

                                                <div class="card-block">
                                                    <form class="form-material" id="create_user_form"
                                                          action="<%=request.getContextPath()%>/ServletUserController"
                                                          method="post">
                                                        <input type="hidden" name="action" id="action" value=""/>
                                                        <div class="form-group form-default form-static-label">
                                                            <input type="text" name="id" class="form-control" readonly
                                                                   value="<%=id%>">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">ID</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="name" class="form-control" required
                                                                   value="<%=name%>">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Nome</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="email" name="email"
                                                                   class="form-control" required value="<%=email%>">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">E-mail</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="login"
                                                                   class="form-control" required value="<%=login%>">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Login</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="password" name="password"
                                                                   class="form-control" required value="<%=password%>">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Senha</label>
                                                        </div>
                                                        <button onclick=cleanForm() type="button"
                                                                class="btn btn-primary waves-effect waves-light">
                                                            Novo
                                                        </button>
                                                        <button type="submit"
                                                                class="btn btn-success waves-effect waves-light">
                                                            Salvar
                                                        </button>
                                                        <button class="btn btn-warning waves-effect waves-light">Editar
                                                        </button>
                                                        <button type="button" onclick=creteDelete()
                                                                class="btn btn-danger waves-effect waves-light">Excluir
                                                        </button>
                                                        <%
                                                            String msg = (String) request.getAttribute("msg");
                                                            String style = "";
                                                            if (msg == null || msg == "null") {
                                                                msg = "";
                                                                style = "isFalse";
                                                            }

                                                        %>

                                                        <div class="alert alert-success mt-4 col-md-3  <%=style%>"
                                                             role="alert" id="msg">
                                                            <%=msg%>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <%--JavaScript imports--%>
                <jsp:include page="javascriptfile.jsp"/>


                <script>

                    function creteDelete() {

                        if (confirm("Deseja realmente excluir?")) {
                            var form = document.getElementById("create_user_form");
                            form.method = "get";
                            document.getElementById("action").value = "Delete";
                            form.submit();
                        }

                    }

                    function cleanForm() {
                        var elements = document.getElementById("create_user_form").elements;
                        document.getElementById("msg").style.display = "none";
                        for (let i = 0; i < elements.length; i++) {
                            elements[i].value = "";
                        }
                    }

                </script>


</body>

</html>
