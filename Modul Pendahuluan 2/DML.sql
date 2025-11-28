-- 7. Update jadwal penerbangan FL0001
UPDATE Penerbangan
SET Waktu_Keberangkatan = '2024-12-15 11:00:00',
    Waktu_Sampai = '2024-12-15 13:30:00'
WHERE ID_Penerbangan = 'FL0001';

-- 8. Update nomor telepon Siti Aminah
UPDATE Penumpang
SET No_Telepon = '081223344556'
WHERE NIK = '3302134567890123';

-- 9. Update status pesawat PKGHI3 menjadi "Aktif"
UPDATE Pesawat
SET Status_Pesawat = 'Aktif'
WHERE ID_Pesawat = 'PKGHI3';

-- 10. Hapus tiket milik Li Wei (penerbangan FL0004)
DELETE FROM Tiket
WHERE NIK_Penumpang = '3504156789012345'
  AND ID_Penerbangan = 'FL0004';

-- 11. Hapus data bagasi ID 2
DELETE FROM Bagasi
WHERE ID_Bagasi = 2;

-- 12. Hapus penerbangan dengan status "Ditunda"
DELETE FROM Penerbangan
WHERE Status_Penerbangan = 'Ditunda';