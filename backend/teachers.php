<?php include 'layouts/header.php'; ?>
<div class="wrapper">
    <!-- Sidebar -->
    <?php include 'components/sidebar.php'; ?>

    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <?php include 'components/top-nav.php'; ?>

        <!-- Main Content -->
        <?php include 'components/teachers/main-cards.php'; ?>

    </div>
</div>

<!-- Add Teacher Modal -->
<div class="modal fade" id="addTeacherModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Teacher</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Position</label>
                        <select class="form-select" required>
                            <option value="">Select Position</option>
                            <option>Lead Teacher</option>
                            <option>Assistant Teacher</option>
                            <option>Substitute Teacher</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Assigned Class</label>
                        <select class="form-select" required>
                            <option value="">Select Class</option>
                            <option>Butterflies</option>
                            <option>Ladybugs</option>
                            <option>Bumblebees</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Experience (years)</label>
                        <input type="number" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Qualifications</label>
                        <textarea class="form-control" rows="3" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Add Teacher</button>
            </div>
        </div>
    </div>
</div>

<?php include 'layouts/footer.php'; ?>