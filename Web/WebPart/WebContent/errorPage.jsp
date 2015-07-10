<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
  <head>
    <title><s:text name="titulo" /> - Erro no sistema</title>
   </head>
   
  <body>
  <h1>Mensagem de erro: </h1>
    <s:actionerror/>
  <a href="javascript: history.back()" style="text-align: center;">Voltar</a>
  </body>
</html>