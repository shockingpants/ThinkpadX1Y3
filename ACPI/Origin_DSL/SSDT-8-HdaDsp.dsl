/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-8-HdaDsp.aml, Fri Oct  5 12:16:07 2018
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000184 (388)
 *     Revision         0x02
 *     Checksum         0xD2
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "HdaDsp"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "LENOVO", "HdaDsp", 0x00000000)
{
    External (_SB_.PCI0.HDAS, DeviceObj)    // (from opcode)
    External (ADPM, IntObj)    // (from opcode)
    External (AG1H, IntObj)    // (from opcode)
    External (AG1L, IntObj)    // (from opcode)
    External (AG2H, IntObj)    // (from opcode)
    External (AG2L, IntObj)    // (from opcode)
    External (AG3H, IntObj)    // (from opcode)
    External (AG3L, IntObj)    // (from opcode)

    Scope (\_SB.PCI0.HDAS)
    {
        Method (PPMS, 1, Serialized)
        {
            If (LEqual (Arg0, ToUUID ("7c708106-3aff-40fe-88be-8c999b3f7445")))
            {
                Return (And (ADPM, 0x04))
            }

            If (LEqual (Arg0, ToUUID ("849f0d73-1678-4d57-8c78-61c548253993")))
            {
                Return (And (ADPM, 0x08))
            }

            If (LEqual (Arg0, ToUUID ("ec774fa9-28d3-424a-90e4-69f984f1eeb7")))
            {
                Return (And (ADPM, 0x0100))
            }

            If (LEqual (Arg0, ToUUID ("7111001f-d35f-44d9-81d2-7ac685bed3d7")))
            {
                Return (And (ADPM, 0x2000))
            }

            If (LEqual (Arg0, ACCG (AG1L, AG1H)))
            {
                Return (And (ADPM, 0x20000000))
            }

            If (LEqual (Arg0, ACCG (AG2L, AG2H)))
            {
                Return (And (ADPM, 0x40000000))
            }

            If (LEqual (Arg0, ACCG (AG3L, AG3H)))
            {
                Return (And (ADPM, 0x80000000))
            }

            Return (Zero)
        }

        Method (ACCG, 2, NotSerialized)
        {
            Name (GBUF, Buffer (0x10){})
            Concatenate (Arg0, Arg1, GBUF)
            Return (GBUF)
        }
    }
}

