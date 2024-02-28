<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>User Profile</title>
        <!-- Add Bootstrap CSS link -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Add DataTables CSS link -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="container profile-container">
            <h1 class="text-center mb-4 mt-5">User Management</h1>

            <c:if test="${param.success ne null}">
                <div class="alert alert-success" role="alert">
                    Update success!
                </div>
            </c:if>
            <c:if test="${param.fail ne null}">
                <div class="alert alert-danger" role="alert">
                    Update failed!
                </div>
            </c:if>

            <!-- Add User Button -->
            <div class="w-100" style="text-align: end;">
                <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addUserModal">
                    Add User
                </button>
            </div>

            <table id="userTable" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>User Account</th>
                        <th>Role</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td>${user.account}</td>
                            <td>${user.rollId=="3" ? "User" : "Admin"}</td>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                            <td>${user.phone}</td>
                            <td>${user.address}</td>
                            <td>
                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editModal${user.account}">
                                    Edit
                                </button>
                            </td>
                        </tr>

                        <!-- Edit Modal for each user -->
                    <div class="modal fade" id="editModal${user.account}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel${user.account}" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editModalLabel${user.account}">Edit User</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="user?action=update" method="post">
                                        <input type="hidden" name="userId" value="${user.account}">
                                        <input type="hidden" class="form-control" name="password" value="${user.password}">

                                        <div class="form-group">
                                            <label for="email">Email:</label>
                                            <input type="email" class="form-control" name="email" value="${user.email}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="phonenumber">Phone Number:</label>
                                            <input type="text" class="form-control" name="phonenumber" value="${user.phone}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="fullName">Full Name:</label>
                                            <input type="text" class="form-control" name="fullName" value="${user.name}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="role">Role:</label>
                                            <select class="form-control" name="role" required>
                                                <option value="1" ${user.rollId == 1 ? 'selected' : ''}>Admin</option>
                                                <option value="0" ${user.rollId == 3 ? 'selected' : ''}>User</option>
                                            </select>
                                        </div>

                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>
                </tbody>
            </table>

        </div>

        <!-- Add User Modal -->
        <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addUserModalLabel">Add User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Add your user creation form fields here -->
                        <!-- For simplicity, assuming similar fields as in user-form.jsp -->
                        <form action="user?action=create" method="post">
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" name="email" required>
                            </div>

                            <div class="form-group">
                                <label for="phonenumber">Phone Number:</label>
                                <input type="text" class="form-control" name="phonenumber" required>
                            </div>

                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" class="form-control" name="password" required>
                            </div>

                            <div class="form-group">
                                <label for="fullName">Full Name:</label>
                                <input type="text" class="form-control" name="fullName" required>
                            </div>

                            <div class="form-group">
                                <label for="role">Role:</label>
                                <select class="form-control" name="role" required>
                                    <option value="0">User</option>
                                    <option value="1">Admin</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary">Create User</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include Bootstrap JS, Popper.js, and DataTables JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#userTable').DataTable({
                    "pageLength": 5,
                    "lengthChange": false
                });
            });
        </script>

    </body>
</html>
