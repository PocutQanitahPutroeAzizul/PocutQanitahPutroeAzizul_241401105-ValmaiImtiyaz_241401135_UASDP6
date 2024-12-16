program TiketPesawat;
uses crt;

const
    KelasEkonomi = 'Ekonomi'; 
    KelasBisnis = 'Bisnis';   
    KelasFirstClass = 'First Class'; 

type
    datatiket = record 
        nama, tujuan, flight, gate, from: string; 
        harga: real; 
        kelas: string;
    end;

var
    tiket: array[1..100] of datatiket; 
    jumlahTiket: integer; 

procedure menentukanflightdangate(var t: datatiket);
begin
    t.from := 'Medan'; // semua penerbangan dari Medan
    case t.tujuan of // untuk menentukan flight, gate, dan harga berdasarkan tujuan
        'Jakarta': begin t.flight := 'GA101'; t.gate := 'A1'; t.harga := 1500000; end; // harga belom termasuk kelas
        'Bandung': begin t.flight := 'GA102'; t.gate := 'A2'; t.harga := 1600000; end; // harga belom termasuk kelas
        'Bali':    begin t.flight := 'GA103'; t.gate := 'B1'; t.harga := 2000000; end; // harga belom termasuk kelas
        'Malang':  begin t.flight := 'GA104'; t.gate := 'B2'; t.harga := 1800000; end; // harga belom termasuk kelas
        'Papua':   begin t.flight := 'GA105'; t.gate := 'C1'; t.harga := 3000000; end; // harga belom termasuk kelas
        'Padang':  begin t.flight := 'GA106'; t.gate := 'C2'; t.harga := 1000000; end; // harga belom termasuk kelas
    else
        t.flight := 'N/A'; t.gate := 'N/A'; t.harga := 0; // jika tujuan tidak valid
    end;
end;

procedure InputTiket(var jumlah: integer);
var
    i, kelasInput: integer; 
begin
    write('Masukkan jumlah tiket yang ingin dibeli : '); 
    readln(jumlah); 
    
    if (jumlah < 1) or (jumlah > 100) then 
    begin
        writeln('Jumlah tiket tidak valid.'); 
        exit; 
    end;

    for i := 1 to jumlah do 
    begin
        writeln('Tiket ke-', i); 
        write('Nama Penumpang: '); readln(tiket[i].nama); 
        write('Tujuan (Jakarta, Bandung, Bali, Malang, Papua, Padang): '); readln(tiket[i].tujuan); 
        
        menentukanflightdangate(tiket[i]); // memanggil prosedur untuk menentukan flight, gate, dan harga berdasarkan tujuan
        
        writeln('Pilih kelas tiket: '); 
        writeln('1. Ekonomi'); 
        writeln('2. Bisnis'); 
        writeln('3. First Class'); 
        write('Pilihan Anda (1-3): '); readln(kelasInput); 
        
        case kelasInput of // mengatur kelas tiket berdasarkan input
            1: tiket[i].kelas := KelasEkonomi; // jika input 1, ke kelas Ekonomi
            2: tiket[i].kelas := KelasBisnis; // jika input 2, ke kelas Bisnis
            3: tiket[i].kelas := KelasFirstClass; // jika input 3, ke First Class
        else
            writeln('Input tidak valid. Kelas tiket akan diatur ke Ekonomi.'); 
            kelasInput := 1;
            tiket[i].kelas := kelasekonomi; // kalo inputan 0 atau lebih dari 3 harganya di set ke kelas ekonomi
        end;

        tiket[i].harga := tiket[i].harga * (1 + (0.5 * (kelasInput - 1))); // 50% lebih mahal untuk bisnis, 100% untuk first class
        writeln; 
    end;
end;

procedure TampilkanTiket(jumlah: integer);
var
    i: integer; 
    kelasStr: string; 
begin
    for i := 1 to jumlah do 
    begin
        kelasStr := tiket[i].kelas; // mengambil nilai kelas dari tiket

        writeln('==================== PEDEDEINK ===================='); 
        writeln('Nama Penumpang: ', tiket[i].nama); 
        writeln('From: ', tiket[i].from); 
        writeln('To: ', tiket[i].tujuan); 
        writeln('Flight: ', tiket[i].flight); 
        writeln('Gate: ', tiket[i].gate);
        writeln('Kelas: ', kelasStr); 
        writeln('Harga: Rp ', tiket[i].harga:0:2); 
        writeln('========================================================'); 
        writeln;
    end; 
end;

begin
    clrscr; 
    jumlahTiket := 0; 
    InputTiket(jumlahTiket); //memanggil subprogram prosedur InputTiket , mengoper variabel jumlahTiket
    TampilkanTiket(jumlahTiket); // memanggil subrpogram prosedur TampilkanTiket dengan jumlahTiket yang telah diisi
    readln; 
end.