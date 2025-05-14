<?php
include 'config/database.php';

// Tambah data jenis kegiatan
if (isset($_POST['tambah'])) {
    $nama = $_POST['nama'];
    mysqli_query($conn, "INSERT INTO jenis_kegiatan (nama) VALUES ('$nama')");
}

// Update data  jenis kegiatan
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $nama = $_POST['nama'];
    mysqli_query($conn, "UPDATE jenis_kegiatan SET nama='$nama' WHERE id=$id");
    header("Location: jenis_kegiatan.php");
}

// Ambil data untuk edit jenis kegiatan
$edit = null;
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    $result = mysqli_query($conn, "SELECT * FROM jenis_kegiatan WHERE id=$id");
    $edit = mysqli_fetch_assoc($result);
}

// Hapus data jenis kegiatan
if (isset($_GET['hapus'])) {
    $id = $_GET['hapus'];
    mysqli_query($conn, "DELETE FROM jenis_kegiatan WHERE id=$id");
    header("Location: jenis_kegiatan.php");
}

// Ambil data jenis kegiatan
$data = mysqli_query($conn, "SELECT * FROM jenis_kegiatan");
?>

<?php include 'header.php'; ?>
<?php include 'sidebar.php'; ?>

<div id="layoutSidenav_content">
<div class="container-fluid px-4">
    <h2 class="mt-5">Data Jenis Kegiatan</h2>

    <!-- Form tambah/edit jenis kegiatan -->
    <div class="card mb-4">
        <div class="card-header mb-3 p-5 bg-dark">
            <form method="POST" class="row g-2 align-items-center">
                <?php if ($edit): ?>
                    <input type="hidden" name="id" value="<?= $edit['id'] ?>">
                <?php endif; ?>
                <div class="col">
                    <input type="text" name="nama" class="form-control" placeholder="Nama Jenis Kegiatan" required value="<?= $edit ? htmlspecialchars($edit['nama']) : '' ?>">
                </div>
                <div class="col-auto">
                    <?php if ($edit): ?>
                        <button name="update" class="btn btn-success">Update</button>
                        <a href="jenis_kegiatan.php" class="btn btn-secondary">Batal</a>
                    <?php else: ?>
                        <button name="tambah" class="btn btn-primary">Tambah</button>
                    <?php endif; ?>
                </div>
            </form>
        </div>

        <!-- table jenis kegiatan -->
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>No</th>
                            <th>Nama Jenis Kegiatan</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1; while ($row = mysqli_fetch_assoc($data)) { ?>
                        <tr>
                            <td><?= $no++ ?></td>
                            <td><?= htmlspecialchars($row['nama']) ?></td>
                            <td>
                                <a class="btn btn-sm btn-warning" href="?edit=<?= $row['id'] ?>">Edit</a>
                                <a class="btn btn-sm btn-danger" href="?hapus=<?= $row['id'] ?>" onclick="return confirm('Yakin hapus data ini?')">Hapus</a>
                            </td>
                        </tr>
                        <?php } ?>
                        <?php if (mysqli_num_rows($data) == 0): ?>
                        <tr>
                            <td colspan="3" class="text-center">Belum ada data jenis kegiatan.</td>
                        </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?php include 'footer.php'; ?>
