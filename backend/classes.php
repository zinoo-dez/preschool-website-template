<?php include 'layouts/header.php'; ?>
<div class="wrapper">
    <!-- Sidebar -->
    <?php include 'components/sidebar.php'; ?>

    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <?php include 'components/top-nav.php'; ?>

        <!-- Main Content -->
        <div class="container-fluid p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">Class Management</h2>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addClassModal">
                    <i class="bi bi-plus-lg"></i> Add New Class
                </button>
            </div>

            <!-- Class Cards -->
            <?php include 'components/classes/class-cards.php'; ?>

            <!-- Weekly Schedule -->
            <?php include 'components/classes/weekly-schedule.php'; ?>
        </div>
    </div>
</div>

<!-- Add Class Modal -->
<div class="modal fade" id="addClassModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Class</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label class="form-label">Class Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Age Group</label>
                        <select class="form-select" required>
                            <option value="">Select Age Group</option>
                            <option>2-3 years</option>
                            <option>3-4 years</option>
                            <option>4-5 years</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Lead Teacher</label>
                        <select class="form-select" required>
                            <option value="">Select Teacher</option>
                            <option>Sarah Williams</option>
                            <option>Michael Brown</option>
                            <option>Emma Davis</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Schedule</label>
                        <select class="form-select" required>
                            <option value="">Select Time Slot</option>
                            <option>Morning (9:00 AM - 12:00 PM)</option>
                            <option>Afternoon (1:00 PM - 4:00 PM)</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Maximum Capacity</label>
                        <input type="number" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Start Date</label>
                        <input type="date" class="form-control" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Add Class</button>
            </div>
        </div>
    </div>
</div>

<?php include 'layouts/footer.php'; ?>