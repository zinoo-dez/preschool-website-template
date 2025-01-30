<div class="card">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Class</th>
                        <th>Parent Name</th>
                        <th>Contact</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>STU001</td>
                        <td>Emily Johnson</td>
                        <td>4</td>
                        <td>Butterflies</td>
                        <td>Sarah Johnson</td>
                        <td>+1 234-567-8901</td>
                        <td><span class="badge bg-success">Active</span></td>
                        <td>
                            <button class="btn btn-sm btn-outline-primary me-1"><i
                                    class="bi bi-pencil"></i></button>
                            <button class="btn btn-sm btn-outline-danger"><i
                                    class="bi bi-trash"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>STU002</td>
                        <td>Michael Smith</td>
                        <td>3</td>
                        <td>Ladybugs</td>
                        <td>John Smith</td>
                        <td>+1 234-567-8902</td>
                        <td><span class="badge bg-warning">Pending</span></td>
                        <td>
                            <button class="btn btn-sm btn-outline-primary me-1"><i
                                    class="bi bi-pencil"></i></button>
                            <button class="btn btn-sm btn-outline-danger"><i
                                    class="bi bi-trash"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <nav class="mt-3">
            <ul class="pagination justify-content-end">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </nav>
    </div>
</div>