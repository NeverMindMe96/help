rule Win32_Ransomware_Termite : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "TERMITE"
        description         = "Yara rule that detects Termite ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Termite"
        tc_detection_factor = 5

    strings:

        $find_files_p1 = {
            55 8B EC 81 EC ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? 
            ?? ?? C7 45 ?? ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 
            8B 5D ?? 8B 03 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 83 C4 ?? 89 45 ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 F8 ?? B8 
            ?? ?? ?? ?? 0F 95 C0 89 45 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 83 7D 
            ?? ?? 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8B 5D ?? FF 33 B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            83 C4 ?? 89 45 ?? 8B 45 ?? 50 8B 5D ?? 8B 1B 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 
            58 8B 5D ?? 89 03 68 ?? ?? ?? ?? 8B 5D ?? FF 33 B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 
            ?? 89 45 ?? 8D 85 ?? ?? ?? ?? 50 6A ?? 6A ?? FF 75 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            83 C4 ?? 89 45 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 8B 45 ?? 50 8B 5D 
            ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 58 89 45 ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? 
            ?? ?? ?? 83 C4 ?? 83 F8 ?? 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 8B 5D ?? 8B 03 85 
            C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 
            45 ?? 68 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 8B 45 ?? 85 C0 75 ?? 
            B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 8B 
            5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? FF 75 ?? E8
        }

        $find_files_p2 = { 
            83 C4 ?? 83 F8 ?? B8 ?? ?? ?? ?? 0F 94 C0 89 45 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? 
            ?? ?? 83 C4 ?? 83 7D ?? ?? 0F 84 ?? ?? ?? ?? E9 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 68 
            ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 8B 45 ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? 
            ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 68 ?? ?? ?? ?? 6A ?? 8B 45 ?? 85 
            C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 
            45 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 8B 45 ?? 50 8B 5D ?? 85 DB 74 
            ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 58 89 45 ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 
            C4 ?? 83 F8 ?? 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 
            F8 ?? 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 F8 ?? 0F 
            84 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 F8 ?? 0F 84 ?? ?? 
            ?? ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 F8 ?? 0F 84 ?? ?? ?? ?? 68 
            ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 F8 ?? 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? 
            ?? FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 F8 ?? 0F 84 ?? ?? ?? ?? B8 ?? ?? ?? ?? EB ?? 
            B8 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? FF 75 ?? 8B 5D ?? FF 33 B9 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 83 C4 ?? 89 45 ?? 68 ?? ?? ?? ?? 6A ?? 8B 45 ?? 85 C0 75 ?? B8
        }

        $find_files_p3 = {  
            50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 8B 5D ?? 85 DB 74 
            ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 81 7D ?? ?? ?? ?? ?? 0F 8D ?? ?? ?? ?? FF 75 ?? 8B 5D 
            ?? FF 33 B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 68 ?? ?? ?? ?? 6A ?? 8B 45 
            ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 
            ?? 89 45 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 8B 45 ?? 50 8B 5D ?? 85 
            DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 58 89 45 ?? 68 ?? ?? ?? ?? 6A ?? 8B 45 ?? 85 C0 
            75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 
            ?? 68 ?? ?? ?? ?? 6A ?? A1 ?? ?? ?? ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 
            BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 6A ?? 50 68 ?? ?? ?? ?? 6A ?? 
            8B 45 ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            83 C4 ?? 89 45 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? A1 ?? ?? ?? ?? 50 
            FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 F8 ?? B8 ?? ?? ?? ?? 0F 95 C0 89 45 ?? 8B 5D ?? 
            85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 83 7D ?? ?? 0F 84 ?? ?? ?? ?? FF 75 ?? 8B 5D 
            ?? FF 33 B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 68 ?? ?? ?? ?? 6A ?? 8B 45 
            ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 
            ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? FF 35 ?? ?? ?? ?? 68
        }

        $find_files_p4 = {
            FF 75 ?? 8B 5D ?? FF 33 B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 68 ?? ?? ?? 
            ?? FF 35 ?? ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 68 ?? ?? ?? ?? 
            6A ?? 8B 45 ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 83 C4 ?? 89 45 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? 
            ?? 6A ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? A1 ?? ?? ?? ?? 85 C0 75 ?? B8 ?? ?? ?? 
            ?? 50 68 ?? ?? ?? ?? 6A ?? 8B 45 ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? B8 
            ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? FF 75 ?? FF 75 ?? B9 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 
            C4 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 6A ?? 8B 45 ?? 
            85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 6A ?? 8B 45 ?? 85 C0 75 ?? B8 ?? ?? ?? 
            ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 8B 5D ?? 85 DB 74 ?? 53 
            E8 ?? ?? ?? ?? 83 C4 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? E9 ?? ?? ?? 
            ?? FF 75 ?? 8B 5D ?? FF 33 B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 68 ?? ?? 
            ?? ?? 6A ?? 8B 45 ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 83 C4 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 8D 85 ?? ?? ?? 
            ?? 50 6A ?? 6A ?? 6A ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 8B 45 ?? 50
        }

        $find_files_p5 = { 
            8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 58 89 45 ?? E9 ?? ?? ?? ?? 68 ?? ?? 
            ?? ?? 8B 5D ?? FF 33 B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 8D 85 ?? ?? ?? 
            ?? 50 6A ?? 68 ?? ?? ?? ?? FF 75 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 
            8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 8B 45 ?? 50 8B 5D ?? 85 DB 74 ?? 53 
            E8 ?? ?? ?? ?? 83 C4 ?? 58 89 45 ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 
            83 F8 ?? 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 
            8B 45 ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            83 C4 ?? 89 45 ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 F8 ?? B8 ?? ?? 
            ?? ?? 0F 95 C0 89 45 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 83 7D ?? ?? 
            0F 84 ?? ?? ?? ?? FF 75 ?? 8B 5D ?? FF 33 B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 
            45 ?? 8D 45 ?? 50 E8 ?? ?? ?? ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 8D 
            85 ?? ?? ?? ?? 50 6A ?? 68 ?? ?? ?? ?? 6A ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 
            89 45 ?? 8B 45 ?? 50 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 58 89 45 ?? E9 
            ?? ?? ?? ?? FF 75 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 8B 5D ?? 85 DB 74 ?? 53 
            E8 ?? ?? ?? ?? 83 C4 ?? 8B 5D ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 8B 5D ?? 85 
            DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 8B E5 5D C2
        }

        $encrypt_files_p1 = {
            B8 ?? ?? ?? ?? 89 45 ?? 8D 45 ?? 50 E8 ?? ?? ?? ?? 89 45 ?? 8B 5D ?? 85 DB 74 ?? 53 
            E8 ?? ?? ?? ?? 83 C4 ?? 83 7D ?? ?? 0F 85 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 C4 ?? 
            B8 ?? ?? ?? ?? 50 8B 1D ?? ?? ?? ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 58 A3 ?? 
            ?? ?? ?? B8 ?? ?? ?? ?? 50 8B 1D ?? ?? ?? ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 
            58 A3 ?? ?? ?? ?? B8 ?? ?? ?? ?? 50 8B 1D ?? ?? ?? ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 
            83 C4 ?? 58 A3 ?? ?? ?? ?? B8 ?? ?? ?? ?? 50 8B 1D ?? ?? ?? ?? 85 DB 74 ?? 53 E8 ?? 
            ?? ?? ?? 83 C4 ?? 58 A3 ?? ?? ?? ?? B8 ?? ?? ?? ?? 50 8B 1D ?? ?? ?? ?? 85 DB 74 ?? 
            53 E8 ?? ?? ?? ?? 83 C4 ?? 58 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? A1 ?? ?? ?? ?? 85 
            C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 
            45 ?? 8B 45 ?? 50 8B 1D ?? ?? ?? ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 58 A3 ?? 
            ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? A1 ?? ?? ?? ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? 
            ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 8B 45 ?? 50 8B 1D
        }

        $encrypt_files_p2 = { 
            85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 58 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? A1 ?? 
            ?? ?? ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            83 C4 ?? 89 45 ?? 8B 45 ?? 50 8B 1D ?? ?? ?? ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 
            ?? 58 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? A1 ?? ?? ?? ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 
            50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 8B 45 ?? 50 8B 1D 
            ?? ?? ?? ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 58 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? 
            6A ?? A1 ?? ?? ?? ?? 85 C0 75 ?? B8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 8B 45 ?? 50 8B 1D ?? ?? ?? ?? 85 DB 74 ?? 53 E8 ?? ?? 
            ?? ?? 83 C4 ?? 58 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? A1 ?? ?? ?? ?? 85 C0 75 ?? B8 
            ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? 
            ?? 68 ?? ?? ?? ?? BB ?? ?? ?? ?? E8
        }

    condition:
        uint16(0) == 0x5A4D and 
        (
            all of ($find_files_p*)
        ) and 
        (
            all of ($encrypt_files_p*)
        )
}