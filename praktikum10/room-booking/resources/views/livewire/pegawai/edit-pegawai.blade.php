<div class="container mx-auto">
    <h1 class="text-2xl font-bold mb-4">Edit Pegawai</h1>
    <form wire:submit.prevent="save" class="space-y-4">
        <flux:input
            type="text"
            id="nip"
            wire:model.defer="nip"
            label="NIP Pegawai"
            placeholder="Masukkan NIP Pegawai"
            required
        />

        <flux:input
            type="text"
            id="nama"
            wire:model.defer="nama"
            label="Nama Pegawai"
            placeholder="Masukkan Nama Pegawai"
            required
        />

        <flux:select
            id="unitkerja_id"
            wire:model.defer="unitkerja_id"
            label="Unit Kerja"
            required
        >
            <flux:select.option value="" label="-- Pilih Unit Kerja --" />
            @foreach ($unitkerjas as $unitkerja)
                <flux:select.option value="{{ $unitkerja->id }}" label="{{ $unitkerja->nama }}" />
            @endforeach
        </flux:select>

        <flux:button
            type="submit"
            variant="primary"
        >
            Save
        </flux:button>
    </form>
</div>

