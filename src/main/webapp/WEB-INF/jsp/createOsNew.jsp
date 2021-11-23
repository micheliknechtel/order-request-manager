<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

</head>
<body>
<h1>New Order Request ${os.id}</h1>
<form  action="../createOs" name="myForm" method="POST">
<table>

        <tr>
            <td>Name</td>
            <td><input type="text" id="name" name="name" value="${os.client.name}"/></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text"  name="email" value="${os.client.email}"/></td>
        </tr>
        <tr>
            <td>Client ID</td>
            <td><input type="text" name="cpf" value="${os.client.cpf}"/></td>
        </tr>

        <tr>
            <td>Equipment</td>
            <td><input type="text"  id="brand" name="brand" value="${os.equipment.brand}"/></td>
        </tr>
        <tr>
            <td>Serial</td>
            <td><input type="text" name="serial" value="${os.equipment.serial}" /></td>
        </tr>
        <tr>
            <td>Model</td>
            <td><input type="text" name="model" value="${os.equipment.model}"/></td>
        </tr>
        <tr>
            <td>Cost</td>
            <td><input type="text" name="value" onKeyPress="return(MascaraMoeda(this,'.',',',event))" /></td>
        </tr>
        <tr>
            <td><input type="hidden" name="idClient" value="${os.client.id}"/></td>
        </tr>
        <tr>
           <td><input type="hidden" name="idEquipment" value="${os.equipment.id}"/></td>
        </tr>
          <tr>
           <td><input type="hidden" name="idOs" value="${os.id}"/></td>
          </tr>
        <tr>
            <td>
           <input type="submit" value="submit" >
            </td>
        </tr>
    </table>
</form>
</table>

</body>
<script language="javascript">
//-----------------------------------------------------
//Funcao: MascaraMoeda
//Sinopse: Mascara de preenchimento de moeda
//Parametro:
//   objTextBox : Objeto (TextBox)
//   SeparadorMilesimo : Caracter separador de milésimos
//   SeparadorDecimal : Caracter separador de decimais
//   e : Evento
//Retorno: Booleano
//Autor: Gabriel Fróes - www.codigofonte.com.br
//-----------------------------------------------------
function MascaraMoeda(objTextBox, SeparadorMilesimo, SeparadorDecimal, e){
    var sep = 0;
    var key = '';
    var i = j = 0;
    var len = len2 = 0;
    var strCheck = '0123456789';
    var aux = aux2 = '';
    var whichCode = (window.Event) ? e.which : e.keyCode;
    if (whichCode == 13) return true;
    key = String.fromCharCode(whichCode); // Valor para o código da Chave
    if (strCheck.indexOf(key) == -1) return false; // Chave inválida
    len = objTextBox.value.length;
    for(i = 0; i < len; i++)
        if ((objTextBox.value.charAt(i) != '0') && (objTextBox.value.charAt(i) != SeparadorDecimal)) break;
    aux = '';
    for(; i < len; i++)
        if (strCheck.indexOf(objTextBox.value.charAt(i))!=-1) aux += objTextBox.value.charAt(i);
    aux += key;
    len = aux.length;
    if (len == 0) objTextBox.value = '';
    if (len == 1) objTextBox.value = '0'+ SeparadorDecimal + '0' + aux;
    if (len == 2) objTextBox.value = '0'+ SeparadorDecimal + aux;
    if (len > 2) {
        aux2 = '';
        for (j = 0, i = len - 3; i >= 0; i--) {
            if (j == 3) {
                aux2 += SeparadorMilesimo;
                j = 0;
            }
            aux2 += aux.charAt(i);
            j++;
        }
        objTextBox.value = '';
        len2 = aux2.length;
        for (i = len2 - 1; i >= 0; i--)
        objTextBox.value += aux2.charAt(i);
        objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);
    }
    return false;
}
</script>
</html>