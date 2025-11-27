<?php

namespace App\Filament\Resources\Inventories\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class InventoryForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('kode_barang')
                    ->required(),
                TextInput::make('nama_barang')
                    ->required(),
                TextInput::make('kategori'),
                TextInput::make('merek'),
                TextInput::make('spesifikasi'),
                TextInput::make('stok')
                    ->required()
                    ->numeric()
                    ->default(0),
                TextInput::make('lokasi'),
                Select::make('kondisi')
                    ->options(['baru' => 'Baru', 'bekas' => 'Bekas', 'rusak' => 'Rusak'])
                    ->default('baru')
                    ->required(),
                TextInput::make('status')
                    ->required()
                    ->default('tersedia'),
            ]);
    }
}
