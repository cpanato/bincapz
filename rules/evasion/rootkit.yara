rule diamorphine_linux_kernel_rootkit : critical {
  meta:
    ref = "https://github.com/m0nad/Diamorphine"
    hash_2022_LQvKibDTq4_diamorphine = "aec68cfa75b582616c8fbce22eecf463ddb0c09b692a1b82a8de23fb0203fede"
    hash_2023_LQvKibDTq4_diamorphine = "e93e524797907d57cb37effc8ebe14e6968f6bca899600561971e39dfd49831d"
    hash_2023_LQvKibDTq4_diamorphine = "d83f43f47c1438d900143891e7a542d1d24f9adcbd649b7698d8ee7585068039"
    hash_2023_hf_tar_diamorphine = "19bab35afb1accd6004e648540643a114c5cfdf572564ad0b12668db46b167b2"
    hash_2023_Linux_Malware_Samples_5d63 = "5d637915abc98b21f94b0648c552899af67321ab06fb34e33339ae38401734cf"
  strings:
    $pfx_hacked_getdents = "hacked_getdents"
    $pfx_give_root = "give_root"
    $pfx_hacked_kill = "hacked_kill"
    $pfx_module_show = "module_show"
  condition:
    3 of them
}

rule linux_kernel_module_getdents64 : critical {
  meta:
    ref = "https://github.com/m0nad/Diamorphine"
    hash_2022_LQvKibDTq4_diamorphine = "aec68cfa75b582616c8fbce22eecf463ddb0c09b692a1b82a8de23fb0203fede"
    hash_2023_LQvKibDTq4_diamorphine = "e93e524797907d57cb37effc8ebe14e6968f6bca899600561971e39dfd49831d"
    hash_2023_LQvKibDTq4_diamorphine = "d83f43f47c1438d900143891e7a542d1d24f9adcbd649b7698d8ee7585068039"
    hash_2023_hf_tar_diamorphine = "19bab35afb1accd6004e648540643a114c5cfdf572564ad0b12668db46b167b2"
  strings:
    $getdents64 = "getdents64"
    $register_kprobe = "register_kprobe"
  condition:
    all of them
}

rule funky_high_signal_killer : suspicious {
  meta:
	description = "Uses high signals to communicate to a rootkit"
    hash_2023_QubitStrike_mi = "9a5f6318a395600637bd98e83d2aea787353207ed7792ec9911b775b79443dcd"
  strings:
    $odd_teen_sig = /kill -1[012346789]/ fullword
	// limit is 64
    $high_sig = /kill -[23456]\d/ fullword
  condition:
    any of them
}
