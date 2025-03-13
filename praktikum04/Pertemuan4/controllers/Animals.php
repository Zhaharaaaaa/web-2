<?php 
class Animal {
    public $animals = ["Kucing", "Harimau", "Kelinci", "Buaya","Ular"];

    function index () {
        echo "<ol>";
        foreach ($this->animals as $key => $value) {
            echo "<li>$value</li>";
        }
        echo "</ol>";
    }
    
    function store($hewan){
        array_push($this->animals, $hewan);

        $this->index();
    }

    public function update($key, $value){
        if (isset($this->animals[$key])) {
            $this->animals[$key] = $value; // memanggil method index
            $this->index();
            } else {
            echo "hewan tidak ditemukan</br>";
        }
    }

    public function destroy($key){
        if (isset($this->animals[$key])) {
            unset($this->animals[$key]);
             // memanggil method index
             $this->index();
            } else {
            echo "hewan tidak ditemukan</br>";
        }
    }
}

$hewan = new Animal();
echo "index - menampilkan seluruh data hewan </br>";
$hewan->index();
echo "</br>";

echo "Store - menambahkan data hewan baru (burung) </br>";
$hewan->store("Burung");
echo "</br>";

echo "Update - Mengupdate data hewan </br>";
$hewan->update(0, "Kucing Himalaya");
echo "</br>";

echo "Destroy - Menghapus data hewan </br>";
$hewan->destroy(0);
echo "</br>";

?>