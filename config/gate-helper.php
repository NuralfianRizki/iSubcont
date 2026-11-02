
<?php
// 1. GATE LABEL
$gate_label = [
    'PRE_SETTING'       => 'Setting',
    'IN_SM_SUBCONT'     => 'In SM Subcont',
    'READY_TO_WH'       => 'Komponen Siap Kirim',
    'OUT_SM_SUBCONT'    => 'SM → WH',
    'IN_WH_SUBCONT'     => 'WH Incoming',
    'OUT_WH_SUBCONT'    => 'WH → Vendor',
    'IN_VENDOR'         => 'Vendor Incoming',
    'OUT_VENDOR'        => 'Vendor → WH',
    'IN_WH_FROM_VENDOR' => 'WH Return',
    'IN_QC'             => 'Check QC',
    'OUT_WH_TO_SM'      => 'WH → SM',
    'IN_SM_FROM_WH'     => 'SM Return',
    'OUT_SM_TO_PROD'    => 'SM → Production',
];

// 2. MAPPING CURRENT GATE -> NEXT GATE
$next_gate_map = [
    'PRE_SETTING'       => 'IN_SM_SUBCONT',
    'IN_SM_SUBCONT'     => 'READY_TO_WH',
    'READY_TO_WH'       => 'OUT_SM_SUBCONT',
    'OUT_SM_SUBCONT'    => 'IN_WH_SUBCONT',
    'IN_WH_SUBCONT'     => 'OUT_WH_SUBCONT',
    'OUT_WH_SUBCONT'    => 'IN_VENDOR',
    'IN_VENDOR'         => 'OUT_VENDOR',
    'OUT_VENDOR'        => 'IN_WH_FROM_VENDOR',
    'IN_WH_FROM_VENDOR' => 'IN_QC',
    'IN_QC'             => 'OUT_WH_TO_SM',
    'OUT_WH_TO_SM'      => 'IN_SM_FROM_WH',
    'IN_SM_FROM_WH'     => 'OUT_SM_TO_PROD',
];

// 3. MAPPING GATE -> KOLOM QUANTITY
$gate_qty_column = [
    'PRE_SETTING'       => 'qty_pre_setting',
    'IN_SM_SUBCONT'     => 'qty_sm_subcont',

    // READY_TO_WH adalah gate logis.
    'READY_TO_WH'       => null,

    'OUT_SM_SUBCONT'    => 'qty_send_to_wh',
    'IN_WH_SUBCONT'     => 'qty_wh_from_sm',
    'OUT_WH_SUBCONT'    => 'qty_send_to_vendor',
    'IN_VENDOR'         => 'qty_vendor_from_wh',
    'OUT_VENDOR'        => 'qty_vendor_send_wh',
    'IN_WH_FROM_VENDOR' => 'qty_wh_from_vendor',
    'IN_QC'             => 'qty_qc',
    'OUT_WH_TO_SM'      => 'qty_wh_send_sm',
    'IN_SM_FROM_WH'     => 'qty_sm_from_wh',
    'OUT_SM_TO_PROD'    => 'qty_sm_send_prod',
];

// 4. HELPER: MENDAPATKAN LABEL GATE
if (!function_exists('getGateLabel')) {
    function getGateLabel(?string $gate): string
    {
        global $gate_label;

        if ($gate === null || trim($gate) === '') {
            return 'Belum ada gate';
        }

        return $gate_label[$gate] ?? $gate;
    }
}

// 5. HELPER: MENDAPATKAN NEXT GATE
if (!function_exists('getNextGate')) {
    function getNextGate(?string $currentGate): ?string
    {
        global $next_gate_map;

        if ($currentGate === null || trim($currentGate) === '') {
            return null;
        }

        return $next_gate_map[$currentGate] ?? null;
    }
}

// 6. HELPER: MENDAPATKAN KOLOM QUANTITY
if (!function_exists('getGateQtyColumn')) {
    function getGateQtyColumn(?string $gate): ?string
    {
        global $gate_qty_column;

        if ($gate === null || trim($gate) === '') {
            return null;
        }

        return $gate_qty_column[$gate] ?? null;
    }
}

// 7. HELPER: VALIDASI URUTAN GATE
if (!function_exists('validateGateSequence')) {
    function validateGateSequence(
        ?string $currentGate,
        string $expectedGate
    ): bool {
        return $currentGate === $expectedGate;
    }
}

// 8. HELPER: MENDAPATKAN PESAN GATE SELANJUTNYA
if (!function_exists('getNextGateLabel')) {
    function getNextGateLabel(?string $currentGate): string
    {
        $nextGate = getNextGate($currentGate);

        if ($nextGate === null) {
            return 'Tidak ada gate berikutnya';
        }

        return getGateLabel($nextGate);
    }
}
