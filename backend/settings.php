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
            <h2 class="mb-4">Settings</h2>

            <!-- Settings Tabs -->
            <?php include 'components/settings/settings-tabs.php'; ?>
        </div>
    </div>
</div>

<?php include 'layouts/footer.php'; ?>