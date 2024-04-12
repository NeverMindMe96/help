rule Win32_Ransomware_Reveton : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "REVETON"
        description         = "Yara rule that detects Reveton ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Reveton"
        tc_detection_factor = 5

    strings:
        $http_connection_1 = {
            C6 45 ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 89 45 ?? 83 7D ?? 
            ?? 0F 84 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? 8B C3 E8 ?? ?? ?? ?? 50 8B 45 
            ?? 50 E8 ?? ?? ?? ?? 8B D8 85 DB 74 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 89 45 ?? 33 C0 
            55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 8B 06 E8 ?? ?? ?? ?? C6 45 ?? ?? 8D 45 ?? 50 68 
            ?? ?? ?? ?? 8B 45 ?? 50 53 E8 ?? ?? ?? ?? 8B 55 ?? 8B 06 8B 4D ?? E8 ?? ?? ?? ?? 83 
            7D ?? ?? 75 ?? 53 E8 ?? ?? ?? ?? 33 C0 5A 59 59 64 89 10 68 ?? ?? ?? ?? 8B 45 ?? E8 
            ?? ?? ?? ?? C3 E9 ?? ?? ?? ?? EB ?? 8B 45 ?? 50 E8
        }

        $raw_socket_connection_1_1 = {
            55 8B EC 81 C4 ?? ?? ?? ?? 53 56 57 33 C9 89 8D ?? ?? ?? ?? 89 8D ?? ?? ?? ?? 89 4D 
            ?? 89 55 ?? 8B F0 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 33 DB 8D 45 ?? BA ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 6A ?? 68 ?? ?? 
            ?? ?? 8D 85 ?? ?? ?? ?? 50 56 E8 ?? ?? ?? ?? 8B F8 85 FF 0F 8E ?? ?? ?? ?? 8D 85 ?? 
            ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 8B CF E8 
            ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8
        }

        $raw_socket_connection_1_2 = {
            C6 85 ?? ?? ?? ?? ?? C6 85 ?? ?? ?? ?? ?? 80 BD ?? ?? ?? ?? ?? 75 ?? 80 BD ?? ?? ?? 
            ?? ?? 74 ?? 33 C0 EB ?? B0 ?? 84 C0 75 ?? C6 85 ?? ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? 
            ?? 8D 95 ?? ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8B C6 E8 ?? ?? ?? ?? E9 
            ?? ?? ?? ?? 8A 85 ?? ?? ?? ?? FE C8 0F 85 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 66 C7 85 ?? ?? ?? ?? ?? ?? 8A 85 ?? ?? ?? ?? FE C8 74 ?? 2C ?? 74 
            ?? E9 ?? ?? ?? ?? 8A 85 ?? ?? ?? ?? 88 85 ?? ?? ?? ?? 8A 85 ?? ?? ?? ?? 88 85 ?? ?? 
            ?? ?? 8A 85 ?? ?? ?? ?? 88 85 ?? ?? ?? ?? 8A 85 ?? ?? ?? ?? 88 85 ?? ?? ?? ?? 8A 95 
            ?? ?? ?? ?? 8A 85 ?? ?? ?? ?? E8
        }

        $raw_socket_connection_1_3 = {
            66 89 85 ?? ?? ?? ?? E9 ?? ?? ?? ?? 0F B6 BD ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 8D 85 
            ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8B CF 
            BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 85 
            C0 75 ?? C6 85 ?? ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? B9 ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 8B 55 ?? 8B C6 E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8B 40 ?? 8B 00 8B 00 
            89 85 ?? ?? ?? ?? 8A 94 3D ?? ?? ?? ?? 8A 84 3D ?? ?? ?? ?? E8 ?? ?? ?? ?? 66 89 85 
            ?? ?? ?? ?? EB ?? C6 85 ?? ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? B9 
            ?? ?? ?? ?? E8 
        }
        
        $raw_socket_connection_1_4 = {
            8B 55 ?? 8B C6 E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 6A ?? 8D 85 ?? ?? ?? ?? 50 8B 45 ?? 8B 
            00 50 E8 ?? ?? ?? ?? 40 75 ?? C6 85 ?? ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? 8D 95 ?? 
            ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8B C6 E8 ?? ?? ?? ?? 8B 45 ?? 8B 00 
            50 E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? C7 
            45 ?? ?? ?? ?? ?? 8D 45 ?? 50 8D 85 ?? ?? ?? ?? 50 8B 45 ?? 8B 00 50 E8 
        }
        
        $raw_socket_connection_1_5 = {
            C6 85 ?? ?? ?? ?? ?? 8A 85 ?? ?? ?? ?? 88 85 ?? ?? ?? ?? 8A 85 ?? ?? ?? ?? 88 85 ?? 
            ?? ?? ?? 8A 85 ?? ?? ?? ?? 88 85 ?? ?? ?? ?? 8A 85 ?? ?? ?? ?? 88 85 ?? ?? ?? ?? 66 
            8B 85 ?? ?? ?? ?? 8B D0 66 81 E2 ?? ?? 88 95 ?? ?? ?? ?? 0F B7 C0 C1 E8 ?? 88 85 ?? 
            ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8D 85 ?? 
            ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 6A ?? 6A ?? 8D 85 ?? ?? ?? ?? 50 56 E8 ?? ?? 
            ?? ?? 40 74 ?? B3 ?? EB ?? C6 85 ?? ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? 8D 95 ?? ?? 
            ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8B C6 E8 ?? ?? ?? ?? 33 C0 5A 59 59 64 
            89 10 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 45 ?? E8 ?? 
            ?? ?? ?? C3 
        }
        
        $file_search_1_1 = {
            55 8B EC 81 C4 ?? ?? ?? ?? 53 56 57 89 55 ?? 89 45 ?? 8B 45 ?? 89 45 ?? 68 ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 8B F0 85 F6 74 ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 89 C3 85 DB 74 
            ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 8B 45 ?? 50 FF D3 85 C0 74 ?? 8B 45 ?? 50 8D 
            85 ?? ?? ?? ?? 50 8B 45 ?? 50 E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8B 45 ?? 80 38 ?? 75 ?? 
            8B 45 ?? 80 78 ?? ?? 0F 85 ?? ?? ?? ?? 8B 45 ?? 83 C0 ?? E8  
        }
        
        $file_search_1_2 = {
            8B F0 80 3E ?? 0F 84 ?? ?? ?? ?? 8D 46 ?? E8 ?? ?? ?? ?? 8B F0 80 3E ?? 0F 84 ?? ?? 
            ?? ?? EB ?? 8B 75 ?? 83 C6 ?? 8B DE 2B 5D ?? 8D 43 ?? 50 8B 45 ?? 50 8D 85 ?? ?? ?? 
            ?? 50 E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8D 46 ?? E8 ?? ?? ?? ?? 8B F8 8B C7 2B C6 8B D0 
            03 D3 42 81 FA ?? ?? ?? ?? 0F 8F ?? ?? ?? ?? 40 50 56 8D 85 ?? ?? ?? ?? 03 C3 50 E8 
            ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 8D 85 ?? ?? ?? ?? 50 E8  
        }

        $file_search_1_3 = {
            8B F0 83 FE ?? 74 ?? 56 E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8D 53 ?? 
            03 C2 40 3D ?? ?? ?? ?? 7F ?? C6 84 1D ?? ?? ?? ?? ?? B8 ?? ?? ?? ?? 2B C3 48 50 8D 
            85 ?? ?? ?? ?? 50 8D 85 ?? ?? ?? ?? 03 C3 40 50 E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 
            E8 ?? ?? ?? ?? 40 03 D8 8B F7 80 3E ?? 0F 85 ?? ?? ?? ?? 8B 45 ?? 50 8D 85 ?? ?? ?? 
            ?? 50 8B 45 ?? 50 E8 ?? ?? ?? ?? 8B 45 ?? 5F 5E 5B 8B E5 5D C3 
        }

        $raw_socket_connection_2 = {
            55 8B EC 83 C4 ?? 53 56 8B F2 89 45 ?? 8B 45 ?? E8 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? 
            ?? 64 FF 30 64 89 20 6A ?? 6A ?? 6A ?? E8 ?? ?? ?? ?? 8B D8 83 FB ?? 74 ?? 8D 45 ?? 
            33 C9 BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 66 C7 45 ?? ?? ?? 8B C6 86 E0 66 89 45 ?? 8B 45 
            ?? E8 ?? ?? ?? ?? 89 45 ?? 6A ?? 8D 45 ?? 50 53 E8 ?? ?? ?? ?? 85 C0 74 ?? 8B C3 E8 
            ?? ?? ?? ?? 83 CB ?? 33 C0 5A 59 59 64 89 10 68 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? 
            C3 
        }
    
    condition:
        uint16(0) == 0x5A4D and
        (($http_connection_1 and $file_search_1_1 and $file_search_1_2 and $file_search_1_3 and $raw_socket_connection_1_1 and 
        $raw_socket_connection_1_2 and $raw_socket_connection_1_3 and $raw_socket_connection_1_4 and $raw_socket_connection_1_5) or 
        ($raw_socket_connection_2 and $file_search_1_1 and $file_search_1_2 and $file_search_1_3))
}