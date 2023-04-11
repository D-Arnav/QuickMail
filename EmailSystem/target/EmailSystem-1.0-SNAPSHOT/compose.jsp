<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .container {
            display: grid;
            grid-template-columns: 1fr;
            grid-template-rows: 1fr 1fr 6fr;
            gap: 10px 10px;
            height: 100vh;
            background: #f1f1f1;
        }

        .to {
            width: 50%;
            height: 30px;
        }

        .subject {
            width: 50%;
            height: 30px;
        }

        .content {
            width: 50%;
            height: 200px;
        }
        #to, #subject{
            margin-left: 60%;
            margin-right: 10%;
            width: 80%;
            height: 30px;
        }

        .compose {
            height: 65px;
            padding: 5px;
            margin-left: 80%;
            margin-bottom: 5%;
            background-color: #333;
            width: 7%;
            color: white;
            font-size: 16px;
            font-family: sans-serif;
            cursor: pointer;
        }
        textarea {
            resize: none;
            margin-left: 60%;
            margin-right: 10%;
            width: 80%;
            height: 400px;
        }
    </style>
</head>
<body>
<form action="send.jsp" method="post">
    <div class="container">
        <div class="to">
            <label for="from"></label><input type="text" name="from" id="from" value="<% out.print(request.getParameter("email")); %>" hidden="hidden">
            <label for="to">
                <span style = "margin-left: 60%;">To:</span><br><input type="text" name="to" id="to" />
            </label>
        </div>
        <div class="subject">
            <label for="subject">
                <span style = "margin-left: 60%;">Subject:</span><br><input type="text" name="subject" id="subject" />
            </label>
        </div>
        <div class="content">
            <label for="content">
                <textarea type="text" name="content" id="content"></textarea>
            </label>
        </div>
        <label>
            <input type="submit" class="compose" onclick="compose()" value="Send"/>
        </label>
    </div>
</form>
</body>
</html>