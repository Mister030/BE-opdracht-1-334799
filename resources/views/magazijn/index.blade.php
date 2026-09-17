<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Overzicht Magazijn Jamin') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">

                    <table class="min-w-full border border-gray-300 text-sm">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="border border-gray-300 px-4 py-2 text-left">Barcode</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Naam</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Verpakkingseenheid</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Aantalaanwezig</th>
                                <th class="border border-gray-300 px-4 py-2 text-center">Allergenen Info</th>
                                <th class="border border-gray-300 px-4 py-2 text-center">Leverantie Info</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($producten as $product)
                                <tr>
                                    <td class="border border-gray-300 px-4 py-2">{{ $product->Barcode }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ $product->Naam }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ $product->VerpakkingsEenheid }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ $product->AantalAanwezig }}</td>
                                    <td class="border border-gray-300 px-4 py-2 text-center">
                                        <span class="text-red-600 font-bold text-lg">&#10007;</span>
                                    </td>
                                    <td class="border border-gray-300 px-4 py-2 text-center">
                                        <a href="{{ route('levering.show', $product->ProductId) }}"
                                           title="Leveringsinformatie van {{ $product->Naam }}"
                                           class="text-blue-600 font-bold text-lg">?</a>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td class="border border-gray-300 px-4 py-2" colspan="6">
                                        Er zijn op dit moment geen producten aanwezig in het magazijn.
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</x-app-layout>
