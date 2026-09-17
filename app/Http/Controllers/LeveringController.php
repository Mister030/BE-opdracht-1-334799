<?php

namespace App\Http\Controllers;

use App\Models\LeveringModel;

/**
 * Controller voor user story 01: Inzien leveringsinformatie product.
 */
class LeveringController extends Controller
{
    /**
     * Toon het detailscherm Levering Informatie van een product.
     *
     * Scenario_01: het product is voorradig, de leveringen worden getoond.
     * Scenario_02: het product is niet voorradig, er volgt een melding en
     *              na 4 seconden een doorverwijzing naar Overzicht Magazijn.
     */
    public function show(int $productId)
    {
        $leveringModel = new LeveringModel();

        $product = $leveringModel->getProductMetVoorraad($productId);

        if ($product === null) {
            abort(404);
        }

        $isVoorradig = $product->AantalAanwezig !== null && (int) $product->AantalAanwezig > 0;

        return view('levering.index', [
            'product'                => $product,
            'isVoorradig'            => $isVoorradig,
            'leverancier'            => $isVoorradig ? $leveringModel->getLeverancierByProductId($productId) : null,
            'leveringen'             => $isVoorradig ? $leveringModel->getLeveringenByProductId($productId) : [],
            'eerstVolgendeLevering'  => $isVoorradig ? null : $leveringModel->getEerstVolgendeLeveringByProductId($productId),
        ]);
    }
}
