rule Win32_Ransomware_CryptoJoker : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "CRYPTOJOKER"
        description         = "Yara rule that detects CryptoJoker ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "CryptoJoker"
        tc_detection_factor = 5

    strings:
        
        $call_encrypt = {
            2B 02 26 16 FE 09 00 00 FE 09 01 00 FE 09 02 00 6F ?? ?? ?? ?? 2A
        }
    
        $encrypt_files = {
            2B 02 26 16 20 04 ?? ?? ?? 28 ?? ?? ?? ?? 39 ?? ?? ?? ?? 26 20 00 04 ?? ?? 73 ?? ?? ?? ?? 0C 20 05 ?? ?? ??
            16 39 ?? ?? ?? ?? 26 28 ?? ?? ?? ?? 02 28 ?? ?? ?? ?? 0B 38 ?? ?? ?? ?? 20 04 ?? ?? ?? FE ?? ?? ?? FE ?? ?? 
            ?? 45 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 38 ?? ?? ?? ?? 26
            20 03 ?? ?? ?? 16 39 ?? ?? ?? ?? 26 00 20 ?? ?? ?? ?? 28 ?? ?? ?? ?? 0A 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 39 ??
            ?? ?? ?? 26 20 00 ?? ?? ?? 38 ?? ?? ?? ?? 00 00 08 06 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 3A ?? ??
            ?? ?? 26 20 03 ?? ?? ?? 38 ?? ?? ?? ?? 09 28 ?? ?? ?? ?? 13 04 20 04 ?? ?? ?? 28 ?? ?? ?? ?? 3A ?? ?? ?? ??
            26 00 08 07 17 28 ?? ?? ?? ?? 0D 38 ?? ?? ?? ?? 20 03 ?? ?? ?? FE ?? ?? ?? FE ?? ?? ?? 45 ?? ?? ?? ?? ?? ??
            ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 38 ?? ?? ?? ?? 26 20 02 ?? ?? ?? 38 ?? ?? ?? ?? 11 04
            13 05 DD ?? ?? ?? ?? 00 08 16 28 ?? ?? ?? ?? 00 00 DC 08 14 FE 01 13 06 11 06 3A ?? ?? ?? ?? 08 28 ?? ?? ??
            ?? 00 DC 00 11 05 2A
        }

        $start_process = {
            2B ?? 26 16 20 10 ?? ?? ?? 38 ?? ?? ?? ?? 20 ?? ?? ?? ?? 28 ?? ?? ?? ?? 0B 20 ?? ?? ?? ??
            38 ?? ?? ?? ?? 00 11 05 17 28 ?? ?? ?? ?? 20 06 ?? ?? ?? 38 ?? ?? ?? ?? 00 28 ?? ?? ?? ??
            0A 20 09 ?? ?? ?? 38 ?? ?? ?? ?? 00 11 05 08 28 ?? ?? ?? ?? 20 12 ?? ?? ?? 38 ?? ?? ?? ??
            11 06 17 20 ?? ?? ?? ?? 28 ?? ?? ?? ?? A2 20 ?? ?? ?? ?? 28 ?? ?? ?? ?? 3A ?? ?? ?? ?? 38 
            ?? ?? ?? ?? 11 05 17 28 ?? ?? ?? ?? 20 ?? ?? ?? ?? 38 ?? ?? ?? ?? 11 06 19 20 ?? ?? ?? ??
            28 ?? ?? ?? ?? A2 20 0F ?? ?? ?? 38 ?? ?? ?? ?? 1A 8D ?? ?? ?? ?? 13 06 20 02 ?? ?? ?? 38
            ?? ?? ?? ?? 00 11 04 28 ?? ?? ?? ?? 26 20 13 ?? ?? ?? 38 ?? ?? ?? ?? 08 09 28 ?? ?? ?? ??
            20 07 ?? ?? ?? 38 ?? ?? ?? ?? 73 ?? ?? ?? ?? 13 05 38 ?? ?? ?? ?? 26 20 0D ?? ?? ?? 38 ??
            ?? ?? ?? 11 06 0D 38 ?? ?? ?? ?? 20 10 ?? ?? ?? FE ?? ?? ?? FE ?? ?? ?? 45 ?? ?? ?? ?? ?? 
            ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ??
            ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ??
            ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 20 08 ?? ?? ?? 17 3A ?? ?? ?? ??
            26 11 06 18 20 ?? ?? ?? ?? 28 ?? ?? ?? ?? A2 20 00 ?? ?? ?? 28 ?? ?? ?? ?? 39 ?? ?? ?? ??
            26 06 07 28 ?? ?? ?? ?? 0C 20 0B ?? ?? ?? 28 ?? ?? ?? ?? 39 ?? ?? ?? ?? 26 11 06 16 20 ??
            ?? ?? ?? 28 ?? ?? ?? ?? A2 17 28 ?? ?? ?? ?? 3A ?? ?? ?? ?? 26 20 03 ?? ?? ?? 16 39 ?? ??
            ?? ?? 26 00 11 04 11 05 28 ?? ?? ?? ?? 20 0A ?? ?? ?? 17 3A ?? ?? ?? ?? 26 00 73 ?? ?? ??
            ?? 13 04 20 04 ?? ?? ?? 38 ?? ?? ?? ?? 2A
        }

        $msgbox_timer = {
            00 28 ?? ?? ?? ?? 0A 06 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 0B 07 28 ?? ?? ?? ?? 0C 
            00 02 7B ?? ?? ?? ?? 08 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 00 DE 12 08 14 FE 01
            13 04 11 04 2D ?? 08 6F ?? ?? ?? ?? 00 DC 00 02 7B ?? ?? ?? ?? 16 32 0E 02 7B
            ?? ?? ?? ?? 16 FE 04 16 FE 01 2B ?? 16 00 13 04 11 04 2D ?? 00 02 7B ?? ?? ??
            ?? 6F ?? ?? ?? ?? 00 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 26 38 ?? ?? ?? ?? 02 7B ??
            ?? ?? ?? 2D ?? 02 7B ?? ?? ?? ?? 2D ?? 02 7B ?? ?? ?? ?? 16 FE 01 16 FE 01 2B
            ?? 17 00 13 04 11 04 2D ?? 00 02 7B ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 73 ?? ?? ??
            ?? 0D 09 17 6F ?? ?? ?? ?? 00 09 72 ?? ?? ?? ?? 72 ?? ?? ?? ?? 16 1F 40 28 ??
            ?? ?? ?? 26 00 38 ?? ?? ?? ?? 00 02 7B ?? ?? ?? ?? 17 FE 04 16 FE 01 13 04 11
            04 2D ?? 00 02 1F 3B 7D ?? ?? ?? ?? 02 7B ?? ?? ?? ?? 17 FE 04 16 FE 01 13 04
            11 04 2D ?? 00 02 1F 3B 7D ?? ?? ?? ?? 02 7B ?? ?? ?? ?? 16 FE 01 13 04 11 04
            2D ?? 02 25 7B ?? ?? ?? ?? 17 59 7D ?? ?? ?? ?? 00 2B ?? 02 25 7B ?? ?? ?? ?? 
            17 59 7D ?? ?? ?? ?? 00 2B ?? 02 25 7B ?? ?? ?? ?? 17 59 7D ?? ?? ?? ?? 02 7B
            ?? ?? ?? ?? 1F 09 FE 02 16 FE 01 13 04 11 04 2D ?? 02 7B ?? ?? ?? ?? 02 7C ??
            ?? ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 2B ?? 02 7B ?? ?? ?? ?? 72 ?? ?? ??
            ?? 02 7C ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 02 7B ??
            ?? ?? ?? 1F 09 FE 02 16 FE 01 13 04 11 04 2D ?? 02 7B ?? ?? ?? ?? 02 7C ?? ??
            ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 2B ?? 02 7B ?? ?? ?? ?? 72 ?? ?? ?? ?? 
            02 7C ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 02 7B ?? ??
            ?? ?? 1F 09 FE 02 16 FE 01 13 04 11 04 2D ?? 02 7B ?? ?? ?? ?? 02 7C ?? ?? ??
            ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 2B ?? 02 7B ?? ?? ?? ?? 72 ?? ?? ?? ?? 02
            7C ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 00 2A            
        }

        $unzip_packed_file = {
            28 ?? ?? ?? ?? 0A 28 ?? ?? ?? ?? 0B 06 07 2E ?? 07 06 28 ?? ?? ?? ?? 2D ?? 14
            2A 02 73 ?? ?? ?? ?? 0C 16 8D ?? ?? ?? ?? 0D 08 6F ?? ?? ?? ?? 13 04 11 04 20
            ?? ?? ?? ?? 40 ?? ?? ?? ?? 08 6F ?? ?? ?? ?? 68 13 05 08 6F ?? ?? ?? ?? 13 06
            08 6F ?? ?? ?? ?? 13 07 11 04 20 ?? ?? ?? ?? 33 ?? 11 05 1F 14 33 ?? 11 06 2D
            ?? 11 07 1E 2E ?? 72 ?? ?? ?? ?? 73 ?? ?? ?? ?? 7A 08 6F ?? ?? ?? ?? 26 08 6F
            ?? ?? ?? ?? 26 08 6F ?? ?? ?? ?? 26 08 6F ?? ?? ?? ?? 13 08 08 6F ?? ?? ?? ?? 
            13 09 08 6F ?? ?? ?? ?? 13 0A 11 09 16 31 ?? 11 09 8D ?? ?? ?? ?? 13 0B 08 11
            0B 16 11 09 6F ?? ?? ?? ?? 26 11 0A 16 31 ?? 11 0A 8D ?? ?? ?? ?? 13 0C 08 11
            0C 16 11 0A 6F ?? ?? ?? ?? 26 08 6F ?? ?? ?? ?? 08 6F ?? ?? ?? ?? 59 D4 8D ??
            ?? ?? ?? 13 0D 08 11 0D 16 11 0D 8E 69 6F ?? ?? ?? ?? 26 11 0D 73 ?? ?? ?? ?? 
            13 0E 11 08 8D ?? ?? ?? ?? 0D 11 0E 09 16 09 8E 69 6F ?? ?? ?? ?? 26 14 13 0D
            38 ?? ?? ?? ?? 11 04 1F 18 63 13 0F 11 04 11 0F 1F 18 62 59 13 04 11 04 20 ??
            ?? ?? ?? 40 ?? ?? ?? ?? 11 0F 17 33 ?? 08 6F ?? ?? ?? ?? 13 10 11 10 8D ?? ??
            ?? ?? 0D 16 13 11 2B ?? 08 6F ?? ?? ?? ?? 13 12 08 6F ?? ?? ?? ?? 13 13 11 12
            8D ?? ?? ?? ?? 13 15 08 11 15 16 11 15 8E 69 6F ?? ?? ?? ?? 26 11 15 73 ?? ??
            ?? ?? 13 14 11 14 09 11 11 11 13 6F ?? ?? ?? ?? 26 11 11 11 13 58 13 11 11 11 
            11 10 32 ?? 11 0F 18 33 ?? 1E 8D ?? ?? ?? ?? 25 D0 ?? ?? ?? ?? 28 ?? ?? ?? ??
            13 16 1E 8D ?? ?? ?? ?? 25 D0 ?? ?? ?? ?? 28 ?? ?? ?? ?? 13 17 11 16 11 17 17
            28 ?? ?? ?? ?? 13 18 11 18 02 1A 02 8E 69 1A 59 6F ?? ?? ?? ?? 13 19 11 19 28
            ?? ?? ?? ?? 0D DE ?? 11 18 2C ?? 11 18 6F ?? ?? ?? ?? DC 11 0F 19 33 ?? 1F 10
            8D ?? ?? ?? ?? 25 D0 ?? ?? ?? ?? 28 ?? ?? ?? ?? 13 1A 1F 10 8D ?? ?? ?? ?? 25
            D0 ?? ?? ?? ?? 28 ?? ?? ?? ?? 13 1B 11 1A 11 1B 17 28 ?? ?? ?? ?? 13 1C 11 1C
            02 1A 02 8E 69 1A 59 6F ?? ?? ?? ?? 13 1D 11 1D 28 ?? ?? ?? ?? 0D DE 17 11 1C
            2C ?? 11 1C 6F ?? ?? ?? ?? DC 72 B5 0E 00 70 73 ?? ?? ?? ?? 7A 08 6F ?? ?? ??
            ?? 14 0C 09 2A            
        }

        $resolve_assembly = {
            12 00 03 6F ?? ?? ?? ?? 28 ?? ?? ?? ?? 12 00 16 28 ?? ?? ?? ?? 0B 28 ?? ?? ?? ?? 07
            6F ?? ?? ?? ?? 28 ?? ?? ?? ?? 0C 72 ?? ?? ?? ?? 17 8D ?? ?? ?? ?? 13 13 11 13 16 1F
            2C 9D 11 13 6F ?? ?? ?? ?? 0D 7E ?? ?? ?? ?? 13 04 16 13 05 16 13 06 16 13 07 2B ??
            09 11 07 9A 08 28 ?? ?? ?? ?? 2C 0A 09 11 07 17 58 9A 13 04 2B ?? 11 07 18 58 13 07
            11 07 09 8E 69 17 59 32 ?? 11 04 6F ?? ?? ?? ?? 2D ?? 12 00 7B ?? ?? ?? ?? 6F ?? ??
            ?? ?? 2D ?? 28 ?? ?? ?? ?? 12 00 7B ?? ?? ?? ?? 6F ?? ?? ?? ?? 28 ?? ?? ?? ?? 0C 16
            13 08 2B ?? 09 11 08 9A 08 28 ?? ?? ?? ?? 2C ?? 09 11 08 17 58 9A 13 04 2B ?? 11 08
            18 58 13 08 11 08 09 8E 69 17 59 32 ?? 11 04 6F ?? ?? ?? ?? 16 3E ?? ?? ?? ?? 11 04
            16 6F ?? ?? ?? ?? 1F 5B 33 ?? 11 04 1F 5D 6F ?? ?? ?? ?? 13 09 11 04 17 11 09 17 59
            6F ?? ?? ?? ?? 13 0A 11 0A 1F 7A 6F ?? ?? ?? ?? 16 FE 04 16 FE 01 13 05 11 0A 1F 74
            6F ?? ?? ?? ?? 16 FE 04 16 FE 01 13 06 11 04 11 09 17 58 6F ?? ?? ?? ?? 13 04 7E ??
            ?? ?? ?? 25 13 14 28 ?? ?? ?? ?? 7E ?? ?? ?? ?? 11 04 6F ?? ?? ?? ?? 2C ?? 7E ?? ??
            ?? ?? 11 04 6F ?? ?? ?? ?? 13 12 DD ?? ?? ?? ?? 28 ?? ?? ?? ?? 11 04 6F ?? ?? ?? ??
            13 0B 11 0B 39 ?? ?? ?? ?? 11 0B 6F ?? ?? ?? ?? 69 13 0C 11 0C 8D ?? ?? ?? ?? 13 0D
            11 0B 11 0D 16 11 0C 6F ?? ?? ?? ?? 26 11 05 2C ?? 11 0D 28 ?? ?? ?? ?? 13 0D 14 13
            0E 11 06 2D ?? 11 0D 28 ?? ?? ?? ?? 13 0E DE 0C 26 17 13 06 DE ?? 26 17 13 06 DE ??
            11 06 2C ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 11 04 28 ?? ?? ?? ?? 13 0F 11 0F 28 ?? ??
            ?? ?? 26 11 0F 12 00 7B ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 13 10 11 10 28 ??
            ?? ?? ?? 2D ?? 11 10 28 ?? ?? ?? ?? 13 11 11 11 11 0D 16 11 0D 8E 69 6F ?? ?? ?? ??
            11 11 6F ?? ?? ?? ?? 11 10 14 1A 28 ?? ?? ?? ?? 26 11 0F 14 1A 28 ?? ?? ?? ?? 26 11
            10 28 ?? ?? ?? ?? 13 0E DE ?? 26 DE ?? 7E ?? ?? ?? ?? 11 04 11 0E 6F ?? ?? ?? ?? 11
            0E 13 12 DE ?? DE ?? 11 14 28 ?? ?? ?? ?? DC 14 2A 11 12 2A
        }

    condition:
        uint16(0) == 0x5A4D and 
        (($call_encrypt and $encrypt_files and $start_process) or
        ($msgbox_timer) or
        ($unzip_packed_file and $resolve_assembly))
}