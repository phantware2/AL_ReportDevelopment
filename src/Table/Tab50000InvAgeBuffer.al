table 50000 "Inventory Age Buffer"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20]) { TableRelation = Item; }
        field(2; "Description"; Text[100]) { }
        field(3; "Location Code"; Code[10]) { TableRelation = Location; }
        field(4; "Item Category"; Code[30]) { TableRelation = "Item Category"; }
        field(5; "Inventory Posting Group"; Code[30]) { TableRelation = "Inventory Posting Group"; }
        field(6; PostingDate; Date) { }
        field(7; Today; Date) { }
        field(10; "Qty 0-30"; Decimal) { }
        field(11; "Qty 31-60"; Decimal) { }
        field(12; "Qty 61-90"; Decimal) { }
        field(13; "Qty 91-120"; Decimal) { }
        field(14; "Qty 121-150"; Decimal) { }
        field(15; "Qty 151-180"; Decimal) { }
        field(16; "Qty 181+"; Decimal) { }
        field(20; "Val 0-30"; Decimal) { }
        field(21; "Val 31-60"; Decimal) { }
        field(22; "Val 61-90"; Decimal) { }
        field(24; "val 91-120"; Decimal) { }
        field(25; "val 121-150"; Decimal) { }
        field(26; "val 151-180"; Decimal) { }
        field(27; "val 181+"; Decimal) { }
        field(30; "Total Qty"; Decimal) { }
        field(31; "Total Value"; Decimal) { }
    }

    keys
    {
        key(PK; "Item No.", "Location Code", "Item Category") { Clustered = true; }
    }
}