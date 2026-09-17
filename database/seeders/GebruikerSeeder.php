<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class GebruikerSeeder extends Seeder
{
    /**
     * Maak de drie gebruikersrollen van Jamin aan.
     *
     * Het createscript doet DROP DATABASE Jamin, waardoor ook de users-tabel
     * leeg is. Met deze seeder staan de testaccounts er daarna meteen weer in.
     */
    public function run(): void
    {
        $gebruikers = [
            ['name' => 'Magazijnmedewerker', 'email' => 'magazijnmedewerker@jamin.nl', 'rolename' => 'magazijnmedewerker'],
            ['name' => 'Inkoper',            'email' => 'inkoper@jamin.nl',            'rolename' => 'inkoper'],
            ['name' => 'Magazijnbeheerder',  'email' => 'magazijnbeheerder@jamin.nl',  'rolename' => 'magazijnbeheerder'],
        ];

        foreach ($gebruikers as $gebruiker) {
            User::updateOrCreate(
                ['email' => $gebruiker['email']],
                [
                    'name'     => $gebruiker['name'],
                    'rolename' => $gebruiker['rolename'],
                    'password' => Hash::make('password'),
                ]
            );
        }
    }
}
