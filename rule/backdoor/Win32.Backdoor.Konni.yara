rule Win32_Backdoor_Konni : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "KONNI"
        description         = "Yara rule that detects Konni backdoor."

        tc_detection_type   = "Backdoor"
        tc_detection_name   = "Konni"
        tc_detection_factor = 5

    strings:

        $network_communication_p1 = {
            55 8B EC 83 EC ?? 53 56 8B 35 ?? ?? ?? ?? 57 33 FF 68 ?? ?? ?? ?? 8D 9E ?? ?? ?? ??
            57 53 89 7D ?? 89 7D ?? 89 7D ?? 89 7D ?? 89 7D ?? 89 5D ?? E8 ?? ?? ?? ?? 8B 45 ??
            50 56 8D 8E ?? ?? ?? ?? 51 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 83 C4 ??
            81 C6 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 57 57 57 6A ?? 57 FF 15 ?? ?? ?? ?? 8B D8 3B DF
            0F 84 ?? ?? ?? ?? 57 57 6A ?? 57 57 6A ?? 56 53 C7 45 ?? ?? ?? ?? ?? FF 15 ?? ?? ??
            ?? 8B F8 89 7D ?? 85 FF 75 ?? 53 FF 15 ?? ?? ?? ?? 8D 47 ?? 5F 5E 5B 8B E5 5D C2 ??
            ?? 8B 55 ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 52 68 ?? ?? ?? ?? 57 C7 45 ?? ??
            ?? ?? ?? FF 15 ?? ?? ?? ?? 8B F0 85 F6 75 ?? 8B 35 ?? ?? ?? ?? 57 FF D6 53 FF D6 5F
            5E B8 ?? ?? ?? ?? 5B 8B E5 5D C2 ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 56 FF 15 ?? ?? ?? ??
            6A ?? 6A ?? 85 C0 74 ?? 8D 45 ?? 50 56 FF 15 ?? ?? ?? ?? 85 C0 75 ?? 50 50 6A ?? 56
            FF 15 ?? ?? ?? ?? 56 8B 35 ?? ?? ?? ?? FF D6 57 FF D6 53 FF D6 5F 5E B8 ?? ?? ?? ??
            5B 8B E5 5D C2 ?? ?? 8B 45 ?? 85 C0 75 ?? 50 50 50 56 FF 15 ?? ?? ?? ?? 56 8B 35 ??
            ?? ?? ?? FF D6 57 FF D6 53 FF D6 5F 5E 83 C8 ?? 5B 8B E5 5D C2 ?? ?? 40 50 6A ?? 89
        }

        $network_communication_p2 = {
            45 ?? FF 15 ?? ?? ?? ?? 8B F8 85 FF 75 ?? 50 50 50 56 FF 15 ?? ?? ?? ?? 56 8B 35 ??
            ?? ?? ?? FF D6 8B 4D ?? 51 FF D6 53 FF D6 5F 5E 83 C8 ?? 5B 8B E5 5D C2 ?? ?? 8B 55
            ?? 52 6A ?? 57 E8 ?? ?? ?? ?? 83 C4 ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 68 ??
            ?? ?? ?? 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 89 45 ?? 83 F8 ?? 75 ?? 6A ?? 6A ?? 6A ??
            56 FF 15 ?? ?? ?? ?? 56 8B 35 ?? ?? ?? ?? FF D6 8B 45 ?? 50 FF D6 53 FF D6 5F 5E 83
            C8 ?? 5B 8B E5 5D C2 ?? ?? 8B 55 ?? 8D 4D ?? 51 52 57 56 FF 15 ?? ?? ?? ?? 85 C0 74
            ?? 83 7D ?? ?? 74 ?? 68 ?? ?? ?? ?? 57 C7 45 ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ??
            85 C0 B8 ?? ?? ?? ?? 75 ?? 8B 45 ?? 89 45 ?? 83 F8 ?? 74 ?? 8B 4D ?? 8B 55 ?? 6A ??
            8D 45 ?? 50 51 57 52 FF 15 ?? ?? ?? ?? 8B 4D ?? 8B 45 ?? 01 45 ?? 51 6A ?? 57 E8 ??
            ?? ?? ?? 8B 45 ?? 83 C4 ?? 8D 55 ?? 52 50 57 56 FF 15 ?? ?? ?? ?? 85 C0 75 ?? 8B 4D
            ?? 51 FF 15 ?? ?? ?? ?? 57 FF 15 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 56 FF 15 ?? ?? ?? ??
            56 8B 35 ?? ?? ?? ?? FF D6 8B 55 ?? 52 FF D6 53 FF D6 83 7D ?? ?? 0F 84 ?? ?? ?? ??
            8B 45 ?? 5F 5E 5B 8B E5 5D C2
        }

        $handle_c2_commands_p1 = {
            55 8B EC 81 EC ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 C5 89 45 ?? 53 56 57 8D 85 ?? ?? ?? ??
            50 33 FF 68 ?? ?? ?? ?? 89 BD ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8B F0 89 B5 ?? ?? ?? ??
            3B F7 75 ?? 83 C8 ?? 5F 5E 5B 8B 4D ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C3 8B 0D ?? ??
            ?? ?? 8B 16 51 52 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? A1 ?? ?? ?? ?? 8B
            4E ?? 50 51 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 75 ?? 8B 56 ?? 68 ?? ?? ?? ?? 52 E8 ?? ??
            ?? ?? 83 C4 ?? 85 C0 75 ?? 8B 4E ?? 6A ?? E8 ?? ?? ?? ?? 83 C4 ?? E9 ?? ?? ?? ?? 8B
            5E ?? 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 33 C0 57 51 66 89 85 ?? ?? ?? ?? E8 ?? ?? ??
            ?? 83 C4 ?? E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8B 15 ?? ?? ?? ?? 8B 46 ?? 52 50 E8 ?? ??
            ?? ?? 83 C4 ?? 85 C0 75 ?? 8B 4E ?? 57 51 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 68 ?? ??
            ?? ?? FF 15 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8B 15 ?? ?? ?? ?? 8B 46 ?? 52 50 E8 ?? ?? ??
            ?? 83 C4 ?? 85 C0 75 ?? 8B 46 ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 69 C0 ?? ?? ?? ?? A3 ??
            ?? ?? ?? E9 ?? ?? ?? ?? 8B 0D ?? ?? ?? ?? 8B 56 ?? 51 52 E8 ?? ?? ?? ?? 83 C4 ?? 85
        }

        $handle_c2_commands_p2 = {
            C0 75 ?? 8B 46 ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 69 C0 ?? ?? ?? ?? A3 ?? ?? ?? ?? E9 ??
            ?? ?? ?? 8B 85 ?? ?? ?? ?? 8B 4C 86 ?? 68 ?? ?? ?? ?? 51 E8 ?? ?? ?? ?? 83 C4 ?? BE
            ?? ?? ?? ?? 85 C0 75 ?? 8D 78 ?? E8 ?? ?? ?? ?? 8B B5 ?? ?? ?? ?? E9 ?? ?? ?? ?? 33
            FF E8 ?? ?? ?? ?? 8B B5 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8B 15 ?? ?? ?? ?? 8B 06 52 50 E8
            ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 8B 0D ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 8B
            44 96 ?? 51 50 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 74 ?? 8B 8D ?? ?? ?? ?? 8B 54 8E ?? 68
            ?? ?? ?? ?? 52 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 74 ?? 8B 06 8D 50 ?? 8B FF 66 8B 08 83
            C0 ?? 66 3B CF 75 ?? 2B C2 D1 F8 57 8D 3C 45 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? EB
            ?? 8B 06 8D 50 ?? 66 8B 08 83 C0 ?? 66 3B CF 75 ?? 2B C2 D1 F8 6A ?? 8D 3C 45 ?? ??
            ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? EB ?? A1 ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? 8B 54 8E ?? 50
            52 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 75 ?? 8D 48 ?? EB ?? 33 C9 E8 ?? ?? ?? ?? 8B F8 56
            FF 15 ?? ?? ?? ?? 8B 4D ?? 8B C7 5F 5E 33 CD 5B E8 ?? ?? ?? ?? 8B E5 5D C3
        }

        $create_cab_file_and_upload_p1 = {
            55 8B EC 81 EC ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 C5 89 45 ?? A1 ?? ?? ?? ?? 53 56 57 33
            FF 68 ?? ?? ?? ?? 8B F1 8D 95 ?? ?? ?? ?? 33 C9 57 52 89 85 ?? ?? ?? ?? 89 BD ?? ??
            ?? ?? 89 BD ?? ?? ?? ?? 89 BD ?? ?? ?? ?? 89 BD ?? ?? ?? ?? 66 89 8D ?? ?? ?? ?? E8
            ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 33 C0 57 51 66 89 85 ?? ?? ??
            ?? E8 ?? ?? ?? ?? 33 C0 89 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 66 89
            85 ?? ?? ?? ?? 83 C4 ?? 8D 85 ?? ?? ?? ?? 33 D2 50 66 89 95 ?? ?? ?? ?? FF 15 ?? ??
            ?? ?? 0F B7 8D ?? ?? ?? ?? 0F B7 95 ?? ?? ?? ?? 0F B7 85 ?? ?? ?? ?? 51 0F B7 8D ??
            ?? ?? ?? 52 0F B7 95 ?? ?? ?? ?? 50 51 52 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 ?? ??
            ?? ?? 68 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 57
            51 E8 ?? ?? ?? ?? 83 C4 ?? 8D 95 ?? ?? ?? ?? 52 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8D
            85 ?? ?? ?? ?? 50 57 68 ?? ?? ?? ?? 8B C8 51 FF 15 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 52
            FF 15 ?? ?? ?? ?? 6A ?? 56 E8 ?? ?? ?? ?? 8B D8 68 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 83
            C4 ?? 85 C0 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 74 ??
            68 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 74 ?? 68 ?? ?? ?? ?? 53 E8 ?? ?? ??
            ?? 83 C4 ?? 85 C0 74 ?? 68 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 74 ?? 68 ??
            ?? ?? ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 74 ?? 8B CE 8D BD ?? ?? ?? ?? E8 ?? ?? ??
            ?? 83 F8 ?? 75 ?? 83 C8 ?? 5F 5E 5B 8B 4D ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C3 57 8D
        }

        $create_cab_file_and_upload_p2 = {
            85 ?? ?? ?? ?? 50 56 FF 15 ?? ?? ?? ?? EB ?? 33 FF 8D 9D ?? ?? ?? ?? 8D 85 ?? ?? ??
            ?? E8 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 3B C7 74 ?? 8D 8D ?? ?? ?? ?? 51 FF 15 ?? ?? ??
            ?? 8B B5 ?? ?? ?? ?? 83 C6 ?? 56 6A ?? FF 15 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 3B C7 74
            ?? 56 57 50 E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B D8 83 C4 ?? 3B
            DF 74 ?? 8D 85 ?? ?? ?? ?? 8D 50 ?? EB ?? 8D 9B ?? ?? ?? ?? 66 8B 08 83 C0 ?? 66 3B
            CF 75 ?? 2B C2 8D 93 ?? ?? ?? ?? D1 F8 8D 0C 00 33 C0 89 02 89 42 ?? 89 42 ?? 89 42
            ?? 89 42 ?? 89 42 ?? 89 42 ?? 89 42 ?? 3B CF 74 ?? 51 8D 8D ?? ?? ?? ?? E8 ?? ?? ??
            ?? 83 C4 ?? 8B CB EB ?? 33 C9 8B 95 ?? ?? ?? ?? 89 8A ?? ?? ?? ?? 3B CF 0F 84 ?? ??
            ?? ?? 8B 85 ?? ?? ?? ?? 8B BD ?? ?? ?? ?? 8B 9D ?? ?? ?? ?? 56 50 E8 ?? ?? ?? ?? 8B
            BD ?? ?? ?? ?? 8B 87 ?? ?? ?? ?? 85 C0 74 ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 53 C7 87 ??
            ?? ?? ?? ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 8D 50 ?? 8D 9B ?? ?? ?? ??
            66 8B 08 83 C0 ?? 66 85 C9 75 ?? 2B C2 D1 F8 8D 84 46 ?? ?? ?? ?? 50 6A ?? 89 85 ??
            ?? ?? ?? FF 15 ?? ?? ?? ?? 8B D8 85 DB 0F 84 ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? 51 6A ??
            53 E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 83 C4 ?? 8D 95 ?? ?? ?? ?? 52 68 ?? ?? ?? ?? 50
            53 E8 ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? 56 89 85 ?? ?? ?? ?? 51 03 C3 50 E8 ?? ?? ?? ??
            8B BD ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 03 FB 83 C4 ?? 03 FE B9 ?? ?? ?? ?? BE ?? ?? ??
            ?? 50 F3 A5 FF 15 ?? ?? ?? ?? 8B B5 ?? ?? ?? ?? 81 C6 ?? ?? ?? ?? 56 E8
        }

        $create_cab_file_and_upload_p3 = {
            6A ?? 6A ?? 6A ?? 6A ?? 6A ?? FF 15 ?? ?? ?? ?? 8B F8 85 FF 0F 84 ?? ?? ?? ?? 6A ??
            6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 56 57 C7 85 ?? ?? ?? ?? ?? ?? ?? ?? FF 15 ?? ?? ?? ??
            89 85 ?? ?? ?? ?? 85 C0 75 ?? 57 FF 15 ?? ?? ?? ?? B8 ?? ?? ?? ?? 5F 5E 5B 8B 4D ??
            33 CD E8 ?? ?? ?? ?? 8B E5 5D C3 8B B5 ?? ?? ?? ?? 68 ?? ?? ?? ?? 81 C6 ?? ?? ?? ??
            6A ?? 56 E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 83 C4 ?? 50 05 ?? ?? ?? ?? 50 68 ?? ?? ??
            ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? 83 C4 ?? 6A ?? 68 ?? ?? ?? ??
            6A ?? 6A ?? 6A ?? 56 68 ?? ?? ?? ?? 51 C7 85 ?? ?? ?? ?? ?? ?? ?? ?? FF 15 ?? ?? ??
            ?? 8B F0 85 F6 75 ?? 8B 95 ?? ?? ?? ?? 8B 35 ?? ?? ?? ?? 52 FF D6 57 FF D6 B8 ?? ??
            ?? ?? 5F 5E 5B 8B 4D ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C3 8B 85 ?? ?? ?? ?? 50 53 6A
            ?? 68 ?? ?? ?? ?? 56 FF 15 ?? ?? ?? ?? 85 C0 75 ?? 50 50 50 56 FF 15 ?? ?? ?? ?? 56
            8B 35 ?? ?? ?? ?? FF D6 8B 8D ?? ?? ?? ?? 51 FF D6 57 FF D6 B8 ?? ?? ?? ?? 5F 5E 5B
            8B 4D ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C3 53 FF 15 ?? ?? ?? ?? 6A ?? 6A ?? 8D 95 ??
            ?? ?? ?? 52 56 FF 15 ?? ?? ?? ?? 85 C0 75 ?? 50 50 50 56 FF 15 ?? ?? ?? ?? 56 8B 35
            ?? ?? ?? ?? FF D6 8B 85 ?? ?? ?? ?? 50 FF D6 57 FF D6 B8 ?? ?? ?? ?? 5F 5E 5B 8B 4D
            ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C3 8B 85 ?? ?? ?? ?? 85 C0 75 ?? 50 50 50 56 FF 15
            ?? ?? ?? ?? 56 8B 35 ?? ?? ?? ?? FF D6 8B 8D ?? ?? ?? ?? 51 FF D6 57 FF D6 83 C8
        }

        $create_cab_file_and_upload_p4 = {
            5F 5E 5B 8B 4D ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C3 40 50 6A ?? 89 85 ?? ?? ?? ?? FF
            15 ?? ?? ?? ?? 8B D8 85 DB 75 ?? 50 50 50 56 FF 15 ?? ?? ?? ?? 56 8B 35 ?? ?? ?? ??
            FF D6 8B 95 ?? ?? ?? ?? 52 FF D6 57 FF D6 83 C8 ?? 5F 5E 5B 8B 4D ?? 33 CD E8 ?? ??
            ?? ?? 8B E5 5D C3 8B 85 ?? ?? ?? ?? 50 6A ?? 53 E8 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 83
            C4 ?? 8D 8D ?? ?? ?? ?? 51 52 53 56 FF 15 ?? ?? ?? ?? 85 C0 74 ?? 68 ?? ?? ?? ?? 53
            E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 75 ?? 89 85 ?? ?? ?? ?? EB ?? C7 85 ?? ?? ?? ?? ?? ??
            ?? ?? 53 FF 15 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 56 FF 15 ?? ?? ?? ?? 56 8B 35 ?? ?? ??
            ?? FF D6 8B 85 ?? ?? ?? ?? 50 FF D6 57 FF D6 8B 4D ?? 8B 85 ?? ?? ?? ?? 5F 5E 33 CD
            5B E8 ?? ?? ?? ?? 8B E5 5D C3
        }

        $cmd_expand_payload = {
            55 8B EC 81 EC ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 C5 89 45 ?? 53 56 57 68 ?? ?? ?? ?? 8B
            D9 33 FF 8D 8D ?? ?? ?? ?? 33 C0 57 51 66 89 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? ??
            ?? ?? 8D 85 ?? ?? ?? ?? 33 D2 57 50 66 89 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 6A ?? 8D 8D
            ?? ?? ?? ?? 57 51 89 BD ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 57 68 ?? ?? ?? ?? 6A ??
            57 6A ?? 33 C0 68 ?? ?? ?? ?? 53 89 BD ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 89 85 ?? ?? ??
            ?? 89 85 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8B F0 83 FE ?? 74 ?? 57 57 57 6A ?? 57 56 FF
            15 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 3B C7 75 ?? 56 FF 15 ?? ?? ?? ?? 83 C8 ?? 5F 5E 5B
            8B 4D ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C3 57 57 57 6A ?? 50 FF 15 ?? ?? ?? ?? 8B F8
            85 FF 74 ?? 68 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 52 6A ?? 8D 47 ?? 50 6A ?? 6A ?? FF 15
            ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ??
            ?? 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 68 ?? ?? ?? ?? 68 ?? ?? ??
            ?? E8 ?? ?? ?? ?? 8B 57 ?? 83 C4 ?? 57 89 95 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8B 85 ??
            ?? ?? ?? 8B 3D ?? ?? ?? ?? 50 FF D7 56 FF D7 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 6A ??
            51 E8 ?? ?? ?? ?? 53 68 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 68 ?? ?? ?? ?? 52 E8 ?? ?? ??
            ?? 83 C4 ?? 33 C0 8D 8D ?? ?? ?? ?? 51 8D 95 ?? ?? ?? ?? 52 50 50 68 ?? ?? ?? ?? 50
            50 50 66 89 85 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 6A ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ??
            FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 1D ?? ?? ?? ?? 68 ?? ?? ?? ?? FF D3 6A
            ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ??
            8B F0 83 FE ?? 75 ?? FF 15 ?? ?? ?? ?? 83 F8 ?? 75 ?? 56 FF D7 8B 4D ?? 8B 85 ?? ??
            ?? ?? 5F 5E 33 CD 5B E8 ?? ?? ?? ?? 8B E5 5D C3
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            all of ($network_communication_p*)
        ) and
        (
            all of ($handle_c2_commands_p*)
        ) and
        (
            all of ($create_cab_file_and_upload_p*)
        ) and
        (
            $cmd_expand_payload
        )
}