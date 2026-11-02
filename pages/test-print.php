
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Test Printer MT200</title>
</head>
<body>
    <h3>Test Printer MT200 Bluetooth</h3>

    <button id="connect">Hubungkan Printer</button>
    <button id="print" disabled>Test Cetak</button>

    <p id="status">Printer belum terhubung.</p>

    <script>
    let port;
    let writer;

    document.getElementById('connect').onclick = async () => {
        try {
            if (!('serial' in navigator)) {
                throw new Error(
                    'Web Serial tidak didukung browser ini.'
                );
            }

            port = await navigator.serial.requestPort();

            // Baud rate umum untuk koneksi serial.
            // Sesuaikan dengan dokumentasi printer.
            await port.open({ baudRate: 9600 });

            writer = port.writable.getWriter();

            document.getElementById('status').textContent =
                'Port terbuka. Siap menguji cetak.';

            document.getElementById('print').disabled = false;
        } catch (e) {
            document.getElementById('status').textContent =
                'Gagal: ' + e.message;
        }
    };

    document.getElementById('print').onclick = async () => {
        try {
            const encoder = new TextEncoder();

            const data = encoder.encode(
                '\x1B\x40' +
                'TEST PRINTER MT200\n' +
                'JOB ORDER: TEST-001\n' +
                'LOT: 1\n' +
                'SIZE: M\n' +
                'PLAN: 100\n\n\n'
            );

            await writer.write(data);

            document.getElementById('status').textContent =
                'Data uji telah dikirim ke port.';
        } catch (e) {
            document.getElementById('status').textContent =
                'Gagal mencetak: ' + e.message;
        }
    };
    </script>
</body>
</html>
