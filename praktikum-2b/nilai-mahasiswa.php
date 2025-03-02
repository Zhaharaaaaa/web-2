<?php
require_once "form-nilai.php"; 
$proses = $_POST['proses'];
$nama_siswa = $_POST['nama'];
$mata_kuliah = $_POST['matkul'];
$nilai_uts = $_POST['nilai_uts'];
$nilai_uas = $_POST['nilai_uas'];
$nilai_tugas = $_POST['nilai_tugas'];

// menentukan nilai akhir
$nilai_akhir = (0.3 * $nilai_uts) + (0.35 * $nilai_uas) + (0.35 * $nilai_tugas);

// menentukan status kelulusan
if ($nilai_akhir >= 55) {
    $status = "Lulus";
} else {
    $status = "Tidak Lulus";
}

// memnetukan grade nilai
if ($nilai_akhir >= 85 && $nilai_akhir <= 100) {
    $grade = "A";
} elseif ($nilai_akhir >= 70 && $nilai_akhir < 85) {
    $grade = "B";
} elseif ($nilai_akhir >= 56 && $nilai_akhir < 70) {
    $grade = "C";
} elseif ($nilai_akhir >= 36 && $nilai_akhir < 56) {
    $grade = "D";
} elseif ($nilai_akhir >= 0 && $nilai_akhir < 36) {
    $grade = "E";
} elseif ($nilai_akhir < 0 || $nilai_akhir > 100) {
    $grade = "I";
} else {
    $grade = "Tidak Tersedia";
}

// menentukan predikat dengan switch
switch ($grade) {
    case "A":
        $predikat = "Sangat Memuaskan";
        break;
    case "B":
        $predikat = "Memuaskan";
        break;
    case "C":
        $predikat = "Cukup";
        break;
    case "D":
        $predikat = "Kurang";
        break;
    case "E":
        $predikat = "Sangat Kurang";
        break;
    case "I":
        $predikat = "Tidak ada";
        break;
    default :
        $predikat = "Tidak Tersedia";
        break;
}

// menampilkan hasil
if (!empty($proses)) {    // empty() untuk memeriksa apakah variabel kosong atau tidak.
    echo "<div class='container mt-4 border p-3'>";
    echo "<h4>Hasil Penilaian</h4>";
    echo "Proses : $proses </br>";
    echo "Nama : $nama_siswa </br>";
    echo "Mata Kuliah : $mata_kuliah </br>";
    echo "Nilai UTS : $nilai_uts </br>";
    echo "Nilai UAS : $nilai_uas </br>";
    echo "Nilai Tugas/Prkatikum : $nilai_tugas </br>";
    echo "Nilai Akhir : ". number_format($nilai_akhir , 2, ",", "."). "<br>";
    echo "Status : $status <br>";
    echo "Grade : $grade <br>";
    echo "Predikat : $predikat <br>";
}
