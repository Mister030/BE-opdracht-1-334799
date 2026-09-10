<?php
// patch-3.1.php - voegt het Rolename-veld toe aan het Breeze-registratieformulier
// en de bijbehorende controller (opdracht 3.1, Backend Leerjaar 2).
// Wordt aangeroepen door setup-3.1-breeze.sh, ná php artisan breeze:install.

function patchFile(string $path, string $anchor, ?string $insertBefore = null, ?string $insertAfter = null): void
{
    if (!file_exists($path)) {
        fwrite(STDERR, "FOUT: bestand niet gevonden: $path (is breeze:install wel gelukt?)\n");
        exit(1);
    }
    $content = file_get_contents($path);
    $count = substr_count($content, $anchor);
    if ($count !== 1) {
        fwrite(STDERR, "WAARSCHUWING: anker niet precies 1x gevonden in $path ($count keer) - dit bestand moet je handmatig aanpassen (zie Claude Kennisbank sessienotitie voor de exacte code).\n");
        exit(1);
    }
    if ($insertBefore !== null) {
        $content = str_replace($anchor, $insertBefore . $anchor, $content);
    } else {
        $content = str_replace($anchor, $anchor . $insertAfter, $content);
    }
    file_put_contents($path, $content);
    echo "OK: $path aangepast\n";
}

// 1) register.blade.php: Rolename-veld toevoegen vlak voor de "Already registered?" regel
//    (anker inclusief de 8 spaties inspringing, zodat de opmaak netjes blijft)
$rolenameBlock = <<<'BLADE'
        <!-- Confirm Rolename -->
        <div class="mt-4">
            <x-input-label for="rolename" :value="__('Rolename')" />

            <x-text-input id="rolename" class="block mt-1 w-full"
                            type="text"
                            name="rolename" required autocomplete="rolename" />

            <x-input-error :messages="$errors->get('rolename')" class="mt-2" />
        </div>


BLADE;

patchFile(
    'resources/views/auth/register.blade.php',
    '        <div class="flex items-center justify-end mt-4">',
    insertBefore: $rolenameBlock
);

// 2) RegisteredUserController.php: rolename toevoegen aan de validatie
patchFile(
    'app/Http/Controllers/Auth/RegisteredUserController.php',
    "Rules\Password::defaults()],\n",
    insertAfter: "            'rolename' => ['required', 'string', 'max:20'],\n"
);

// 3) RegisteredUserController.php: rolename opslaan bij het aanmaken van de user
patchFile(
    'app/Http/Controllers/Auth/RegisteredUserController.php',
    "'password' => Hash::make(\$request->password),\n",
    insertAfter: "            'rolename' => \$request->rolename,\n"
);

echo "Klaar - controleer resources/views/auth/register.blade.php en app/Http/Controllers/Auth/RegisteredUserController.php.\n";
