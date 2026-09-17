<?php

namespace App\Http\Controllers;

use App\Models\MagazijnModel;

/**
 * Controller voor het scherm Overzicht Magazijn Jamin.
 */
class MagazijnController extends Controller
{
    /**
     * Toon alle producten die in het magazijn aanwezig zijn.
     */
    public function index()
    {
        $magazijnModel = new MagazijnModel();
        $producten     = $magazijnModel->getMagazijnOverzicht();

        return view('magazijn.index', [
            'producten' => $producten,
        ]);
    }
}
