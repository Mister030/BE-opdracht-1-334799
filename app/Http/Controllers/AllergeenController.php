<?php

namespace App\Http\Controllers;

use App\Models\AllergeenModel;

/**
 * Controller voor user story 02: Inzien allergeneninformatie van product.
 */
class AllergeenController extends Controller
{
    /**
     * Toon het detailscherm Overzicht Allergenen van een product.
     *
     * Scenario_01: het product bevat allergenen, deze worden getoond.
     * Scenario_02: het product bevat geen allergenen, er volgt een melding
     *              en na 4 seconden een doorverwijzing naar Overzicht Magazijn.
     */
    public function show(int $productId)
    {
        $allergeenModel = new AllergeenModel();

        $product = $allergeenModel->getProductById($productId);

        if ($product === null) {
            abort(404);
        }

        $allergenen = $allergeenModel->getAllergenenByProductId($productId);

        return view('allergeen.index', [
            'product'    => $product,
            'allergenen' => $allergenen,
        ]);
    }
}
