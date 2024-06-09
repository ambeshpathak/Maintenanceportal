<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="access_denied.aspx.cs" Inherits="Maintenance_System.access_denied" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel ="shortcut icon" href="mhi.ico" />
    <title>Access Denied</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: rgb(2,77,135);
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 270px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #ff6347;
        }
        p {
            margin-top: 20px;
            font-size: 18px;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Access Denied</h2>
        <p>You do not have permission to access this page.</p>
        <p>Please contact the administrator for assistance.</p>
    </div>
</body>
</html>