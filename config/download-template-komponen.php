
<?php

require_once __DIR__ . '/../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Cell\DataValidation;

// ==========================================
// CREATE SPREADSHEET
// ==========================================

$spreadsheet = new Spreadsheet();


// ==========================================
// SHEET 1: IMPORT_KOMPONEN
// ==========================================

$sheet = $spreadsheet->getActiveSheet();
$sheet->setTitle('IMPORT_KOMPONEN');

// Header
$headers = [
    'Model',
    'Style',
    'Main Component',
    'Input Component',
    'Output Component',
    'Vendor Code'
];

$sheet->fromArray($headers, null, 'A1');

// Header styling
$sheet->getStyle('A1:F1')->applyFromArray([
    'font' => [
        'bold' => true,
        'color' => ['rgb' => 'FFFFFF'],
        'size' => 11
    ],
    'fill' => [
        'fillType' => Fill::FILL_SOLID,
        'startColor' => ['rgb' => '198754']
    ],
    'alignment' => [
        'horizontal' => Alignment::HORIZONTAL_CENTER,
        'vertical' => Alignment::VERTICAL_CENTER
    ],
    'borders' => [
        'allBorders' => [
            'borderStyle' => Border::BORDER_THIN,
            'color' => ['rgb' => 'D9E2F3']
        ]
    ]
]);

$sheet->getRowDimension(1)->setRowHeight(25);

// Column widths
$widths = [
    'A' => 25,
    'B' => 20,
    'C' => 25,
    'D' => 30,
    'E' => 30,
    'F' => 20
];

foreach ($widths as $column => $width) {
    $sheet->getColumnDimension($column)->setWidth($width);
}

// Prepare blank rows
$lastRow = 201;

$sheet->getStyle("A2:F{$lastRow}")->applyFromArray([
    'alignment' => [
        'vertical' => Alignment::VERTICAL_CENTER
    ],
    'borders' => [
        'bottom' => [
            'borderStyle' => Border::BORDER_HAIR,
            'color' => ['rgb' => 'D9D9D9']
        ]
    ]
]);

// Freeze header
$sheet->freezePane('A2');

// Enable filter
$sheet->setAutoFilter("A1:F{$lastRow}");


// ==========================================
// SHEET 2: CONTOH_DATA
// ==========================================

$exampleSheet = $spreadsheet->createSheet();
$exampleSheet->setTitle('CONTOH_DATA');

$exampleData = [
    [
        'Model',
        'Style',
        'Main Component',
        'Input Component',
        'Output Component',
        'Vendor Code'
    ],
    ['ITEM A', 'STYLE 001', 'UPPER', 'UPPER', 'UPPER ASSY', 'V001'],
    ['ITEM A', 'STYLE 001', 'UPPER', 'UPPER MESH', 'UPPER ASSY', 'V002'],
    ['ITEM A', 'STYLE 001', 'UPPER', 'UPPER LINING', 'UPPER ASSY', 'V003'],
    ['ITEM A', 'STYLE 001', 'BOTTOM', 'BOTTOM', 'BOTTOM ASSY', 'V001'],
    ['ITEM A', 'STYLE 001', 'BOTTOM', 'OUTSOLE', 'BOTTOM ASSY', 'V004'],
    ['ITEM A', 'STYLE 002', 'UPPER', 'UPPER', 'UPPER ASSY', 'V001'],
    ['ITEM A', 'STYLE 002', 'UPPER', 'UPPER MESH', 'UPPER ASSY', 'V002'],
    ['ITEM A', 'STYLE 002', 'BOTTOM', 'BOTTOM', 'BOTTOM ASSY', 'V001'],
    ['ITEM A', 'STYLE 002', 'BOTTOM', 'OUTSOLE', 'BOTTOM ASSY', 'V004']
];

$exampleSheet->fromArray($exampleData, null, 'A1');

$exampleSheet->getStyle('A1:F1')->applyFromArray([
    'font' => [
        'bold' => true,
        'color' => ['rgb' => 'FFFFFF']
    ],
    'fill' => [
        'fillType' => Fill::FILL_SOLID,
        'startColor' => ['rgb' => '198754']
    ],
    'alignment' => [
        'horizontal' => Alignment::HORIZONTAL_CENTER,
        'vertical' => Alignment::VERTICAL_CENTER
    ]
]);

foreach ($widths as $column => $width) {
    $exampleSheet->getColumnDimension($column)->setWidth($width);
}

$exampleSheet->freezePane('A2');
$exampleSheet->setAutoFilter('A1:F10');

$exampleSheet->getStyle('A2:F10')->applyFromArray([
    'alignment' => [
        'vertical' => Alignment::VERTICAL_CENTER
    ],
    'borders' => [
        'allBorders' => [
            'borderStyle' => Border::BORDER_THIN,
            'color' => ['rgb' => 'E0E0E0']
        ]
    ]
]);


// ==========================================
// SHEET 3: PETUNJUK
// ==========================================

$guideSheet = $spreadsheet->createSheet();
$guideSheet->setTitle('PETUNJUK');

$instructions = [
    ['PETUNJUK IMPORT MASTER KOMPONEN'],
    [''],
    ['1. Gunakan sheet IMPORT_KOMPONEN untuk mengisi data.'],
    ['2. Setiap Style harus ditulis secara eksplisit pada setiap baris.'],
    ['3. Satu baris mewakili satu relasi Input Component ke Output Component.'],
    ['4. Main Component harus sama dengan salah satu Input Component dalam grupnya.'],
    ['5. Output Component harus konsisten dalam satu grup Model + Style + Main Component.'],
    ['6. Vendor Code wajib diisi pada setiap baris.'],
    ['7. Vendor Code harus sesuai dengan vendor aktif yang terdaftar di sistem.'],
    ['8. Input Component tidak boleh duplikat dalam grup yang sama.'],
    ['9. Model + Style yang sudah terdaftar tidak dapat diimport ulang.'],
    ['10. Apabila terdapat kesalahan validasi, proses import tidak akan menyimpan data.'],
    [''],
    ['CONTOH PENGELOMPOKAN'],
    ['Model + Style + Main Component = satu grup komponen.'],
    ['Jika satu Style memiliki UPPER dan BOTTOM sebagai Main Component,'],
    ['maka keduanya ditulis sebagai grup yang berbeda.'],
    [''],
    ['CATATAN'],
    ['Sheet CONTOH_DATA hanya digunakan sebagai referensi pengisian.'],
    ['Jangan mengubah nama header pada sheet IMPORT_KOMPONEN.']
];

$guideSheet->fromArray($instructions, null, 'A1');

$guideSheet->mergeCells('A1:F1');

$guideSheet->getStyle('A1:F1')->applyFromArray([
    'font' => [
        'bold' => true,
        'size' => 14,
        'color' => ['rgb' => 'FFFFFF']
    ],
    'fill' => [
        'fillType' => Fill::FILL_SOLID,
        'startColor' => ['rgb' => '198754']
    ],
    'alignment' => [
        'vertical' => Alignment::VERTICAL_CENTER
    ]
]);

$guideSheet->getRowDimension(1)->setRowHeight(30);
$guideSheet->getColumnDimension('A')->setWidth(110);

$guideSheet->getStyle('A3:A21')->getAlignment()
    ->setWrapText(true)
    ->setVertical(Alignment::VERTICAL_CENTER);


// ==========================================
// SET ACTIVE SHEET
// ==========================================

$spreadsheet->setActiveSheetIndex(0);


// ==========================================
// DOWNLOAD EXCEL
// ==========================================

$filename = 'Template_Master_Komponen.xlsx';

// Pastikan tidak ada output yang mengganggu file Excel
while (ob_get_level() > 0) {
    ob_end_clean();
}

// Pastikan header belum pernah dikirim
if (headers_sent($file, $line)) {
    die("Header already sent at {$file}:{$line}");
}

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="' . $filename . '"');
header('Cache-Control: max-age=0');
header('Pragma: public');

$writer = new Xlsx($spreadsheet);
$writer->save('php://output');

$spreadsheet->disconnectWorksheets();
exit;
