<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Het createscript is MySQL-specifiek. Bij het testen draait Laravel op
        // sqlite in-memory, daar wordt deze migratie overgeslagen.
        if (DB::connection()->getDriverName() !== 'mysql') {
            return;
        }

        DB::unprepared(file_get_contents(database_path('migrations/create_script_jamin_1.sql')));

        // Het script doet `USE Jamin`, waardoor de actieve database wijzigt.
        // Terugzetten zodat Laravel de migrations-tabel weer kan vinden.
        DB::unprepared('USE `' . config('database.connections.' . DB::getDefaultConnection() . '.database') . '`');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (DB::connection()->getDriverName() !== 'mysql') {
            return;
        }

        // Het createscript maakt een eigen database `Jamin`, dus daar moeten de
        // DROP TABLE-statements ook op uitgevoerd worden.
        DB::unprepared('USE `Jamin`');

        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        DB::statement('DROP TABLE IF EXISTS ProductPerAllergeen');
        DB::statement('DROP TABLE IF EXISTS ProductPerLeverancier');
        DB::statement('DROP TABLE IF EXISTS Magazijn');
        DB::statement('DROP TABLE IF EXISTS Leverancier');
        DB::statement('DROP TABLE IF EXISTS Product');
        DB::statement('DROP TABLE IF EXISTS Allergeen');

        DB::statement('SET FOREIGN_KEY_CHECKS=1');

        // Terug naar de database van Laravel zelf, anders kan de migrations-tabel
        // niet bijgewerkt worden.
        DB::unprepared('USE `' . config('database.connections.' . DB::getDefaultConnection() . '.database') . '`');
    }
};
