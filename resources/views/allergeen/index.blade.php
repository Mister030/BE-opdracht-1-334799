<x-app-layout>
    @if (count($allergenen) === 0)
        {{-- Scenario_02: na 4 seconden terug naar Overzicht Magazijn Jamin. --}}
        @push('head')
            <meta http-equiv="refresh" content="4;url={{ route('magazijn.index') }}">
        @endpush
    @endif

    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Overzicht Allergenen') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">

                    <dl class="mb-6 space-y-1">
                        <div><span class="font-semibold">Naam:</span> {{ $product->Naam }}</div>
                        <div><span class="font-semibold">Barcode:</span> {{ $product->Barcode }}</div>
                    </dl>

                    <table class="min-w-full border border-gray-300 text-sm">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="border border-gray-300 px-4 py-2 text-left">Naam</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Omschrijving</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($allergenen as $allergeen)
                                <tr>
                                    <td class="border border-gray-300 px-4 py-2">{{ $allergeen->Naam }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ $allergeen->Omschrijving }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td class="border border-gray-300 px-4 py-2" colspan="2">
                                        In dit product zitten geen stoffen die een allergische reactie kunnen veroorzaken
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    @if (count($allergenen) === 0)
                        <p class="mt-4 text-sm text-gray-600">
                            U wordt over 4 seconden teruggestuurd naar Overzicht Magazijn Jamin.
                        </p>
                    @endif

                </div>
            </div>
        </div>
    </div>
</x-app-layout>
