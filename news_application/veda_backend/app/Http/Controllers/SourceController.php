<?php

namespace App\Http\Controllers;

use App\Models\Source;
use Illuminate\Http\Request;

class SourceController extends Controller
{
    public function index(){
        $companies=Source::all();
        return $companies;
    }
}
