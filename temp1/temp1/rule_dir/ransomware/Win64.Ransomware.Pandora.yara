rule Win64_Ransomware_Pandora : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "PANDORA"
        description         = "Yara rule that detects Pandora ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Pandora"
        tc_detection_factor = 5

    strings:

        $find_files_p1 = {
            41 57 41 56 41 55 41 54 56 57 55 53 48 83 EC ?? 48 89 4C 24 ?? C7 44 24 ?? ?? ?? ??
            ?? 45 31 F6 41 BA ?? ?? ?? ?? BE ?? ?? ?? ?? 48 8B 05 ?? ?? ?? ?? 48 8B 0D ?? ?? ??
            ?? 48 89 4C 24 ?? 45 31 C0 41 81 FA ?? ?? ?? ?? B9 ?? ?? ?? ?? BA ?? ?? ?? ?? 48 0F
            4C CA 41 0F 94 C0 48 8B 8C 08 ?? ?? ?? ?? 48 01 F1 31 D2 31 DB 41 81 FA ?? ?? ?? ??
            0F 9C C2 0F 95 C3 41 BD ?? ?? ?? ?? 49 29 D5 41 81 FA ?? ?? ?? ?? BF ?? ?? ?? ?? BA
            ?? ?? ?? ?? 48 0F 4C FA 4C 8D 4C 9B ?? 41 BB ?? ?? ?? ?? BA ?? ?? ?? ?? 4C 0F 44 DA
            49 83 C8 ?? 31 DB 31 D2 41 81 FA ?? ?? ?? ?? 0F 9C C3 4C 8D 64 1B ?? 0F 94 C2 48 83
            F2 ?? 31 DB 41 81 FA ?? ?? ?? ?? 0F 94 C3 48 8D 1C DB 48 83 C3 ?? EB ?? 0F 1F 40 ??
            4A 8B AC C0 ?? ?? ?? ?? 48 01 F5 FF E5 FF E1 4A 8B AC E0 ?? ?? ?? ?? 48 01 F5 FF E5
            48 8B AC D8 ?? ?? ?? ?? 48 01 F5 FF E5 0F 1F 80 ?? ?? ?? ?? 48 8B AC F8 ?? ?? ?? ??
            48 01 F5 FF E5 4A 8B AC E8 ?? ?? ?? ?? 48 01 F5 FF E5 4A 8B AC D8 ?? ?? ?? ?? 48 01
        }

        $find_files_p2 = {
            F5 FF E5 66 0F 1F 84 00 ?? ?? 00 00 48 8B AC D0 ?? ?? ?? ?? 48 01 F5 FF E5 4A 8B AC
            C8 ?? ?? ?? ?? 48 01 F5 FF E5 44 89 74 24 ?? 48 63 4C 24 ?? 48 8B 54 24 ?? 48 8B 8C
            CA ?? ?? ?? ?? 48 89 4C 24 ?? 48 8B 4C 24 ?? 8B 54 24 ?? BD ?? ?? ?? ?? 01 EA 44 8B
            54 24 ?? BD ?? ?? ?? ?? 41 01 EA 66 83 39 ?? 44 0F 45 D2 E9 ?? ?? ?? ?? 45 31 FF EB
            ?? 66 2E 0F 1F 84 00 ?? ?? 00 00 90 41 BF ?? ?? ?? ?? 44 8B 54 24 ?? 41 81 C2 ?? ??
            ?? ?? E9 ?? ?? ?? ?? 66 0F 1F 84 00 ?? ?? 00 00 44 8B 74 24 ?? 41 83 C6 ?? 48 8B 54
            24 ?? 48 8B 05 ?? ?? ?? ?? 48 8B 80 ?? ?? ?? ?? B9 ?? ?? ?? ?? 48 01 C8 48 8B 4C 24
            ?? FF D0 8B 4C 24 ?? BA ?? ?? ?? ?? 01 D1 44 8B 54 24 ?? BA ?? ?? ?? ?? 41 01 D2 85
            C0 44 0F 44 D1 E9 ?? ?? ?? ?? 44 89 F8 48 83 C4 ?? 5B 5D 5F 5E 41 5C 41 5D 41 5E 41
            5F C3
        }

        $generate_key = {
            41 57 41 56 41 55 41 54 56 57 55 53 48 81 EC ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? 48
            8D B4 24 ?? ?? ?? ?? 48 89 74 24 ?? 48 8B 44 24 ?? 48 8B 05 ?? ?? ?? ?? 48 C7 C5 ??
            ?? ?? ?? 48 8B 80 ?? ?? ?? ?? 48 01 E8 41 BC ?? ?? ?? ?? 48 8B 0D ?? ?? ?? ?? 4C 01
            E1 BA ?? ?? ?? ?? 48 03 15 ?? ?? ?? ?? FF D0 48 8B 05 ?? ?? ?? ?? 48 8B 4C 24 ?? 0F
            B7 90 ?? ?? ?? ?? 66 89 51 ?? 48 8B 80 ?? ?? ?? ?? 48 89 01 48 8B 05 ?? ?? ?? ?? 48
            8B 80 ?? ?? ?? ?? 48 01 E8 48 8B 0D ?? ?? ?? ?? 4C 01 E1 FF D0 48 8B 05 ?? ?? ?? ??
            48 8B 80 ?? ?? ?? ?? 48 01 E8 48 8B 0D ?? ?? ?? ?? 4C 01 E1 FF D0 48 8B 05 ?? ?? ??
            ?? 48 8B 80 ?? ?? ?? ?? 48 01 E8 48 89 F1 FF D0 48 98 4C 8B 05 ?? ?? ?? ?? 4D 01 E0
            48 8B 0D ?? ?? ?? ?? 48 8B 99 ?? ?? ?? ?? 48 01 EB 48 8B 0D ?? ?? ?? ?? 4C 01 E1 48
            89 44 24 ?? 48 8D 15 ?? ?? ?? ?? 49 89 F1 FF D3 89 84 24 ?? ?? ?? ?? B9 ?? ?? ?? ??
            45 31 ED 41 BE ?? ?? ?? ?? 41 BF ?? ?? ?? ?? BB ?? ?? ?? ?? EB ?? 81 F9 ?? ?? ?? ??
            BA ?? ?? ?? ?? BF ?? ?? ?? ?? 48 0F 44 D7 48 8B 04 10 4C 01 F0 FF E0
        }

        $drop_ransom_note = {
            48 8B 05 ?? ?? ?? ?? 48 8B 80 ?? ?? ?? ?? BD ?? ?? ?? ?? 48 01 E8 48 8B 0D ?? ?? ??
            ?? BE ?? ?? ?? ?? 48 01 F1 48 8B 15 ?? ?? ?? ?? BF ?? ?? ?? ?? 48 01 FA FF D0 48 8B
            0D ?? ?? ?? ?? 48 01 F1 48 8B 05 ?? ?? ?? ?? 48 8B 90 ?? ?? ?? ?? 48 01 EA FF D2 48
            8B 15 ?? ?? ?? ?? 48 01 F2 48 8B 8C 24 ?? ?? ?? ?? 48 8B 35 ?? ?? ?? ?? 48 8B B6 ??
            ?? ?? ?? 48 01 EE 48 C7 44 24 ?? ?? ?? ?? ?? 41 89 C0 4C 8D 4C 24 ?? FF D6 BE ?? ??
            ?? ?? 48 8B 8C 24 ?? ?? ?? ?? 48 8B 05 ?? ?? ?? ?? 48 8B 90 ?? ?? ?? ?? 41 BE ?? ??
            ?? ?? 48 01 EA FF D2 BF ?? ?? ?? ?? 8B 4C 24 ?? B8 ?? ?? ?? ?? 01 C1 E9 ?? ?? ?? ??
            81 F9 ?? ?? ?? ?? BA ?? ?? ?? ?? BD ?? ?? ?? ?? 48 0F 44 D5 48 8B 04 10 4C 01 E0 FF
            E0 8B 44 24 ?? 83 C0 ?? 89 44 24 ?? 8B 4C 24 ?? B8 ?? ?? ?? ?? 01 C1 E9 ?? ?? ?? ??
            81 F9 ?? ?? ?? ?? BA ?? ?? ?? ?? BD ?? ?? ?? ?? 48 0F 44 D5 48 8B 04 10 4C 01 E0 FF
            E0 8B 4C 24 ?? B8 ?? ?? ?? ?? 01 C1 E9 ?? ?? ?? ?? 81 F9 ?? ?? ?? ?? BA ?? ?? ?? ??
            BD ?? ?? ?? ?? 48 0F 44 D5 48 8B 04 10 4C 01 E0 FF E0 8B 4C 24 ?? B8 ?? ?? ?? ?? 01
            C1 C7 44 24 ?? ?? ?? ?? ?? E9 ?? ?? ?? ?? 81 F9 ?? ?? ?? ?? BA ?? ?? ?? ?? BD ?? ??
            ?? ?? 48 0F 44 D5 48 8B 04 10 4C 01 E0 FF E0 48 8B 05 ?? ?? ?? ?? 48 8B 88 ?? ?? ??
            ?? 48 8B 05 ?? ?? ?? ?? 48 8B 80 ?? ?? ?? ?? 4C 01 F0 C7 44 24 ?? ?? ?? ?? ?? 48 8D
            54 24 ?? 4C 8D 84 24 ?? ?? ?? ?? 4C 8D 4C 24 ?? FF D0 BF ?? ?? ?? ?? 8B 54 24 ?? B9
            ?? ?? ?? ?? 01 CA 8B 4C 24 ?? BD ?? ?? ?? ?? E9 ?? ?? ?? ?? 48 8B 84 24 ?? ?? ?? ??
            48 8B 84 24 ?? ?? ?? ?? 48 8B 84 24 ?? ?? ?? ?? 48 8B 84 24 ?? ?? ?? ?? 31 C0 48 81
            C4 ?? ?? ?? ?? 5B 5D 5F 5E 41 5C 41 5D 41 5E 41 5F C3
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            all of ($find_files_p*)
        ) and
        (
            $generate_key
        ) and
        (
            $drop_ransom_note
        )
}