
rule OpenCL : notable {
	meta:
		description = "support for OpenCL"
	strings:
		$ref = "OpenCL" fullword
	condition:
		any of them
}