<?php

namespace Tests\Feature\Jamin;

use App\Models\User;
use Tests\TestCase;

/**
 * Controle op het scherm Overzicht Magazijn Jamin.
 *
 * Deze test draait tegen de echte MySQL-database Jamin, omdat de tabellen
 * daar met het createscript zijn aangemaakt en niet met migrations.
 */
class MagazijnOverzichtTest extends TestCase
{
    protected function setUp(): void
    {
        parent::setUp();

        config([
            'database.default'                       => 'mysql',
            'database.connections.mysql.database'    => 'Jamin',
        ]);
    }

    public function test_overzicht_toont_producten_gesorteerd_op_barcode(): void
    {
        $gebruiker = User::where('rolename', 'magazijnmedewerker')->firstOrFail();

        $response = $this->actingAs($gebruiker)->get('/magazijn');

        $response->assertOk();
        $response->assertSee('Overzicht Magazijn Jamin');
        $response->assertSee('Mintnopjes');
        $response->assertSee('Winegums');

        // Barcode oplopend: 8719587231278 (Mintnopjes) staat vooraan,
        // 8719587328256 (Witte Muizen) achteraan.
        $inhoud = $response->getContent();
        $this->assertLessThan(
            strpos($inhoud, '8719587328256'),
            strpos($inhoud, '8719587231278'),
            'De producten staan niet oplopend gesorteerd op Barcode.'
        );
    }

    public function test_overzicht_is_afgeschermd_voor_gasten(): void
    {
        $this->get('/magazijn')->assertRedirect('/login');
    }
}
