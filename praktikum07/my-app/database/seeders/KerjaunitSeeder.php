<?php

namespace Database\Seeders;

use App\Models\kerjaunit;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class KerjaunitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        kerjaunit::create([
            "kode" => "A123",
            "nama" => "LPPM"
        ]);
    }
}
