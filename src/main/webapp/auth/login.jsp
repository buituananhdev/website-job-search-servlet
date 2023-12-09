<%@ page import="com.example.cnw.model.bo.AccountBO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/main.css">
    <style>
        .container {
            height: 100%;
            justify-content: center;
        }
        .login-container {
            width: 600px;
            display: flex;
            flex-direction: column;
            gap: 24px;
        }
        h2 {
            color: #00b14f;
            font-size: 20px;
            font-style: normal;
            font-weight: 600;
            line-height: 28px;
            text-align: left;
        }
        p {
            color: #7f878f;
            font-size: 14px;
            font-style: normal;
            font-weight: 400;
            letter-spacing: 0;
            line-height: 20px;
            margin-bottom: 0;
            text-align: left;
        }
        input {
            border: 1px solid #eee;
            border-radius: 3px;
            align-items: stretch;
            display: flex;
            flex-wrap: wrap;
            position: relative;
            width: 100%;
            font-weight: 400;
            line-height: 1.5;
            padding: 0.375rem 0.75rem;
            transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
            border-radius: 0.25rem;
            color: #212529;
            display: block;
            background: #fff 0 0 no-repeat padding-box;
            font-size: 14px;
            padding-bottom: 7px;
            padding-top: 7px;
        }
        button {
            background: #00b14f;
            color: #fff;
            font-size: 14px;
            font-weight: 400;
            line-height: 20px;
            width: 100%;
        }
        label {
            margin-bottom: 0.25rem!important;
            color: #4d5965;
            font-size: 14px;
            font-style: normal;
            font-weight: 400;
            line-height: 20px;
        }
        form div {
            margin-bottom: 24px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-container">
        <h2>Chào mừng bạn đã quay trở lại</h2>
        <p>Cùng xây dựng một hồ sơ nổi bật và nhận được các cơ hội sự nghiệp lý tưởng</p>
        <form action="../auth" method="post">
            <div class="inp-email">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" placeholder="Email" required>
            </div>
            <div class="inp-password">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
            </div>
            <button type="submit">Đăng nhập</button>
        </form>
        <span>Bạn chưa có tài khoản? <a href="signup">Đăng ký ngay</a> </span>
    </div>
</div>

</body>
</html>
