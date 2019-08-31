<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Plannings</title>
</head>
<body>
<jsp:include page="navbar.html"/>
<br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label for="from">From</label>
                <input type="date" class="form-control" id="from" name="from">
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label for="to">To</label>
                <input type="date" class="form-control" id="to" name="to">
            </div>
        </div>
        <div class="col-sm-2" data-toggle="modal" data-target="#exampleModal">
            <div class="form-group">
                <label><br/></label>
                <input class="form-control btn btn-dark" type="submit" value="Create">
            </div>
        </div>
    </div>
</div>
<br/>
<table class="table table-borderless table-dark">
    <thead>
    <tr>
        <th scope="col" class="bg-success">#</th>
        <th scope="col" class="bg-success">Sunday</th>
        <th scope="col" class="bg-success">Monday</th>
        <th scope="col" class="bg-success">Tuesday</th>
        <th scope="col" class="bg-success">Wednesday</th>
        <th scope="col" class="bg-success">Thursday</th>
        <th scope="col" class="bg-success">Friday</th>
        <th scope="col" class="bg-success">Saturday</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row" class="bg-success">08:00 - 10:00</th>

    </tr>
    <tr>
        <th scope="row" class="bg-success">10:00 - 12:00</th>

    </tr>
    <tr>
        <th scope="row" class="bg-success">12:00 - 14:00</th>

    </tr>
    <tr>
        <th scope="row" class="bg-success">14:00 - 16:00</th>

    </tr>
    </tbody>
</table>
</body>
</html>
