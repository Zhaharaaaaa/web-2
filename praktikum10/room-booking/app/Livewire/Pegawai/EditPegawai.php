<?php

namespace App\Livewire\Pegawai;

use App\Models\Pegawai;
use App\Models\UnitKerja;
use Livewire\Component;
use Livewire\Attributes\Validate;

class EditPegawai extends Component
{
    #[Validate('required|string|max:10')]
    public string $nip = '';
    #[Validate('required|string|max:100')]
    public string $nama = '';
    #[Validate('required')]
    public ?int $unitkerja_id = null;
    public Pegawai $pegawai;

    public function mount(Pegawai $pegawai)
    {
        $this->pegawai = $pegawai;
        $this->nip = $pegawai->nip;
        $this->nama = $pegawai->nama;
        $this->unitkerja_id = $pegawai->unitkerja_id;
    }

    public function save()
    {
        $this->validate();
        $this->pegawai->update([
            'nip' => $this->nip,
            'nama' => $this->nama,
            'unitkerja_id' => $this->unitkerja_id,
        ]);
        session()->flash('message', 'Pegawai berhasil diperbarui.');
        return $this->redirectRoute('pegawai.index');
    }

    public function render()
    {
        return view('livewire.pegawai.edit-pegawai', [
            'unitkerjas' => UnitKerja::all(),
        ]);
    }
}
