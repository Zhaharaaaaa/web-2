<?php

namespace App\Http\Controllers;


use App\Models\kerjaunit;
use Illuminate\Http\Request;

class KerjaunitController extends Controller
{
    public function index()
    {
        $kerjaunit = kerjaunit::all();
        return view("kerja-unit.index", compact("kerjaunit"));
    }
}
