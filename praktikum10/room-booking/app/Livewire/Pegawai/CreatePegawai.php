<?php

namespace App\Livewire\Pegawai;

use App\Models\Pegawai;
use App\Models\UnitKerja;
use Livewire\Component;

class CreatePegawai extends Component
{   
    public $nip, $nama, $unitkerja_id;

    public function save()
    {
        $this->validate([
            'nip' => 'required',
            'nama' => 'required',
            'unitkerja_id' => 'required',
        ]);

        Pegawai::create([
            'nip' => $this->nip,
            'nama' => $this->nama,
            'unitkerja_id' => $this->unitkerja_id,
        ]);

        session()->flash('message', 'Pegawai berhasil ditambahkan!');
        return $this->redirectRoute('pegawai.index');
    }

    public function render()
    {
        return view('livewire.pegawai.create-pegawai', [
            'unitkerjas' => UnitKerja::all(),
        ]);
    }
}
