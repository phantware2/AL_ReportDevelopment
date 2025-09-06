page 50000 "Inventory Age Buffer List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Inventory Age Buffer";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Item No."; Rec."Item No.") { }
                field("Description"; Rec."Description") { }
                field("Location Code"; Rec."Location Code") { }
                field(Today; Rec.Today) { }
                field(PostingDate; Rec.PostingDate) { }
                field("Item Category"; Rec."Item Category") { }
                field("Inventory Posting Group"; Rec."Inventory Posting Group") { }
                field("Qty 0-30"; Rec."Qty 0-30") { }
                field("Qty 31-60"; Rec."Qty 31-60") { }
                field("Qty 61-90"; Rec."Qty 61-90") { }
                field("Qty 91-120"; Rec."Qty 91-120") { }
                field("Qty 121-150"; Rec."Qty 121-150") { }
                field("Qty 151-180"; Rec."Qty 151-180") { }
                field("Qty 181-210"; Rec."Qty 181-210") { }
                field("Qty 210-240"; Rec."Qty 210-240") { }
                field("Qty 240-270"; Rec."Qty 240-270") { }
                field("Qty 270-300"; Rec."Qty 270-300") { }
                field("Val 0-30"; Rec."Val 0-30") { }
                field("Val 31-60"; Rec."Val 31-60") { }
                field("Val 61-90"; Rec."Val 61-90") { }
                field("val 91-120"; Rec."val 91-120") { }
                field("val 121-150"; Rec."val 121-150") { }
                field("val 151-180"; Rec."val 151-180") { }
                field("val 181-210"; Rec."val 181-210") { }
                field("val 210-240"; Rec."val 210-240") { }
                field("val 240-270"; Rec."val 240-270") { }
                field("val 270-300"; Rec."val 270-300") { }
                field("Total Qty"; Rec."Total Qty") { }
                field("Total Value"; Rec."Total Value") { }
            }
        }
    }
}