<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="Maintenance_System.feedback" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Feedback Form</title>
    <style>
        body{
            background:rgb(2,77,135);
        }
           
        .container {
            width: 450px;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding:20px;
            border-radius: 5px;
            margin-top:200px;
            background:white;
            color:black;
            height:295px;
        }   

       

        .form-group {
            margin-bottom: 15px;
        }

        .label {
            display: block;
            font-weight: bold;
        }

        .input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
         .button2 {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: rgb(2,77,135);
            color: white;
            border: 1px solid black;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 13px;
        }

        .button2:hover {
            background-color: white;
            color:black;
        }

        .button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: red;
            color: white;
            border: 1px solid black;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 13px;
        }

        .button:hover {
            background-color: white;
            color:black;
        }
        .auto-style1 {
            text-align: center;
            border: 1px solid black;
            height:40px;
            padding-top:10px;
            background:rgb(2,77,135);
            border-radius:5px;
            color:white;
        }
        
    </style>
    </head>
<body>


     <div class="container">
          <h2 class="auto-style1">Feedback</h2>
             <form id="form1" runat="server">
            
            <asp:TextBox ID="TextBoxMultiLine" runat="server" TextMode="MultiLine" Width="430px" Rows="4"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" CssClass="button2" OnClick="Button1_Click" Text="Submit" />
     
    </form>
    </div>

</body>
</html>
